import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../providers/sharing_providers.dart';
import '../data/models/sharing_models.dart';
import '../data/sharing_repository.dart';
import '../../../core/widgets/bb_button.dart';

class GuestLinkScreen extends ConsumerWidget {
  final String projectId;
  const GuestLinkScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final links = ref.watch(guestLinksProvider(projectId));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Guest Links')),
      body: links.when(
        data: (list) {
          if (list.isEmpty) return _EmptyLinks(
            onGenerate: () => _showCreateSheet(context, projectId, ref),
          );
          return ListView.builder(
            padding: const EdgeInsets.all(AppDim.pageHPadding),
            itemCount: list.length,
            itemBuilder: (_, i) => _GuestLinkCard(
              link: list[i],
              projectId: projectId,
              onRevoke: () async {
                await ref.read(sharingRepositoryProvider)
                    .revokeGuestLink(projectId, list[i].id);
                ref.invalidate(guestLinksProvider(projectId));
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateSheet(context, projectId, ref),
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_link_rounded),
        label: const Text('New Link'),
      ),
    );
  }

  void _showCreateSheet(BuildContext context, String projectId, WidgetRef ref) {
    if (!context.mounted) return;
    ref.read(createLinkNotifierProvider.notifier).reset();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _CreateLinkSheet(projectId: projectId),
    );
  }
}

class _GuestLinkCard extends StatefulWidget {
  final GuestLink link;
  final String projectId;
  final VoidCallback onRevoke;
  const _GuestLinkCard({required this.link, required this.projectId,
      required this.onRevoke});

  @override
  State<_GuestLinkCard> createState() => _GuestLinkCardState();
}

class _GuestLinkCardState extends State<_GuestLinkCard> {
  bool _copied = false;

  Future<void> _copy() async {
    await Clipboard.setData(ClipboardData(text: widget.link.url));
    setState(() => _copied = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _copied = false);
  }

  @override
  Widget build(BuildContext context) {
    final link    = widget.link;
    final expired = link.isExpired;
    final revoked = !link.isActive;

    return Container(
      margin: const EdgeInsets.only(bottom: AppDim.sm),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDim.cardRadius),
        border: Border.all(
          color: expired || revoked ? AppColors.border.withOpacity(0.5)
              : AppColors.border,
        ),
      ),
      child: Column(
        children: [
          // Header row
          Container(
            padding: const EdgeInsets.all(AppDim.base),
            decoration: BoxDecoration(
              color: expired || revoked
                  ? AppColors.surfaceVariant
                  : AppColors.primary.withOpacity(0.04),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppDim.cardRadius),
                topRight: Radius.circular(AppDim.cardRadius),
              ),
            ),
            child: Row(children: [
              Icon(
                link.accessLevel == 'full'
                    ? Icons.bar_chart_rounded
                    : Icons.summarize_outlined,
                color: expired || revoked
                    ? AppColors.textTertiary
                    : AppColors.primary,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                link.accessLevel == 'full' ? 'Full Access' : 'Summary Only',
                style: AppText.labelLg.copyWith(
                    color: expired || revoked
                        ? AppColors.textTertiary
                        : AppColors.primary),
              ),
              const Spacer(),
              _StatusBadge(link: link),
            ]),
          ),

