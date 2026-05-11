import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/widgets/bb_button.dart';
import '../providers/expense_providers.dart';
import '../data/models/expense_models.dart';

class ExpenseFilterSheet extends ConsumerStatefulWidget {
  final String projectId;
  const ExpenseFilterSheet({super.key, required this.projectId});

  @override
  ConsumerState<ExpenseFilterSheet> createState() => _ExpenseFilterSheetState();
}

class _ExpenseFilterSheetState extends ConsumerState<ExpenseFilterSheet> {
  late ExpenseFilter _filter;

  @override
  void initState() {
    super.initState();
    _filter = ref.read(activeExpenseFilterProvider(widget.projectId));
  }

  void _apply() {
    ref.read(activeExpenseFilterProvider(widget.projectId).notifier).update(_filter);
    Navigator.pop(context);
  }

  void _reset() {
    setState(() => _filter = const ExpenseFilter());
    ref.read(activeExpenseFilterProvider(widget.projectId).notifier).reset();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppDim.radiusXxl)),
      ),
      padding: EdgeInsets.fromLTRB(
        AppDim.pageHPadding,
        AppDim.base,
        AppDim.pageHPadding,
        MediaQuery.of(context).viewInsets.bottom + AppDim.pageVPadding,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle
            Center(
              child: Container(
                width: 40, height: 4,
                decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(2)),
              ),
            ),
            const SizedBox(height: AppDim.base),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Filter Expenses', style: AppText.h3),
              TextButton(onPressed: _reset, child: Text('Reset', style: AppText.labelLg.copyWith(color: AppColors.error))),
            ]),
            const SizedBox(height: AppDim.xl),

            // Category filter
            Text('Category', style: AppText.h4),
            const SizedBox(height: AppDim.sm),
            Wrap(
              spacing: AppDim.sm, runSpacing: AppDim.sm,
              children: kDefaultCategories.map((c) {
                final sel = _filter.categoryId == c['id'];
                return GestureDetector(
                  onTap: () => setState(() => _filter = _filter.copyWith(
                      categoryId: sel ? null : c['id'])),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                      color: sel ? AppColors.primary : AppColors.surfaceVariant,
                      borderRadius: BorderRadius.circular(AppDim.radiusFull),
                      border: Border.all(color: sel ? AppColors.primary : AppColors.border),
                    ),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Text(c['icon']!, style: const TextStyle(fontSize: 14)),
                      const SizedBox(width: 5),
                      Text(c['nameEn']!,
                          style: AppText.labelMd.copyWith(
                              color: sel ? Colors.white : AppColors.textPrimary,
                              fontWeight: sel ? FontWeight.w600 : FontWeight.w400)),
                    ]),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: AppDim.xl),

            // Payment method
            Text('Payment Method', style: AppText.h4),
            const SizedBox(height: AppDim.sm),
            Wrap(
              spacing: AppDim.sm, runSpacing: AppDim.sm,
              children: kPaymentMethods.map((m) {
                final sel = _filter.paymentMethod == m['slug'];
                return GestureDetector(
                  onTap: () => setState(() => _filter = _filter.copyWith(
                      paymentMethod: sel ? null : m['slug'])),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                      color: sel ? AppColors.primary : AppColors.surfaceVariant,
                      borderRadius: BorderRadius.circular(AppDim.radiusFull),
                      border: Border.all(color: sel ? AppColors.primary : AppColors.border),
                    ),
                    child: Text('${m['icon']} ${m['label']}',
                        style: AppText.labelMd.copyWith(
                            color: sel ? Colors.white : AppColors.textPrimary)),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: AppDim.xl),

            // Payment Status
            Text('Payment Status', style: AppText.h4),
            const SizedBox(height: AppDim.sm),
            Row(children: [
              for (final s in ['paid', 'pending', 'partial']) ...[
                _StatusToggle(
                  label: s,
                  selected: _filter.paymentStatus == s,
                  onTap: () => setState(() => _filter = _filter.copyWith(
                      paymentStatus: _filter.paymentStatus == s ? null : s)),
                ),
                if (s != 'partial') const SizedBox(width: AppDim.sm),
              ],
            ]),
            const SizedBox(height: AppDim.xl),

            // Sort by
            Text('Sort By', style: AppText.h4),
            const SizedBox(height: AppDim.sm),
            DropdownButtonFormField<String>(
              value: _filter.sortBy,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.surfaceVariant,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDim.radiusMd),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDim.radiusMd),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              ),
              items: const [
                DropdownMenuItem(value: 'date_desc', child: Text('Date (Newest first)')),
                DropdownMenuItem(value: 'date_asc',  child: Text('Date (Oldest first)')),
                DropdownMenuItem(value: 'amount_desc',child: Text('Amount (Highest first)')),
                DropdownMenuItem(value: 'amount_asc', child: Text('Amount (Lowest first)')),
              ],
              onChanged: (v) => setState(() => _filter = _filter.copyWith(sortBy: v ?? 'date_desc')),
            ),

            const SizedBox(height: AppDim.xxl),
            BBButton(label: 'Apply Filters', onPressed: _apply),
          ],
        ),
      ),
    );
  }
}

class _StatusToggle extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _StatusToggle({required this.label, required this.selected, required this.onTap});

  Color get _color => label == 'paid' ? AppColors.success
      : label == 'pending' ? AppColors.warning : AppColors.info;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? _color.withOpacity(0.12) : AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(AppDim.radiusFull),
        border: Border.all(color: selected ? _color : AppColors.border, width: selected ? 2 : 1),
      ),
      child: Text(label.toUpperCase(),
          style: AppText.labelMd.copyWith(color: selected ? _color : AppColors.textSecondary)),
    ),
  );
}
