import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/utils/formatters.dart';
import '../data/models/expense_models.dart';

class ExpenseCard extends StatelessWidget {
  final ExpenseModel expense;
  final VoidCallback onTap;
  const ExpenseCard({super.key, required this.expense, required this.onTap});

  Color get _catColor {
    if (expense.categoryColor == null) return AppColors.primary;
    return Color(int.parse('FF${expense.categoryColor}', radix: 16));
  }

  Color get _statusColor => expense.paymentStatus == 'paid'
      ? AppColors.success
      : expense.paymentStatus == 'pending'
          ? AppColors.warning
          : AppColors.info;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(bottom: AppDim.sm),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDim.cardRadius),
        border: Border.all(color: AppColors.border),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Left color accent bar
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: _catColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppDim.cardRadius),
                  bottomLeft: Radius.circular(AppDim.cardRadius),
                ),
              ),
            ),
            // Category icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDim.md, vertical: AppDim.md),
              child: Container(
                width: 42, height: 42,
                decoration: BoxDecoration(
                  color: _catColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(expense.categoryIcon ?? '💰',
                      style: const TextStyle(fontSize: 20)),
                ),
              ),
            ),
            // Title + meta
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: AppDim.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(expense.title,
                              style: AppText.labelLg,
                              maxLines: 1, overflow: TextOverflow.ellipsis),
                        ),
                        if (expense.isFlagged)
                          const Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Icon(Icons.flag_rounded, size: 14, color: AppColors.error),
                          ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Row(children: [
                      Text(expense.categoryName ?? '', style: AppText.caption),
                      if (expense.vendorName != null) ...[
                        Text(' · ', style: AppText.caption),
                        Expanded(
                          child: Text(expense.vendorName!,
                              style: AppText.caption,
                              maxLines: 1, overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ]),
                    const SizedBox(height: 4),
                    Row(children: [
                      // Payment method chip
                      _MiniChip(
                        label: expense.paymentMethod.replaceAll('_', ' '),
                        color: AppColors.textTertiary,
                      ),
                      const SizedBox(width: 4),
                      // Status chip
                      _MiniChip(
                        label: expense.paymentStatus,
                        color: _statusColor,
                        filled: true,
                      ),
                      // Attachment indicator
                      if (expense.attachments.isNotEmpty) ...[
                        const SizedBox(width: 4),
                        Icon(Icons.attach_file_rounded,
                            size: 12, color: AppColors.textTertiary),
                        Text('${expense.attachments.length}',
                            style: AppText.caption.copyWith(fontSize: 10)),
                      ],
                    ]),
                  ],
                ),
              ),
            ),
            // Amount + date
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDim.md),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    Formatters.pkrCompact(expense.totalAmount),
                    style: AppText.moneySm.copyWith(color: AppColors.primary, fontSize: 14),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    Formatters.dateShort(DateTime.tryParse(expense.expenseDate) ?? DateTime.now()),
                    style: AppText.caption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _MiniChip extends StatelessWidget {
  final String label;
  final Color color;
  final bool filled;
  const _MiniChip({required this.label, required this.color, this.filled = false});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    decoration: BoxDecoration(
      color: filled ? color.withOpacity(0.12) : Colors.transparent,
      borderRadius: BorderRadius.circular(AppDim.radiusFull),
      border: filled ? null : Border.all(color: AppColors.border),
    ),
    child: Text(label,
        style: TextStyle(
          fontFamily: 'Sora', fontSize: 9,
          fontWeight: FontWeight.w600,
          color: filled ? color : AppColors.textTertiary,
        )),
  );
}
