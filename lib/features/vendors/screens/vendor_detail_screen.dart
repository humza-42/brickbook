import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/router/route_names.dart';
import '../providers/vendor_providers.dart';
import '../data/models/vendor_models.dart';
import '../data/vendor_repository.dart';

class VendorDetailScreen extends ConsumerWidget {
  final String vendorId;
  const VendorDetailScreen({super.key, required this.vendorId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(vendorSummaryProvider(vendorId));
    return summary.when(
      data: (s) => _VendorDetailBody(summary: s),
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
    );
  }
}

class _VendorDetailBody extends ConsumerWidget {
  final VendorSummary summary;
  const _VendorDetailBody({required this.summary});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final v = summary.vendor;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: AppColors.primaryDark,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: () => context.push(Routes.addVendor, extra: v),
              ),
              PopupMenuButton<String>(
                onSelected: (val) async {
                  if (val == 'delete') {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Delete Vendor?'),
                        content: const Text('Expenses linked to this vendor will not be deleted.'),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text('Delete', style: TextStyle(color: AppColors.error)),
                          ),
                        ],
                      ),
                    );
                    if (confirm == true) {
                      await ref.read(vendorRepositoryProvider).deleteVendor(v.id);
                      if (context.mounted) context.pop();
                    }
                  }
                },
                itemBuilder: (_) => [
                  const PopupMenuItem(value: 'delete', child: Text('Delete Vendor',
                      style: TextStyle(color: AppColors.error))),
                ],
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(background: _VendorHero(vendor: v)),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppDim.pageHPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _VendorKpiRow(summary: summary),
                  const SizedBox(height: AppDim.base),
                  if (v.phone != null || v.email != null || v.address != null)
                    _ContactCard(vendor: v),
                  if (v.notes != null && v.notes!.isNotEmpty) ...[
                    const SizedBox(height: AppDim.base),
                    _NotesCard(notes: v.notes!),
                  ],
                  const SizedBox(height: AppDim.xl),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('Transaction History', style: AppText.h4),
                    Text('${summary.transactions.length} total', style: AppText.caption),
                  ]),
                  const SizedBox(height: AppDim.sm),
                  if (summary.transactions.isEmpty)
                    _EmptyTransactions()
                  else
                    ...summary.transactions.map((t) => _TransactionRow(transaction: t)),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: v.phone != null
          ? Column(mainAxisSize: MainAxisSize.min, children: [
              FloatingActionButton.small(
                heroTag: 'wa',
                onPressed: () async {
                  final url = Uri.parse('whatsapp://send?phone=${v.phone}');
                  if (await canLaunchUrl(url)) await launchUrl(url);
                },
                backgroundColor: const Color(0xFF25D366),
                child: const Icon(Icons.message_outlined, color: Colors.white),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
                heroTag: 'call',
                onPressed: () async {
                  final url = Uri.parse('tel:${v.phone}');
                  if (await canLaunchUrl(url)) await launchUrl(url);
                },
                backgroundColor: AppColors.primary,
                child: const Icon(Icons.call_rounded, color: Colors.white),
              ),
            ])
          : null,
    );
  }
}

class _VendorHero extends StatelessWidget {
  final VendorModel vendor;
  const _VendorHero({required this.vendor});

  String get _initials {
    final parts = vendor.name.trim().split(' ');
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return vendor.name.substring(0, vendor.name.length.clamp(0, 2)).toUpperCase();
  }

