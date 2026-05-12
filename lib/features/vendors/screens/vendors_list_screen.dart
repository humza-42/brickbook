import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/router/route_names.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/bb_shimmer.dart';
import '../providers/vendor_providers.dart';
import '../data/models/vendor_models.dart';

class VendorsListScreen extends ConsumerWidget {
  const VendorsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendors = ref.watch(vendorsListProvider);
    final search  = ref.watch(vendorSearchProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Vendors'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded),
            onPressed: () => context.push(Routes.addVendor),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppDim.pageHPadding, AppDim.sm, AppDim.pageHPadding, 0),
            child: TextField(
              onChanged: ref.read(vendorSearchProvider.notifier).set,
              decoration: InputDecoration(
                hintText: 'Search vendors...',
                prefixIcon: const Icon(Icons.search_rounded,
                    color: AppColors.textTertiary),
                filled: true,
                fillColor: AppColors.surface,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDim.radiusMd),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDim.radiusMd),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDim.radiusMd),
                  borderSide: const BorderSide(
                      color: AppColors.primary, width: 2),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppDim.sm),

          Expanded(
            child: vendors.when(
              data: (list) {
                final filtered = search.isEmpty
                    ? list
                    : list.where((v) =>
                        v.name.toLowerCase().contains(search.toLowerCase()) ||
                        (v.phone ?? '').contains(search) ||
                        (v.categoryName ?? '').toLowerCase()
                            .contains(search.toLowerCase())).toList();

                if (filtered.isEmpty) {
                  return _EmptyVendors(
                    hasSearch: search.isNotEmpty,
                    onAdd: () => context.push(Routes.addVendor),
                  );
                }

                final totalPaid =
                    filtered.fold(0.0, (s, v) => s + v.totalPaid);

                return Column(
                  children: [
                    _VendorStatsStrip(
                        count: filtered.length, totalPaid: totalPaid),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.fromLTRB(
                            AppDim.pageHPadding, AppDim.sm,
                            AppDim.pageHPadding, 100),
                        itemCount: filtered.length,
                        itemBuilder: (_, i) => _VendorCard(
                          vendor: filtered[i],
                          index: i,
                          onTap: () => context.push(
                            Routes.vendorDetail
                                .replaceFirst(':id', filtered[i].id),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              loading: () => _VendorListShimmer(),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(Routes.addVendor),
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add Vendor'),
      ),
    );
  }
}

class _VendorStatsStrip extends StatelessWidget {
  final int count;
  final double totalPaid;
  const _VendorStatsStrip({required this.count, required this.totalPaid});

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.fromLTRB(
        AppDim.pageHPadding, 0, AppDim.pageHPadding, AppDim.sm),
    padding: const EdgeInsets.symmetric(
        horizontal: AppDim.base, vertical: AppDim.sm),
    decoration: BoxDecoration(
      color: AppColors.primary.withOpacity(0.06),
      borderRadius: BorderRadius.circular(AppDim.radiusMd),
      border: Border.all(color: AppColors.primary.withOpacity(0.15)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _StripItem(
            icon: Icons.store_outlined,
            label: '$count vendors',
            color: AppColors.primary),
        Container(width: 1, height: 28, color: AppColors.border),
        _StripItem(
            icon: Icons.payments_outlined,
            label: 'Total: ${Formatters.pkrCompact(totalPaid)}',
            color: AppColors.accent),
      ],
    ),
  );
}

class _StripItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _StripItem({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) => Row(children: [
    Icon(icon, size: 16, color: color),
    const SizedBox(width: 6),
    Text(label, style: AppText.labelMd.copyWith(
        color: color, fontWeight: FontWeight.w600)),
  ]);
}

class _VendorCard extends StatelessWidget {
  final VendorModel vendor;
  final int index;
  final VoidCallback onTap;
  const _VendorCard({required this.vendor, required this.index, required this.onTap});

  String get _initials {
    final parts = vendor.name.trim().split(' ');
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return vendor.name.substring(0, vendor.name.length.clamp(0, 2)).toUpperCase();
  }

  Color get _avatarColor {
    final colors = [
      AppColors.primary, AppColors.catMaterials, AppColors.catLabor,
      AppColors.catEquipment, AppColors.catFuel, AppColors.catTransport,
      AppColors.catProfession, AppColors.catSafety,
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder<double>(
    tween: Tween(begin: 0, end: 1),
    duration: Duration(milliseconds: 350 + index * 60),
    curve: Curves.easeOut,
    builder: (_, v, child) => Opacity(
      opacity: v,
      child: Transform.translate(offset: Offset(0, 20 * (1 - v)), child: child),
    ),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppDim.sm),
        padding: const EdgeInsets.all(AppDim.base),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDim.cardRadius),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(children: [
          Container(
            width: 50, height: 50,
            decoration: BoxDecoration(
              color: _avatarColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: Text(_initials,
                style: const TextStyle(fontFamily: 'Sora', fontSize: 16,
                    fontWeight: FontWeight.w700, color: Colors.white))),
          ),
          const SizedBox(width: AppDim.md),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(vendor.name, style: AppText.h4,
                      maxLines: 1, overflow: TextOverflow.ellipsis)),
                  Text(Formatters.pkrCompact(vendor.totalPaid),
                      style: AppText.moneySm.copyWith(
                          color: AppColors.primary, fontSize: 14)),
                ]),
              const SizedBox(height: 3),
              Row(children: [
                if (vendor.categoryIcon != null) ...[
                  Text(vendor.categoryIcon!, style: const TextStyle(fontSize: 12)),
                  const SizedBox(width: 4),
                ],
                Text(vendor.categoryName ?? 'General', style: AppText.caption),
                if (vendor.phone != null) ...[
                  Text(' · ', style: AppText.caption),
                  Text(vendor.phone!, style: AppText.caption),
                ],
              ]),
              const SizedBox(height: 6),
              Row(children: [
                _InfoPill(label: '${vendor.transactionCount} txns'),
                const SizedBox(width: 6),
                _InfoPill(label: '${vendor.projectCount} projects'),
                if (!vendor.isActive) ...[
                  const SizedBox(width: 6),
                  _InfoPill(label: 'Inactive', color: AppColors.error),
                ],
              ]),
            ],
          )),
          const SizedBox(width: AppDim.sm),
          const Icon(Icons.chevron_right_rounded, color: AppColors.textTertiary),
        ]),
      ),
    ),
  );
}