          // URL + meta
          Padding(
            padding: const EdgeInsets.all(AppDim.base),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(link.url,
                    style: AppText.caption.copyWith(
                        color: expired || revoked
                            ? AppColors.textTertiary
                            : AppColors.textSecondary),
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: AppDim.sm),
                Row(children: [
                  _MetaChip(
                      icon: Icons.visibility_outlined,
                      label: '${link.viewCount} views'),
                  const SizedBox(width: 6),
                  _MetaChip(
                      icon: Icons.schedule_rounded,
                      label: link.expiryLabel),
                  if (link.isPasswordProtected) ...[
                    const SizedBox(width: 6),
                    _MetaChip(icon: Icons.lock_outline, label: 'Protected'),
                  ],
                ]),
                const SizedBox(height: AppDim.sm),

                // Action buttons
                if (!expired && link.isActive) Row(children: [
                  Expanded(child: _SmallBtn(
                    icon: _copied ? Icons.check_rounded : Icons.copy_rounded,
                    label: _copied ? 'Copied!' : 'Copy',
                    color: _copied ? AppColors.success : AppColors.primary,
                    onTap: _copy,
                  )),
                  const SizedBox(width: AppDim.sm),
                  Expanded(child: _SmallBtn(
                    icon: Icons.message,
                    label: 'WhatsApp',
                    color: const Color(0xFF25D366),
                    onTap: () async {
                      final msg = Uri.encodeComponent(
                          '🧱 View project: ${link.url}');
                      final url = Uri.parse('whatsapp://send?text=$msg');
                      if (await canLaunchUrl(url)) await launchUrl(url);
                    },
                  )),
                  const SizedBox(width: AppDim.sm),
                  Expanded(child: _SmallBtn(
                    icon: Icons.block_rounded,
                    label: 'Revoke',
                    color: AppColors.error,
                    onTap: () => _confirmRevoke(context),
                  )),
                ]) else
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      revoked ? 'This link has been revoked'
                          : 'This link has expired',
                      style: AppText.caption.copyWith(color: AppColors.error),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _confirmRevoke(BuildContext context) {
    if (!context.mounted) return;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Revoke Link?'),
        content: const Text(
            'Anyone with this link will no longer be able to view the project.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          TextButton(
            onPressed: () { Navigator.pop(context); widget.onRevoke(); },
            child: const Text('Revoke',
                style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final GuestLink link;
  const _StatusBadge({required this.link});

  @override
  Widget build(BuildContext context) {
    final expired = link.isExpired;
    final revoked = !link.isActive;
    final Color color;
    final String label;

    if (revoked) { color = AppColors.error;   label = 'Revoked'; }
    else if (expired) { color = AppColors.warning; label = 'Expired'; }
    else { color = AppColors.success; label = 'Active'; }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(AppDim.radiusFull),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Container(width: 6, height: 6,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 4),
        Text(label,
            style: AppText.labelSm.copyWith(color: color, fontSize: 10)),
      ]),
    );
  }
}

class _MetaChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _MetaChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 12, color: AppColors.textTertiary),
      const SizedBox(width: 3),
      Text(label, style: AppText.caption.copyWith(fontSize: 10)),
    ],
  );
}

class _SmallBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  const _SmallBtn({required this.icon, required this.label,
      required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(AppDim.radiusSm),
        color: color.withOpacity(0.06),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 4),
        Text(label, style: AppText.labelSm.copyWith(color: color, fontSize: 10)),
      ]),
    ),
  );
}

class _EmptyLinks extends StatelessWidget {
  final VoidCallback onGenerate;
  const _EmptyLinks({required this.onGenerate});

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(AppDim.pageHPadding),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('🔗', style: TextStyle(fontSize: 52)),
        const SizedBox(height: 16),
        Text('No guest links yet', style: AppText.h3),
        const SizedBox(height: 8),
        Text('Generate a link to let anyone view this project without an account.',
            textAlign: TextAlign.center,
            style: AppText.bodyMd.copyWith(color: AppColors.textSecondary)),
        const SizedBox(height: AppDim.xl),
        ElevatedButton.icon(
          onPressed: onGenerate,
          icon: const Icon(Icons.add_link_rounded, size: 18),
          label: const Text('Generate First Link'),
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary, foregroundColor: Colors.white),
        ),
      ]),
    ),
  );
}

// === Bottom Sheets ===

class _CreateLinkSheet extends ConsumerStatefulWidget {
  final String projectId;
  const _CreateLinkSheet({required this.projectId});

  @override
  ConsumerState<_CreateLinkSheet> createState() => _CreateLinkSheetState();
}

class _CreateLinkSheetState extends ConsumerState<_CreateLinkSheet> {
  final _formKey = GlobalKey<FormState>();
  final _pwdCtrl = TextEditingController();

  String _accessLevel = 'full';
  String _expiry = '7d';
  bool _includePassword = false;

