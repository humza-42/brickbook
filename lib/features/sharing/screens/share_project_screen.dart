import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:open_filex/open_filex.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/router/route_names.dart';
import '../../../core/widgets/bb_button.dart';
import '../providers/sharing_providers.dart';
import '../data/models/sharing_models.dart';
import '../../projects/providers/project_providers.dart';
import '../../projects/data/models/project_models.dart';

class ShareProjectScreen extends ConsumerWidget {
  final String projectId;
  const ShareProjectScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final project = ref.watch(projectDetailProvider(projectId));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Share Project')),
      body: project.when(
        data: (p) => _ShareBody(project: p),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _ShareBody extends ConsumerWidget {
  final ProjectModel project;
  const _ShareBody({required this.project});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exportState = ref.watch(exportNotifierProvider);

    ref.listen(exportNotifierProvider, (_, state) {
      if (state.isDone && state.file != null) {
        if (context.mounted) {
          _onExportDone(context, ref, state);
        }
      }
      if (state.error != null) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Export failed: ${state.error}'),
                backgroundColor: AppColors.error),
          );
          ref.read(exportNotifierProvider.notifier).reset();
        }
      }
    });

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDim.pageHPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProjectSummaryCard(project: project),
          const SizedBox(height: AppDim.xl),

          _SectionLabel(icon: '⚡', title: 'Instant Share'),
          const SizedBox(height: AppDim.sm),

          _ShareActionTile(
            icon: Icons.message,
            iconColor: const Color(0xFF25D366),
            iconBg: const Color(0xFFE8FBF0),
            title: 'Share via WhatsApp',
            subtitle: 'Send a summary message with project link',
            onTap: () => _shareWhatsApp(context, ref, project),
          ),

          _ShareActionTile(
            icon: Icons.share_outlined,
            iconColor: AppColors.primary,
            iconBg: AppColors.primary.withOpacity(0.08),
            title: 'Share via...',
            subtitle: 'Use any app — Telegram, SMS, Email, etc.',
            onTap: () => _shareGeneral(context, ref, project),
          ),
          const SizedBox(height: AppDim.xl),

          _SectionLabel(icon: '🔗', title: 'Guest Access'),
          const SizedBox(height: AppDim.sm),

          _ShareActionTile(
            icon: Icons.link_rounded,
            iconColor: AppColors.accent,
            iconBg: AppColors.accent.withOpacity(0.1),
            title: 'Generate Guest Link',
            subtitle: 'Create a view-only link — no account needed',
            trailing: const Icon(Icons.arrow_forward_ios_rounded,
                size: 14, color: AppColors.textTertiary),
            onTap: () => _showCreateLinkSheet(context, ref),
          ),

          _ShareActionTile(
            icon: Icons.manage_search_rounded,
            iconColor: AppColors.primaryLight,
            iconBg: AppColors.primaryLight.withOpacity(0.1),
            title: 'Manage Guest Links',
            subtitle: 'View, copy, and revoke active links',
            trailing: const Icon(Icons.arrow_forward_ios_rounded,
                size: 14, color: AppColors.textTertiary),
            onTap: () => context.push(
                Routes.guestLinks.replaceFirst(':id', project.id)),
          ),
          const SizedBox(height: AppDim.xl),

          _SectionLabel(icon: '📄', title: 'Export Reports'),
          const SizedBox(height: AppDim.sm),

          _ExportTile(
            icon: Icons.picture_as_pdf_rounded,
            iconColor: const Color(0xFFE53935),
            iconBg: const Color(0xFFFDECEA),
            title: 'Export PDF Report',
            subtitle: 'Full expense report with charts & summary',
            isLoading: exportState.isLoading &&
                exportState.exportType == 'pdf',
            onTap: () => ref.read(exportNotifierProvider.notifier)
                .exportPdf(project.id),
          ),

          _ExportTile(
            icon: Icons.table_chart_outlined,
            iconColor: const Color(0xFF2E7D52),
            iconBg: const Color(0xFFEAF7EE),
            title: 'Export Excel',
            subtitle: 'Raw expense data as spreadsheet (.xlsx)',
            isLoading: exportState.isLoading &&
                exportState.exportType == 'excel',
            onTap: () => ref.read(exportNotifierProvider.notifier)
                .exportExcel(project.id),
          ),
          const SizedBox(height: AppDim.xl),

          _SectionLabel(icon: '📧', title: 'Email Report'),
          const SizedBox(height: AppDim.sm),

          _ShareActionTile(
            icon: Icons.email_outlined,
            iconColor: AppColors.primary,
            iconBg: AppColors.primary.withOpacity(0.08),
            title: 'Send Email Report',
            subtitle: 'Deliver PDF report to any email address',
            trailing: const Icon(Icons.arrow_forward_ios_rounded,
                size: 14, color: AppColors.textTertiary),
            onTap: () => _showEmailSheet(context, ref),
          ),
          const SizedBox(height: AppDim.xxl),
        ],
      ),
    );
  }

  void _onExportDone(BuildContext context, WidgetRef ref, ExportState state) {
    ref.read(exportNotifierProvider.notifier).reset();
    showModalBottomSheet(
      context: context,
      builder: (_) => _ExportSuccessSheet(
        file: state.file!,
        exportType: state.exportType ?? 'pdf',
        projectName: project.name,
      ),
    );
  }

  Future<void> _shareWhatsApp(BuildContext context, WidgetRef ref, ProjectModel p) async {
    final pct = p.totalBudget > 0
        ? ((p.totalSpent / p.totalBudget) * 100).toStringAsFixed(0)
        : '0';
    final msg = Uri.encodeComponent(
      '🧱 *BrickBook - ${p.name}*\n\n'
      '📊 Budget: Rs. ${_fmt(p.totalBudget)}\n'
      '💸 Spent: Rs. ${_fmt(p.totalSpent)}\n'
      '✅ Remaining: Rs. ${_fmt(p.remaining)}\n'
      '📈 Used: $pct%\n\n'
      '${p.location != null ? '📍 ${p.location}\n\n' : ''}'
      'Track all expenses on BrickBook 🧱',
    );
    final url = Uri.parse('whatsapp://send?text=$msg');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('WhatsApp is not installed')),
        );
      }
    }
  }

  Future<void> _shareGeneral(BuildContext context, WidgetRef ref, ProjectModel p) async {
    final pct = p.totalBudget > 0
        ? ((p.totalSpent / p.totalBudget) * 100).toStringAsFixed(0)
        : '0';
    await Share.share(
      '🧱 BrickBook — ${p.name}\n\n'
      'Budget: Rs. ${_fmt(p.totalBudget)}\n'
      'Spent: Rs. ${_fmt(p.totalSpent)}\n'
      'Remaining: Rs. ${_fmt(p.remaining)}\n'
      'Budget used: $pct%\n\n'
      'Track your construction expenses with BrickBook.',
      subject: 'BrickBook Report — ${p.name}',
    );
  }

  void _showCreateLinkSheet(BuildContext context, WidgetRef ref) {
    if (!context.mounted) return;
    ref.read(createLinkNotifierProvider.notifier).reset();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _CreateLinkSheet(projectId: project.id),
    );
  }

  void _showEmailSheet(BuildContext context, WidgetRef ref) {
    if (!context.mounted) return;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _EmailReportSheet(projectId: project.id),
    );
  }

  String _fmt(double v) {
    if (v >= 1000000) return '${(v / 1000000).toStringAsFixed(1)}M';
    if (v >= 1000)    return '${(v / 1000).toStringAsFixed(0)}K';
    return v.toStringAsFixed(0);
  }
}

