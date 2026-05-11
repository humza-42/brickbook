import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/router/route_names.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/bb_shimmer.dart';
import '../providers/expense_providers.dart';
import '../data/models/expense_models.dart';
import '../widgets/expense_filter_sheet.dart';
import '../widgets/expense_card.dart';

class ExpenseListScreen extends ConsumerStatefulWidget {
  final String projectId;
  final bool isEmbedded;
  const ExpenseListScreen({
    super.key, 
    required this.projectId, 
    this.isEmbedded = false,
  });

  @override
  ConsumerState<ExpenseListScreen> createState() => _ExpenseListScreenState();
}

class _ExpenseListScreenState extends ConsumerState<ExpenseListScreen> {
  final _searchCtrl = TextEditingController();

  @override
  void dispose() { _searchCtrl.dispose(); super.dispose(); }

  void _onSearch(String q) {
    final current = ref.read(activeExpenseFilterProvider(widget.projectId));
    ref.read(activeExpenseFilterProvider(widget.projectId).notifier)
        .update(current.copyWith(search: q.isEmpty ? null : q));
  }

  @override
  Widget build(BuildContext context) {
    final filter   = ref.watch(activeExpenseFilterProvider(widget.projectId));
    final expenses = ref.watch(expensesListProvider(widget.projectId, filter));
    final hasFilter = ref.watch(activeExpenseFilterProvider(widget.projectId).notifier).hasActiveFilters;

    // Build the main content (without Scaffold wrapper)
    final content = Column(
      children: [
        // Search bar
        Padding(
          padding: const EdgeInsets.fromLTRB(AppDim.pageHPadding, AppDim.sm, AppDim.pageHPadding, 0),
          child: TextField(
            controller: _searchCtrl,
            onChanged: _onSearch,
            decoration: InputDecoration(
              hintText: 'Search expenses...',
              prefixIcon: const Icon(Icons.search_rounded, color: AppColors.textTertiary),
              suffixIcon: _searchCtrl.text.isNotEmpty
                  ? GestureDetector(
                      onTap: () { _searchCtrl.clear(); _onSearch(''); setState(() {}); },
                      child: const Icon(Icons.close_rounded, color: AppColors.textTertiary),
                    )
                  : null,
              filled: true,
              fillColor: AppColors.surface,
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
                borderSide: const BorderSide(color: AppColors.primary, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ),

        // Active filter chips
        if (hasFilter) _ActiveFilters(projectId: widget.projectId, filter: filter),

        // Summary strip
        expenses.when(
          data: (list) => _SummaryStrip(expenses: list),
          loading: () => const SizedBox.shrink(),
          error:   (_, __) => const SizedBox.shrink(),
        ),

        // Expense list
        Expanded(
          child: expenses.when(
            data: (list) {
              if (list.isEmpty) return _EmptyExpenses(
                hasFilter: hasFilter,
                onAdd: () => context.push(Routes.addExpense.replaceFirst(':id', widget.projectId)),
                onClear: () => ref.read(activeExpenseFilterProvider(widget.projectId).notifier).reset(),
              );

              // Group by date
              final grouped = _groupByDate(list);

              return ListView.builder(
                padding: const EdgeInsets.fromLTRB(
                  AppDim.pageHPadding, AppDim.sm, AppDim.pageHPadding, 100),
                itemCount: grouped.length,
                itemBuilder: (_, i) {
                  final entry = grouped[i];
                  if (entry is String) {
                    return Padding(
                      padding: const EdgeInsets.only(top: AppDim.base, bottom: AppDim.sm),
                      child: Text(entry, style: AppText.labelMd),
                    );
                  }
                  final exp = entry as ExpenseModel;
                  return ExpenseCard(
                    expense: exp,
                    onTap: () => context.push(
                      Routes.expenseDetail
                          .replaceFirst(':id', widget.projectId)
                          .replaceFirst(':expId', exp.id),
                    ),
                  );
                },
              );
            },
            loading: () => ListView.builder(
              padding: const EdgeInsets.all(AppDim.pageHPadding),
              itemCount: 6,
              itemBuilder: (_, i) => Padding(
                padding: const EdgeInsets.only(bottom: AppDim.sm),
                child: BBShimmer(height: 80, radius: AppDim.cardRadius),
              ),
            ),
            error: (e, _) => Center(child: Text('Error: $e')),
          ),
        ),
      ],
    );

    // If embedded, return content without Scaffold
    if (widget.isEmbedded) {
      return content;
    }

    // Full-screen mode with AppBar and FAB
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          // Filter button with badge
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.tune_rounded),
                onPressed: () => _showFilterSheet(context),
              ),
              if (hasFilter)
                Positioned(
                  top: 8, right: 8,
                  child: Container(
                    width: 8, height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.add_rounded),
            onPressed: () => context.push(Routes.addExpense.replaceFirst(':id', widget.projectId)),
          ),
        ],
      ),
      body: content,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(Routes.addExpense.replaceFirst(':id', widget.projectId)),
        backgroundColor: AppColors.accent,
        child: const Icon(Icons.add_rounded, color: Colors.white),
      ),
    );
  }

  List<dynamic> _groupByDate(List<ExpenseModel> expenses) {
    final result = <dynamic>[];
    String? lastDate;
    for (final e in expenses) {
      final date = _formatGroupDate(e.expenseDate);
      if (date != lastDate) {
        result.add(date);
        lastDate = date;
      }
      result.add(e);
    }
    return result;
  }

  String _formatGroupDate(String dateStr) {
    final dt = DateTime.tryParse(dateStr) ?? DateTime.now();
    final now = DateTime.now();
    final diff = now.difference(dt).inDays;
    if (diff == 0) return 'Today';
    if (diff == 1) return 'Yesterday';
    return Formatters.date(dt);
  }

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ExpenseFilterSheet(projectId: widget.projectId),
    );
  }
}