  @override
  void dispose() {
    _pwdCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final createState = ref.watch(createLinkNotifierProvider);

    // If link created, show success widget
    if (createState.created != null) {
      return _LinkCreatedSheet(link: createState.created!);
    }

    // Form
    return Container(
      padding: EdgeInsets.only(
        top: AppDim.xl,
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: AppDim.base,
        right: AppDim.base,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppDim.radiusXl)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: [
              const Text('🔗', style: TextStyle(fontSize: 24)),
              const SizedBox(width: AppDim.sm),
              Text('Create Guest Link', style: AppText.h3),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ]),
            const Divider(height: AppDim.xl),
            Text('Access Level', style: AppText.labelLg),
            const SizedBox(height: AppDim.sm),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(
                  value: 'full',
                  label: Text('Full Access'),
                  icon: Icon(Icons.bar_chart_rounded),
                ),
                ButtonSegment(
                  value: 'summary',
                  label: Text('Summary Only'),
                  icon: Icon(Icons.summarize_outlined),
                ),
              ],
              selected: {_accessLevel},
              onSelectionChanged: (Set<String> newSelection) {
                setState(() => _accessLevel = newSelection.first);
              },
            ),
            const SizedBox(height: AppDim.lg),
            Text('Expiry', style: AppText.labelLg),
            const SizedBox(height: AppDim.sm),
            DropdownButtonFormField<String>(
              value: _expiry,
              items: kExpiryOptions
                  .map((opt) => DropdownMenuItem(
                        value: opt['value'] as String,
                        child: Text(opt['label'] as String),
                      ))
                  .toList(),
              onChanged: (v) => setState(() => _expiry = v!),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: AppDim.base, vertical: 0),
              ),
            ),
            const SizedBox(height: AppDim.lg),
            Row(children: [
              Checkbox(
                value: _includePassword,
                onChanged: (v) => setState(() => _includePassword = v ?? false),
              ),
              const Text('Protect with password'),
            ]),
            if (_includePassword) ...[
              const SizedBox(height: AppDim.sm),
              TextFormField(
                controller: _pwdCtrl,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline),
                ),
                validator: (v) {
                  if (_includePassword && (v == null || v.length < 6)) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
            ],
            const SizedBox(height: AppDim.lg),
            if (createState.error != null)
              Padding(
                padding: const EdgeInsets.only(bottom: AppDim.md),
                child: Text(createState.error!,
                    style: AppText.bodySm.copyWith(color: AppColors.error)),
              ),
            BBButton(
              label: createState.isLoading ? 'Creating...' : 'Create Link',
              icon: Icons.link_rounded,
              isLoading: createState.isLoading,
              onPressed: createState.isLoading ? null : () {
                if (_formKey.currentState!.validate()) {
                  ref.read(createLinkNotifierProvider.notifier).create(
                    widget.projectId,
                    CreateGuestLinkRequest(
                      accessLevel: _accessLevel,
                      expiresAt: _expiry == 'never' ? null : _expiry,
                      password: _includePassword ? _pwdCtrl.text : null,
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: AppDim.md),
          ],
        ),
      ),
    );
  }
}

class _LinkCreatedSheet extends StatelessWidget {
  final GuestLink link;
  const _LinkCreatedSheet({required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDim.base),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppDim.radiusXl)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle_rounded,
              color: AppColors.success, size: 56),
          const SizedBox(height: AppDim.md),
          Text('Link Created!', style: AppText.h3),
          const SizedBox(height: AppDim.xs),
          Text('Anyone with this link can view your project.',
              textAlign: TextAlign.center,
              style: AppText.bodyMd.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: AppDim.lg),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppDim.base, vertical: AppDim.sm),
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(AppDim.radiusSm),
            ),
            child: Row(children: [
              Expanded(child: Text(link.url,
                  style: AppText.bodySm,
                  overflow: TextOverflow.ellipsis)),
              const SizedBox(width: AppDim.sm),
              TextButton.icon(
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: link.url));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Copied to clipboard')),
                  );
                },
                icon: const Icon(Icons.copy_rounded, size: 16),
                label: const Text('Copy'),
                style: TextButton.styleFrom(foregroundColor: AppColors.primary),
              ),
            ]),
          ),
          const SizedBox(height: AppDim.md),
          Row(children: [
            Expanded(child: BBButton(
              label: 'Share via WhatsApp',
              icon: Icons.message,
              backgroundColor: const Color(0xFF25D366),
              onPressed: () async {
                final msg = Uri.encodeComponent('🧱 View my project: ${link.url}');
                final url = Uri.parse('whatsapp://send?text=$msg');
                if (await canLaunchUrl(url)) await launchUrl(url);
                Navigator.pop(context);
              },
            )),
            const SizedBox(width: AppDim.sm),
            Expanded(child: BBButton(
              label: 'Close',
              icon: Icons.close_rounded,
              isOutlined: true,
              onPressed: () => Navigator.pop(context),
            )),
          ]),
        ],
      ),
    );
  }
}