  @override
  Widget build(BuildContext context) => Container(
    decoration: const BoxDecoration(gradient: AppColors.cardGradient),
    child: Stack(children: [
      Positioned.fill(child: CustomPaint(painter: _DiagPainter())),
      Padding(
        padding: EdgeInsets.fromLTRB(AppDim.pageHPadding,
            MediaQuery.of(context).padding.top + 56, AppDim.pageHPadding, AppDim.xl),
        child: Row(children: [
          Container(
            width: 64, height: 64,
            decoration: BoxDecoration(color: AppColors.accent,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: AppColors.accent.withOpacity(0.3),
                    blurRadius: 16, offset: const Offset(0, 4))]),
            child: Center(child: Text(_initials,
                style: const TextStyle(fontFamily: 'Sora', fontSize: 22,
                    fontWeight: FontWeight.w700, color: Colors.white))),
          ),
          const SizedBox(width: AppDim.base),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(vendor.name, style: const TextStyle(fontFamily: 'Sora',
                  fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white), maxLines: 2),
              const SizedBox(height: 4),
              if (vendor.categoryIcon != null)
                Row(children: [
                  Text(vendor.categoryIcon!, style: const TextStyle(fontSize: 14)),
                  const SizedBox(width: 4),
                  Text(vendor.categoryName ?? '', style: TextStyle(fontFamily: 'Sora',
                      fontSize: 13, color: Colors.white.withOpacity(0.7))),
                ]),
            ],
          )),
        ]),
      ),
    ]),
  );
}

class _DiagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = Colors.white.withOpacity(0.04)..strokeWidth = 1;
    for (double i = -size.height; i < size.width + size.height; i += 50) {
      canvas.drawLine(Offset(i, 0), Offset(i + size.height, size.height), p);
    }
  }
  @override bool shouldRepaint(_) => false;
}

class _VendorKpiRow extends StatelessWidget {
  final VendorSummary summary;
  const _VendorKpiRow({required this.summary});

  @override
  Widget build(BuildContext context) => Row(children: [
    _KpiBox(icon: Icons.payments_outlined, label: 'Total Paid',
        value: Formatters.pkrCompact(summary.totalPaid), color: AppColors.primary),
    const SizedBox(width: AppDim.sm),
    _KpiBox(icon: Icons.pending_outlined, label: 'Pending',
        value: Formatters.pkrCompact(summary.pendingAmount),
        color: summary.pendingAmount > 0 ? AppColors.warning : AppColors.success),
    const SizedBox(width: AppDim.sm),
    _KpiBox(icon: Icons.receipt_long_outlined, label: 'Transactions',
        value: '${summary.transactions.length}', color: AppColors.accent),
  ]);
}

class _KpiBox extends StatelessWidget {
  final IconData icon; final String label, value; final Color color;
  const _KpiBox({required this.icon, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) => Expanded(child: Container(
    padding: const EdgeInsets.symmetric(horizontal: AppDim.md, vertical: AppDim.md),
    decoration: BoxDecoration(color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDim.radiusMd),
        border: Border.all(color: AppColors.border)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(icon, color: color, size: 18),
      const SizedBox(height: 6),
      Text(value, style: AppText.moneySm.copyWith(color: color, fontSize: 13),
          maxLines: 1, overflow: TextOverflow.ellipsis),
      Text(label, style: AppText.caption),
    ]),
  ));
}

class _ContactCard extends StatelessWidget {
  final VendorModel vendor;
  const _ContactCard({required this.vendor});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(AppDim.base),
    decoration: BoxDecoration(color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDim.cardRadius),
        border: Border.all(color: AppColors.border)),
    child: Column(children: [
      if (vendor.phone != null)
        _ContactRow(icon: Icons.phone_outlined, label: vendor.phone!,
            onTap: () async {
              final url = Uri.parse('tel:${vendor.phone}');
              if (await canLaunchUrl(url)) await launchUrl(url);
            }),
      if (vendor.phone != null && vendor.email != null)
        const Divider(height: 1, color: AppColors.borderLight),
      if (vendor.email != null)
        _ContactRow(icon: Icons.email_outlined, label: vendor.email!,
            onTap: () async {
              final url = Uri.parse('mailto:${vendor.email}');
              if (await canLaunchUrl(url)) await launchUrl(url);
            }),
      if (vendor.address != null) ...[
        const Divider(height: 1, color: AppColors.borderLight),
        _ContactRow(icon: Icons.location_on_outlined, label: vendor.address!),
      ],
    ]),
  );
}