class _ProjectSummaryCard extends StatelessWidget {
  final ProjectModel project;
  const _ProjectSummaryCard({required this.project});

  @override
  Widget build(BuildContext context) {
    final pct = project.percentUsed;
    final barColor = project.isOverBudget ? AppColors.error
        : pct > 0.85 ? AppColors.warning
        : AppColors.success;

    return Container(
      padding: const EdgeInsets.all(AppDim.base),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [AppColors.primaryDark, AppColors.primary],
        ),
        borderRadius: BorderRadius.circular(AppDim.cardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Text('🧱', style: TextStyle(fontSize: 20)),
            const SizedBox(width: 8),
            Expanded(child: Text(project.name,
                style: const TextStyle(fontFamily: 'Sora', fontSize: 16,
                    fontWeight: FontWeight.w700, color: Colors.white),
                maxLines: 1, overflow: TextOverflow.ellipsis)),
          ]),
          const SizedBox(height: AppDim.base),
          Row(children: [
            _SummaryItem(label: 'Budget',    value: 'Rs. ${_fmt(project.totalBudget)}'),
            _SummaryItem(label: 'Spent',     value: 'Rs. ${_fmt(project.totalSpent)}'),
            _SummaryItem(label: 'Remaining', value: 'Rs. ${_fmt(project.remaining)}',
                valueColor: project.isOverBudget ? AppColors.error : AppColors.accentLight),
          ]),
          const SizedBox(height: AppDim.sm),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: pct,
              minHeight: 5,
              backgroundColor: Colors.white.withOpacity(0.15),
              valueColor: AlwaysStoppedAnimation<Color>(barColor),
            ),
          ),
        ],
      ),
    );
  }

  String _fmt(double v) {
    if (v >= 1000000) return '${(v / 1000000).toStringAsFixed(1)}M';
    if (v >= 1000)    return '${(v / 1000).toStringAsFixed(0)}K';
    return v.toStringAsFixed(0);
  }
}