// Summary Strip
class _SummaryStrip extends StatelessWidget {
  final List<ExpenseModel> expenses;
  const _SummaryStrip({required this.expenses});

  @override
  Widget build(BuildContext context) {
    final total = expenses.fold(0.0, (s, e) => s + e.totalAmount);
    final pending = expenses.where((e) => e.paymentStatus == 'pending').length;

    return Container(
      margin: const EdgeInsets.fromLTRB(AppDim.pageHPadding, AppDim.sm, AppDim.pageHPadding, 0),
      padding: const EdgeInsets.symmetric(horizontal: AppDim.base, vertical: AppDim.sm),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.06),
        borderRadius: BorderRadius.circular(AppDim.radiusMd),
        border: Border.all(color: AppColors.primary.withOpacity(0.15)),
      ),
      child: Row(
        children: [
          Expanded(child: _SummaryItem(
            label: '${expenses.length} expenses',
            value: Formatters.pkrCompact(total),
            icon: Icons.receipt_long_outlined,
          )),
          Container(width: 1, height: 28, color: AppColors.border),
          Expanded(child: _SummaryItem(
            label: 'Pending',
            value: '$pending items',
            icon: Icons.pending_outlined,
            valueColor: pending > 0 ? AppColors.warning : AppColors.textSecondary,
          )),
        ],
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String label, value;
  final IconData icon;
  final Color? valueColor;
  const _SummaryItem({required this.label, required this.value, required this.icon, this.valueColor});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, size: 16, color: AppColors.primary),
      const SizedBox(width: 6),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: AppText.moneySm.copyWith(
              fontSize: 13, color: valueColor ?? AppColors.primary)),
          Text(label, style: AppText.caption),
        ],
      ),
    ],
  );
}

// Active Filter Chips
class _ActiveFilters extends ConsumerWidget {
  final String projectId;
  final ExpenseFilter filter;
  const _ActiveFilters({required this.projectId, required this.filter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chips = <Widget>[];

    if (filter.categoryId != null) {
      final cat = kDefaultCategories.firstWhere(
        (c) => c['id'] == filter.categoryId, orElse: () => {'nameEn': 'Category', 'icon': '📂'});
      chips.add(_FilterChip(label: '${cat['icon']} ${cat['nameEn']}',
          onRemove: () => _remove(ref, filter.copyWith(categoryId: null))));
    }
    if (filter.paymentMethod != null) {
      chips.add(_FilterChip(label: filter.paymentMethod!.replaceAll('_', ' ').toUpperCase(),
          onRemove: () => _remove(ref, filter.copyWith(paymentMethod: null))));
    }
    if (filter.dateFrom != null) {
      chips.add(_FilterChip(label: 'From ${filter.dateFrom}',
          onRemove: () => _remove(ref, filter.copyWith(dateFrom: null, dateTo: null))));
    }

    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(AppDim.pageHPadding, 6, AppDim.pageHPadding, 0),
        children: [
          ...chips,
          TextButton(
            onPressed: () => ref.read(activeExpenseFilterProvider(projectId).notifier).reset(),
            child: Text('Clear all', style: AppText.labelMd.copyWith(color: AppColors.error)),
          ),
        ],
      ),
    );
  }

  void _remove(WidgetRef ref, ExpenseFilter updated) =>
      ref.read(activeExpenseFilterProvider(projectId).notifier).update(updated);
}

class _FilterChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;
  const _FilterChip({required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(right: 6),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: AppColors.primary.withOpacity(0.1),
      borderRadius: BorderRadius.circular(AppDim.radiusFull),
      border: Border.all(color: AppColors.primary.withOpacity(0.3)),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: AppText.labelSm.copyWith(color: AppColors.primary, fontSize: 12)),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: onRemove,
          child: const Icon(Icons.close_rounded, size: 14, color: AppColors.primary),
        ),
      ],
    ),
  );
}

class _EmptyExpenses extends StatelessWidget {
  final bool hasFilter;
  final VoidCallback onAdd, onClear;
  const _EmptyExpenses({required this.hasFilter, required this.onAdd, required this.onClear});

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(AppDim.pageHPadding),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(hasFilter ? '🔍' : '💸', style: const TextStyle(fontSize: 52)),
        const SizedBox(height: 16),
        Text(hasFilter ? 'No matching expenses' : 'No expenses yet', style: AppText.h3),
        const SizedBox(height: 8),
        Text(
          hasFilter ? 'Try changing or clearing your filters' : 'Start recording your construction costs',
          textAlign: TextAlign.center,
          style: AppText.bodyMd.copyWith(color: AppColors.textSecondary),
        ),
        const SizedBox(height: AppDim.xl),
        if (hasFilter)
          OutlinedButton(onPressed: onClear, child: const Text('Clear Filters'))
        else
          ElevatedButton.icon(
            onPressed: onAdd,
            icon: const Icon(Icons.add_rounded, size: 18),
            label: const Text('Add First Expense'),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
          ),
      ]),
    ),
  );
}
