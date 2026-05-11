import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/router/route_names.dart';
import '../../../core/utils/formatters.dart';
import '../providers/expense_providers.dart';
import '../data/expense_repository.dart';
import '../data/models/expense_models.dart';

class ExpenseDetailScreen extends ConsumerWidget {
  final String projectId, expenseId;
  const ExpenseDetailScreen({super.key, required this.projectId, required this.expenseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expense = ref.watch(expenseDetailProvider(projectId, expenseId));

    return expense.when(
      data: (e) => Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text('Expense Detail'),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: () => context.push(
                Routes.addExpense.replaceFirst(':id', projectId),
                extra: e,
              ),
            ),
            PopupMenuButton<String>(
              onSelected: (v) async {
                if (v == 'delete') {
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Delete Expense'),
                      content: const Text('Are you sure? This cannot be undone.'),
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
                    await ref.read(expenseRepositoryProvider).deleteExpense(projectId, expenseId);
                    if (context.mounted) context.pop();
                  }
                }
              },
              itemBuilder: (_) => [
                const PopupMenuItem(value: 'flag',   child: Text('Flag this expense')),
                const PopupMenuItem(value: 'delete', child: Text('Delete', style: TextStyle(color: AppColors.error))),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDim.pageHPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Amount Hero
              _AmountHero(expense: e),
              const SizedBox(height: AppDim.base),

              // Details Card
              _DetailCard(expense: e),
              const SizedBox(height: AppDim.base),

              // Notes
              if (e.notes != null && e.notes!.isNotEmpty) ...[
                _NotesCard(notes: e.notes!),
                const SizedBox(height: AppDim.base),
              ],

              // Attachments
              if (e.attachments.isNotEmpty) ...[
                _AttachmentsCard(attachments: e.attachments),
                const SizedBox(height: AppDim.base),
              ],

              // Meta
              _MetaCard(expense: e),
              const SizedBox(height: AppDim.xxl),
            ],
          ),
        ),
      ),
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
    );
  }
}

class _AmountHero extends StatelessWidget {
  final ExpenseModel expense;
  const _AmountHero({required this.expense});

  Color get _catColor {
    if (expense.categoryColor == null) return AppColors.primary;
    return Color(int.parse('FF${expense.categoryColor}', radix: 16));
  }

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(AppDim.xl),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft, end: Alignment.bottomRight,
        colors: [_catColor, _catColor.withOpacity(0.7)],
      ),
      borderRadius: BorderRadius.circular(AppDim.cardRadius),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(AppDim.radiusFull),
              ),
              child: Row(children: [
                Text(expense.categoryIcon ?? '💰', style: const TextStyle(fontSize: 14)),
                const SizedBox(width: 4),
                Text(expense.categoryName ?? '', style: const TextStyle(fontFamily: 'Sora', fontSize: 12, color: Colors.white)),
              ]),
            ),
            if (expense.isFlagged)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.error.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(AppDim.radiusFull),
                ),
                child: const Row(children: [
                  Icon(Icons.flag_rounded, color: Colors.white, size: 12),
                  SizedBox(width: 4),
                  Text('Flagged', style: TextStyle(fontFamily: 'Sora', fontSize: 11, color: Colors.white)),
                ]),
              ),
          ],
        ),
        const SizedBox(height: AppDim.xl),
        Text(
          Formatters.pkr(expense.totalAmount),
          style: const TextStyle(fontFamily: 'Sora', fontSize: 36, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        if (expense.taxAmount > 0) ...[
          const SizedBox(height: 4),
          Text(
            '${Formatters.pkr(expense.amount)} + ${Formatters.pkr(expense.taxAmount)} tax',
            style: TextStyle(fontFamily: 'Sora', fontSize: 13, color: Colors.white.withOpacity(0.7)),
          ),
        ],
        const SizedBox(height: AppDim.sm),
        Text(
          expense.title,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Sora', fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.9)),
        ),
      ],
    ),
  );
}