class _InfoPill extends StatelessWidget {
  final String label;
  final Color? color;
  const _InfoPill({required this.label, this.color});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
    decoration: BoxDecoration(
      color: (color ?? AppColors.primary).withOpacity(0.08),
      borderRadius: BorderRadius.circular(AppDim.radiusFull),
    ),
    child: Text(label, style: AppText.caption.copyWith(
        color: color ?? AppColors.primary, fontSize: 10)),
  );
}

class _EmptyVendors extends StatelessWidget {
  final bool hasSearch;
  final VoidCallback onAdd;
  const _EmptyVendors({required this.hasSearch, required this.onAdd});

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(AppDim.pageHPadding),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(hasSearch ? '🔍' : '🏢', style: const TextStyle(fontSize: 52)),
        const SizedBox(height: 16),
        Text(hasSearch ? 'No vendors found' : 'No vendors yet', style: AppText.h3),
        const SizedBox(height: 8),
        Text(
          hasSearch ? 'Try a different search term'
              : 'Add suppliers & contractors to\nlink them to expenses.',
          textAlign: TextAlign.center,
          style: AppText.bodyMd.copyWith(color: AppColors.textSecondary),
        ),
        if (!hasSearch) ...[
          const SizedBox(height: AppDim.xl),
          ElevatedButton.icon(
            onPressed: onAdd,
            icon: const Icon(Icons.add_rounded, size: 18),
            label: const Text('Add First Vendor'),
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary, foregroundColor: Colors.white),
          ),
        ],
      ]),
    ),
  );
}

class _VendorListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListView.builder(
    padding: const EdgeInsets.all(AppDim.pageHPadding),
    itemCount: 5,
    itemBuilder: (_, i) => Padding(
      padding: const EdgeInsets.only(bottom: AppDim.sm),
      child: BBShimmer(height: 90, radius: AppDim.cardRadius),
    ),
  );
}