class _ContactRow extends StatelessWidget {
  final IconData icon; final String label; final VoidCallback? onTap;
  const _ContactRow({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Padding(padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(children: [
        Icon(icon, size: 18, color: AppColors.primary),
        const SizedBox(width: 12),
        Expanded(child: Text(label, style: AppText.bodyMd)),
        if (onTap != null)
          const Icon(Icons.open_in_new_rounded, size: 14, color: AppColors.textTertiary),
      ]),
    ),
  );
}

class _NotesCard extends StatelessWidget {
  final String notes;
  const _NotesCard({required this.notes});

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(AppDim.base),
    decoration: BoxDecoration(color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDim.cardRadius),
        border: Border.all(color: AppColors.border)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        const Icon(Icons.notes_rounded, size: 16, color: AppColors.textTertiary),
        const SizedBox(width: 6),
        Text('Notes', style: AppText.labelLg.copyWith(color: AppColors.textSecondary)),
      ]),
      const SizedBox(height: 8),
      Text(notes, style: AppText.bodyMd),
    ]),
  );
}

class _TransactionRow extends StatelessWidget {
  final VendorTransaction transaction;
  const _TransactionRow({required this.transaction});

  Color get _statusColor => transaction.paymentStatus == 'paid'
      ? AppColors.success : transaction.paymentStatus == 'pending'
      ? AppColors.warning : AppColors.info;

  String _monthAbbr(int m) => ['Jan','Feb','Mar','Apr','May','Jun',
      'Jul','Aug','Sep','Oct','Nov','Dec'][m - 1];

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: AppDim.sm),
    padding: const EdgeInsets.symmetric(horizontal: AppDim.base, vertical: AppDim.md),
    decoration: BoxDecoration(color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDim.radiusMd),
        border: Border.all(color: AppColors.border)),
    child: Row(children: [
      Container(width: 44, height: 44,
        decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.08),
            borderRadius: BorderRadius.circular(10)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(DateTime.tryParse(transaction.expenseDate)?.day.toString() ?? '--',
              style: const TextStyle(fontFamily: 'Sora', fontSize: 14,
                  fontWeight: FontWeight.w700, color: AppColors.primary)),
          Text(DateTime.tryParse(transaction.expenseDate) != null
              ? _monthAbbr(DateTime.parse(transaction.expenseDate).month) : '--',
              style: const TextStyle(fontFamily: 'Sora', fontSize: 9,
                  color: AppColors.textTertiary)),
        ]),
      ),
      const SizedBox(width: AppDim.md),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(transaction.title, style: AppText.labelLg,
            maxLines: 1, overflow: TextOverflow.ellipsis),
        const SizedBox(height: 3),
        Text(transaction.projectName, style: AppText.caption,
            maxLines: 1, overflow: TextOverflow.ellipsis),
      ])),
      const SizedBox(width: AppDim.sm),
      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Text(Formatters.pkrCompact(transaction.amount),
            style: AppText.moneySm.copyWith(color: AppColors.primary, fontSize: 13)),
        const SizedBox(height: 3),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(color: _statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppDim.radiusFull)),
          child: Text(transaction.paymentStatus ?? 'paid',
              style: TextStyle(fontFamily: 'Sora', fontSize: 9,
                  fontWeight: FontWeight.w600, color: _statusColor)),
        ),
      ]),
    ]),
  );
}

class _EmptyTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(AppDim.xl),
    decoration: BoxDecoration(color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDim.cardRadius),
        border: Border.all(color: AppColors.border)),
    child: Column(children: [
      const Text('📋', style: TextStyle(fontSize: 32)),
      const SizedBox(height: 8),
      Text('No transactions yet', style: AppText.bodyMd),
      const SizedBox(height: 4),
      Text('Link this vendor when adding expenses',
          style: AppText.caption, textAlign: TextAlign.center),
    ]),
  );
}