class _SummaryItem extends StatelessWidget {
  final String label, value;
  final Color? valueColor;
  const _SummaryItem({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) => Expanded(child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: TextStyle(fontFamily: 'Sora', fontSize: 10,
          color: Colors.white.withOpacity(0.6))),
      Text(value, style: TextStyle(fontFamily: 'Sora', fontSize: 13,
          fontWeight: FontWeight.w600,
          color: valueColor ?? Colors.white)),
    ],
  ));
}

class _SectionLabel extends StatelessWidget {
  final String icon, title;
  const _SectionLabel({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) => Row(children: [
    Text(icon, style: const TextStyle(fontSize: 16)),
    const SizedBox(width: 8),
    Text(title, style: AppText.h4.copyWith(color: AppColors.primary)),
    const SizedBox(width: 8),
    Expanded(child: Divider(color: AppColors.border, thickness: 1)),
  ]);
}

class _ShareActionTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor, iconBg;
  final String title, subtitle;
  final VoidCallback onTap;
  final Widget? trailing;
  const _ShareActionTile({
    required this.icon, required this.iconColor, required this.iconBg,
    required this.title, required this.subtitle, required this.onTap, this.trailing,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(bottom: AppDim.sm),
      padding: const EdgeInsets.symmetric(
          horizontal: AppDim.base, vertical: AppDim.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDim.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(children: [
        Container(
          width: 44, height: 44,
          decoration: BoxDecoration(color: iconBg,
              borderRadius: BorderRadius.circular(AppDim.radiusSm)),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        const SizedBox(width: AppDim.md),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppText.labelLg),
            const SizedBox(height: 2),
            Text(subtitle, style: AppText.caption),
          ],
        )),
        trailing ?? const Icon(Icons.chevron_right_rounded,
            color: AppColors.textTertiary),
      ]),
    ),
  );
}

class _ExportTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor, iconBg;
  final String title, subtitle;
  final bool isLoading;
  final VoidCallback onTap;
  const _ExportTile({
    required this.icon, required this.iconColor, required this.iconBg,
    required this.title, required this.subtitle,
    required this.isLoading, required this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: isLoading ? null : onTap,
    child: Container(
      margin: const EdgeInsets.only(bottom: AppDim.sm),
      padding: const EdgeInsets.symmetric(
          horizontal: AppDim.base, vertical: AppDim.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDim.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(children: [
        Container(
          width: 44, height: 44,
          decoration: BoxDecoration(color: iconBg,
              borderRadius: BorderRadius.circular(AppDim.radiusSm)),
          child: isLoading
              ? const Center(child: SizedBox(width: 20, height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2,
                      color: AppColors.primary)))
              : Icon(icon, color: iconColor, size: 22),
        ),
        const SizedBox(width: AppDim.md),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppText.labelLg),
            const SizedBox(height: 2),
            Text(subtitle, style: AppText.caption),
          ],
        )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppDim.radiusFull),
          ),
          child: Text('Export', style: AppText.labelSm.copyWith(color: iconColor)),
        ),
      ]),
    ),
  );
}

// === Bottom Sheets ===