class _DetailCard extends StatelessWidget {
  final ExpenseModel expense;
  const _DetailCard({required this.expense});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(AppDim.base),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppDim.cardRadius),
      border: Border.all(color: AppColors.border),
    ),
    child: Column(children: [
      _Row(icon: Icons.calendar_today_outlined, label: 'Date',
          value: Formatters.date(DateTime.tryParse(expense.expenseDate) ?? DateTime.now())),
      _Divider(),
      _Row(icon: Icons.payments_outlined, label: 'Payment',
          value: expense.paymentMethod.replaceAll('_', ' ')),
      _Divider(),
      _Row(
        icon: Icons.check_circle_outline_rounded,
        label: 'Status',
        value: expense.paymentStatus,
        valueColor: expense.paymentStatus == 'paid'
            ? AppColors.success
            : expense.paymentStatus == 'pending'
                ? AppColors.warning
                : AppColors.info,
      ),
      if (expense.vendorName != null) ...[
        _Divider(),
        _Row(icon: Icons.store_outlined, label: 'Vendor', value: expense.vendorName!),
      ],
      if (expense.addedByName != null) ...[
        _Divider(),
        _Row(icon: Icons.person_outline_rounded, label: 'Added by', value: expense.addedByName!),
      ],
    ]),
  );
}

class _Row extends StatelessWidget {
  final IconData icon;
  final String label, value;
  final Color? valueColor;
  const _Row({required this.icon, required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(children: [
      Icon(icon, size: 18, color: AppColors.textTertiary),
      const SizedBox(width: 10),
      Text(label, style: AppText.bodyMd.copyWith(color: AppColors.textSecondary)),
      const Spacer(),
      Text(value, style: AppText.labelLg.copyWith(color: valueColor ?? AppColors.textPrimary)),
    ]),
  );
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      const Divider(height: 1, color: AppColors.borderLight);
}

class _NotesCard extends StatelessWidget {
  final String notes;
  const _NotesCard({required this.notes});

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(AppDim.base),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppDim.cardRadius),
      border: Border.all(color: AppColors.border),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          const Icon(Icons.notes_rounded, size: 16, color: AppColors.textTertiary),
          const SizedBox(width: 6),
          Text('Notes', style: AppText.labelLg.copyWith(color: AppColors.textSecondary)),
        ]),
        const SizedBox(height: 8),
        Text(notes, style: AppText.bodyMd),
      ],
    ),
  );
}

class _AttachmentsCard extends StatelessWidget {
  final List<ExpenseAttachment> attachments;
  const _AttachmentsCard({required this.attachments});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(AppDim.base),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppDim.cardRadius),
      border: Border.all(color: AppColors.border),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          const Icon(Icons.attach_file_rounded, size: 16, color: AppColors.textTertiary),
          const SizedBox(width: 6),
          Text('Receipts (${attachments.length})',
              style: AppText.labelLg.copyWith(color: AppColors.textSecondary)),
        ]),
        const SizedBox(height: AppDim.sm),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: attachments.length,
            itemBuilder: (_, i) => Container(
              width: 70, height: 70,
              margin: const EdgeInsets.only(right: AppDim.sm),
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(AppDim.radiusMd),
                border: Border.all(color: AppColors.border),
              ),
              child: const Icon(Icons.image_outlined, color: AppColors.textTertiary),
            ),
          ),
        ),
      ],
    ),
  );
}

class _MetaCard extends StatelessWidget {
  final ExpenseModel expense;
  const _MetaCard({required this.expense});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(AppDim.base),
    decoration: BoxDecoration(
      color: AppColors.surfaceVariant,
      borderRadius: BorderRadius.circular(AppDim.cardRadius),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Recorded', style: AppText.caption),
        Text(
          expense.createdAt != null
              ? Formatters.relative(DateTime.tryParse(expense.createdAt!) ?? DateTime.now())
              : '—',
          style: AppText.caption.copyWith(color: AppColors.textSecondary),
        ),
      ],
    ),
  );
}