class _ExportSuccessSheet extends StatelessWidget {
  final File file;
  final String exportType;
  final String projectName;
  const _ExportSuccessSheet({
    required this.file,
    required this.exportType,
    required this.projectName,
  });

  @override
  Widget build(BuildContext context) {
    final isPdf = exportType == 'pdf';
    return Container(
      padding: const EdgeInsets.all(AppDim.base),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppDim.radiusXl)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48, height: 48,
            decoration: BoxDecoration(
              color: AppColors.successLight,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check_rounded,
                color: AppColors.success, size: 28),
          ),
          const SizedBox(height: AppDim.md),
          Text('Export Complete', style: AppText.h3),
          const SizedBox(height: AppDim.xs),
          Text('${isPdf ? 'PDF' : 'Excel'} saved for $projectName',
              style: AppText.bodyMd.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: AppDim.lg),
          Row(children: [
            Expanded(child: BBButton(
              label: 'Open File',
              icon: Icons.open_in_new_rounded,
              onPressed: () async {
                await OpenFilex.open(file.path);
                Navigator.pop(context);
              },
            )),
            const SizedBox(width: AppDim.md),
            Expanded(child: BBButton(
              label: 'Share',
              icon: Icons.share_rounded,
              isOutlined: true,
              onPressed: () {
                Share.shareXFiles([XFile(file.path)],
                    text: '${isPdf ? 'PDF' : 'Excel'} report for $projectName');
                Navigator.pop(context);
              },
            )),
          ]),
          const SizedBox(height: AppDim.md),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close', style: AppText.labelLg.copyWith(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }
}

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

class _EmailReportSheet extends ConsumerStatefulWidget {
  final String projectId;
  const _EmailReportSheet({required this.projectId});

  @override
  ConsumerState<_EmailReportSheet> createState() => _EmailReportSheetState();
}

class _EmailReportSheetState extends ConsumerState<_EmailReportSheet> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _msgCtrl   = TextEditingController();
  bool _sent = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _msgCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailState = ref.watch(emailReportNotifierProvider);

    // Listen for send success
     ref.listen<EmailReportState>(emailReportNotifierProvider, (prev, curr) {
       if (curr.isSent && !(prev?.isSent ?? false)) {
         setState(() => _sent = true);
         // Reset after delay
         Future.delayed(const Duration(seconds: 2), () {
           if (mounted) Navigator.pop(context);
         });
       }
     });

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
              const Text('📧', style: TextStyle(fontSize: 24)),
              const SizedBox(width: AppDim.sm),
              Text('Send Email Report', style: AppText.h3),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ]),
            const Divider(height: AppDim.xl),
            if (!_sent) ...[
              TextFormField(
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Recipient Email',
                  hintText: 'example@email.com',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Email required';
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v)) return 'Invalid email';
                  return null;
                },
              ),
              const SizedBox(height: AppDim.md),
              TextFormField(
                controller: _msgCtrl,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Message (optional)',
                  hintText: 'Add a personal note...',
                  prefixIcon: Icon(Icons.message_outlined),
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: AppDim.lg),
              if (emailState.error != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: AppDim.md),
                  child: Text(emailState.error!,
                      style: AppText.bodySm.copyWith(color: AppColors.error)),
                ),
              BBButton(
                label: emailState.isLoading ? 'Sending...' : 'Send Report',
                icon: Icons.send_rounded,
                isLoading: emailState.isLoading,
                onPressed: emailState.isLoading ? null : () {
                  if (_formKey.currentState!.validate()) {
                    ref.read(emailReportNotifierProvider.notifier).send(
                      widget.projectId,
                      _emailCtrl.text.trim(),
                      _msgCtrl.text.trim().isEmpty ? null : _msgCtrl.text.trim(),
                    );
                  }
                },
              ),
            ] else ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppDim.xl),
                child: Column(children: [
                  const Icon(Icons.check_circle_rounded,
                      color: AppColors.success, size: 64),
                  const SizedBox(height: AppDim.md),
                  Text('Report Sent!', style: AppText.h3),
                  const SizedBox(height: AppDim.sm),
                  Text('The email has been delivered successfully.',
                      textAlign: TextAlign.center,
                      style: AppText.bodyMd.copyWith(color: AppColors.textSecondary)),
                ]),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
