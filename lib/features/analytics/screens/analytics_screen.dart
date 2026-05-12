import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/bb_shimmer.dart';
import '../providers/analytics_providers.dart';
import '../data/models/analytics_models.dart';

class AnalyticsScreen extends ConsumerWidget {
  final String projectId;
  const AnalyticsScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analytics = ref.watch(projectAnalyticsProvider(projectId));
    final tab       = ref.watch(analyticsTabProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Analytics'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.invalidate(projectAnalyticsProvider(projectId)),
          ),
        ],
      ),
      body: analytics.when(
        data: (data) => Column(
          children: [
            _AnalyticsTabBar(current: tab, onChanged: (i) => ref.read(analyticsTabProvider.notifier).set(i)),
            Expanded(
              child: IndexedStack(
                index: tab,
                children: [
                  _OverviewTab(data: data),
                  _CategoryTab(data: data),
                  _MonthlyTab(data: data),
                  _PhasesVendorsTab(projectId: projectId, data: data),
                ],
              ),
            ),
          ],
        ),
        loading: () => _AnalyticsShimmer(),
        error: (e, _) => Center(child: Text('Failed to load analytics: $e')),
      ),
    );
  }
}

class _AnalyticsTabBar extends StatelessWidget {
  final int current;
  final ValueChanged<int> onChanged;
  const _AnalyticsTabBar({required this.current, required this.onChanged});

  static const _tabs = ['Overview', 'Categories', 'Monthly', 'Phases'];

  @override
  Widget build(BuildContext context) => Container(
    height: 48,
    color: AppColors.surface,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: AppDim.pageHPadding, vertical: 8),
      itemCount: _tabs.length,
      separatorBuilder: (_, __) => const SizedBox(width: 8),
      itemBuilder: (_, i) {
        final sel = current == i;
        return GestureDetector(
          onTap: () => onChanged(i),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: sel ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(AppDim.radiusFull),
              border: Border.all(color: sel ? AppColors.primary : AppColors.border),
            ),
            child: Text(
              _tabs[i],
              style: AppText.labelMd.copyWith(
                color: sel ? Colors.white : AppColors.textSecondary,
                fontWeight: sel ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        );
      },
    ),
  );
}

// Overview Tab
class _OverviewTab extends StatelessWidget {
  final ProjectAnalytics data;
  const _OverviewTab({required this.data});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.all(AppDim.pageHPadding),
    child: Column(
      children: [
        _BudgetDonutCard(data: data),
        const SizedBox(height: AppDim.base),
        _KpiRow(data: data),
        const SizedBox(height: AppDim.base),
        if (data.byPaymentMethod.isNotEmpty) _PaymentMethodCard(data: data),
      ],
    ),
  );
}

class _BudgetDonutCard extends StatefulWidget {
  final ProjectAnalytics data;
  const _BudgetDonutCard({required this.data});

  @override
  State<_BudgetDonutCard> createState() => _BudgetDonutCardState();
}

class _BudgetDonutCardState extends State<_BudgetDonutCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double>   _anim;
  int _touched = -1;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
    _ctrl.forward();
  }

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  double get _pct => widget.data.totalBudget > 0
      ? (widget.data.totalSpent / widget.data.totalBudget).clamp(0.0, 1.0)
      : 0.0;

  Color get _barColor => _pct < 0.7
      ? AppColors.success
      : _pct < 0.85
          ? AppColors.warning
          : AppColors.error;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(AppDim.xl),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topLeft, end: Alignment.bottomRight,
        colors: [AppColors.primaryDark, AppColors.primary],
      ),
      borderRadius: BorderRadius.circular(AppDim.cardRadius),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Budget Overview',
                style: AppText.h4.copyWith(color: Colors.white)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: _barColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(AppDim.radiusFull),
                border: Border.all(color: _barColor.withOpacity(0.5)),
              ),
              child: Text(
                '${(_pct * 100).toStringAsFixed(1)}% used',
                style: AppText.labelSm.copyWith(color: _barColor),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDim.xl),

        SizedBox(
          height: 220,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _anim,
                builder: (_, __) => PieChart(
                  PieChartData(
                    startDegreeOffset: -90,
                    sectionsSpace: 3,
                    centerSpaceRadius: 68,
                    pieTouchData: PieTouchData(
                      touchCallback: (_, response) {
                        setState(() {
                          _touched = response?.touchedSection
                              ?.touchedSectionIndex ?? -1;
                        });
                      },
                    ),
                    sections: [
                      PieChartSectionData(
                        value: widget.data.totalSpent * _anim.value,
                        color: _barColor,
                        radius: _touched == 0 ? 52.0 : 46.0,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        value: (widget.data.totalBudget - widget.data.totalSpent)
                            .clamp(0.0, double.infinity) * _anim.value,
                        color: Colors.white.withOpacity(0.12),
                        radius: _touched == 1 ? 52.0 : 46.0,
                        showTitle: false,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Formatters.pkrCompact(widget.data.totalSpent),
                    style: const TextStyle(
                        fontFamily: 'Sora', fontSize: 20,
                        fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  Text('spent',
                      style: TextStyle(fontFamily: 'Sora', fontSize: 12,
                          color: Colors.white.withOpacity(0.6))),
                  const SizedBox(height: 4),
                  Text(
                    'of ${Formatters.pkrCompact(widget.data.totalBudget)}',
                    style: TextStyle(fontFamily: 'Sora', fontSize: 11,
                        color: Colors.white.withOpacity(0.5)),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDim.base),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _LegendDot(color: _barColor, label: 'Spent'),
            const SizedBox(width: AppDim.xl),
            _LegendDot(color: Colors.white.withOpacity(0.3), label: 'Remaining'),
          ],
        ),
      ],
    ),
  );
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) => Row(children: [
    Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
    const SizedBox(width: 6),
    Text(label, style: TextStyle(fontFamily: 'Sora', fontSize: 12,
        color: Colors.white.withOpacity(0.7))),
  ]);
}

class _KpiRow extends StatelessWidget {
  final ProjectAnalytics data;
  const _KpiRow({required this.data});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      _KpiCard(label: 'Total Budget',  value: Formatters.pkrCompact(data.totalBudget),  icon: Icons.account_balance_wallet_outlined, color: AppColors.primary),
      const SizedBox(width: AppDim.sm),
      _KpiCard(label: 'Total Spent',   value: Formatters.pkrCompact(data.totalSpent),   icon: Icons.payments_outlined, color: AppColors.accent),
      const SizedBox(width: AppDim.sm),
      _KpiCard(
        label: 'Remaining',
        value: Formatters.pkrCompact(data.remaining),
        icon: Icons.savings_outlined,
        color: data.remaining >= 0 ? AppColors.success : AppColors.error,
      ),
    ],
  );
}

class _KpiCard extends StatelessWidget {
  final String label, value;
  final IconData icon;
  final Color color;
  const _KpiCard({required this.label, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) => Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: AppDim.md, vertical: AppDim.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDim.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(height: 6),
          Text(value,
              style: AppText.moneySm.copyWith(color: color, fontSize: 13),
              maxLines: 1, overflow: TextOverflow.ellipsis),
          Text(label, style: AppText.caption),
        ],
      ),
    ),
  );
}

class _PaymentMethodCard extends StatelessWidget {
  final ProjectAnalytics data;
  const _PaymentMethodCard({required this.data});

  static const _methodColors = {
    'cash':          AppColors.success,
    'bank_transfer': AppColors.primary,
    'cheque':        AppColors.info,
    'credit':        AppColors.warning,
    'pending':       AppColors.error,
  };

  @override
  Widget build(BuildContext context) {
    if (data.byPaymentMethod.isEmpty) return const SizedBox.shrink();

    return Container(
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
            const Icon(Icons.payments_outlined, size: 18, color: AppColors.primary),
            const SizedBox(width: 8),
            Text('Payment Methods', style: AppText.h4),
          ]),
          const SizedBox(height: AppDim.base),
          ...data.byPaymentMethod.map((m) {
            final color = _methodColors[m.method] ?? AppColors.primary;
            return Padding(
              padding: const EdgeInsets.only(bottom: AppDim.sm),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(m.method.replaceAll('_', ' ').toUpperCase(),
                          style: AppText.labelSm),
                      Text(
                        '${m.percentage.toStringAsFixed(1)}%  ·  ${Formatters.pkrCompact(m.amount)}',
                        style: AppText.caption,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: m.percentage / 100),
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeOut,
                    builder: (_, v, __) => ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: LinearProgressIndicator(
                        value: v,
                        minHeight: 6,
                        backgroundColor: AppColors.surfaceVariant,
                        valueColor: AlwaysStoppedAnimation<Color>(color),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

// Categories Tab
class _CategoryTab extends StatefulWidget {
  final ProjectAnalytics data;
  const _CategoryTab({required this.data});

  @override
  State<_CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<_CategoryTab>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  int _touched = -1;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _ctrl.forward();
  }

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final cats = widget.data.byCategory.where((c) => c.amount > 0).toList()
      ..sort((a, b) => b.amount.compareTo(a.amount));

    if (cats.isEmpty) return _EmptyChart(label: 'No category data yet');

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDim.pageHPadding),
      child: Column(
        children: [
          _CategoryPieCard(
            cats: cats,
            ctrl: _ctrl,
            touched: _touched,
            onTouch: (i) => setState(() => _touched = i),
          ),
          const SizedBox(height: AppDim.base),
          _CategoryListCard(cats: cats),
        ],
      ),
    );
  }
}

class _CategoryPieCard extends StatelessWidget {
  final List<CategorySpend> cats;
  final AnimationController ctrl;
  final int touched;
  final ValueChanged<int> onTouch;
  const _CategoryPieCard({required this.cats, required this.ctrl, required this.touched, required this.onTouch});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(AppDim.xl),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppDim.cardRadius),
      border: Border.all(color: AppColors.border),
    ),
    child: Column(
      children: [
        Row(children: [
          const Icon(Icons.pie_chart_rounded, size: 18, color: AppColors.primary),
          const SizedBox(width: 8),
          Text('Spend by Category', style: AppText.h4),
        ]),
        const SizedBox(height: AppDim.xl),

        SizedBox(
          height: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: ctrl,
                builder: (_, __) {
                  final anim = CurvedAnimation(parent: ctrl, curve: Curves.easeOutCubic);
                  return PieChart(
                    PieChartData(
                      startDegreeOffset: -90,
                      sectionsSpace: 2,
                      centerSpaceRadius: 52,
                      pieTouchData: PieTouchData(
                        touchCallback: (_, r) => onTouch(
                          r?.touchedSection?.touchedSectionIndex ?? -1,
                        ),
                      ),
                      sections: cats.asMap().entries.map((entry) {
                        final i   = entry.key;
                        final cat = entry.value;
                        final sel = touched == i;
                        final col = categoryColor(cat.colorHex);
                        return PieChartSectionData(
                          value: cat.amount * anim.value,
                          color: col,
                          radius: sel ? 52.0 : 44.0,
                          showTitle: sel,
                          title: sel ? cat.icon : '',
                          titleStyle: const TextStyle(fontSize: 18),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
              IgnorePointer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (touched >= 0 && touched < cats.length) ...[
                      Text(cats[touched].icon, style: const TextStyle(fontSize: 24)),
                      const SizedBox(height: 2),
                      Text(
                        Formatters.pkrCompact(cats[touched].amount),
                        style: AppText.moneySm.copyWith(
                            fontSize: 13, color: categoryColor(cats[touched].colorHex)),
                      ),
                      Text(
                        '${cats[touched].percentage.toStringAsFixed(1)}%',
                        style: AppText.caption,
                      ),
                    ] else ...[
                      Text('${cats.length}', style: AppText.moneyMd),
                      Text('categories', style: AppText.caption),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDim.base),
        Wrap(
          spacing: AppDim.sm,
          runSpacing: AppDim.xs,
          children: cats.take(8).map((c) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8, height: 8,
                margin: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  color: categoryColor(c.colorHex),
                  shape: BoxShape.circle,
                ),
              ),
              Text(c.nameEn.split(' ').first,
                  style: AppText.caption.copyWith(fontSize: 11)),
            ],
          )).toList(),
        ),
      ],
    ),
  );
}

class _CategoryListCard extends StatelessWidget {
  final List<CategorySpend> cats;
  const _CategoryListCard({required this.cats});

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
          const Icon(Icons.bar_chart_rounded, size: 18, color: AppColors.primary),
          const SizedBox(width: 8),
          Text('Category Breakdown', style: AppText.h4),
        ]),
        const SizedBox(height: AppDim.base),
        ...cats.map((c) => _CategoryBarRow(cat: c)),
      ],
    ),
  );
}

class _CategoryBarRow extends StatelessWidget {
  final CategorySpend cat;
  const _CategoryBarRow({required this.cat});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: AppDim.sm),
    child: Column(
      children: [
        Row(
          children: [
            Text(cat.icon, style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(cat.nameEn,
                  style: AppText.labelLg, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
            Text(
              Formatters.pkrCompact(cat.amount),
              style: AppText.moneySm.copyWith(
                  fontSize: 13, color: categoryColor(cat.colorHex)),
            ),
            const SizedBox(width: 6),
            SizedBox(
              width: 38,
              child: Text(
                '${cat.percentage.toStringAsFixed(0)}%',
                style: AppText.caption,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: cat.percentage / 100),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOut,
          builder: (_, v, __) => ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: v,
              minHeight: 5,
              backgroundColor: AppColors.surfaceVariant,
              valueColor: AlwaysStoppedAnimation<Color>(
                  categoryColor(cat.colorHex)),
            ),
          ),
        ),
      ],
    ),
  );
}

// Monthly Tab
class _MonthlyTab extends StatefulWidget {
  final ProjectAnalytics data;
  const _MonthlyTab({required this.data});

  @override
  State<_MonthlyTab> createState() => _MonthlyTabState();
}

class _MonthlyTabState extends State<_MonthlyTab>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double>   _anim;
  int _touched = -1;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
    _ctrl.forward();
  }

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final months = widget.data.byMonth;
    if (months.isEmpty) return _EmptyChart(label: 'No monthly data yet');

    final maxAmt = months.map((m) => m.amount).reduce((a, b) => a > b ? a : b);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDim.pageHPadding),
      child: Column(
        children: [
          _MonthlyBarCard(months: months, maxAmt: maxAmt, anim: _anim, touched: _touched,
              onTouch: (i) => setState(() => _touched = i)),
          const SizedBox(height: AppDim.base),
          _MonthlyListCard(months: months),
        ],
      ),
    );
  }
}

class _MonthlyBarCard extends StatelessWidget {
  final List<MonthlySpend> months;
  final double maxAmt;
  final Animation<double> anim;
  final int touched;
  final ValueChanged<int> onTouch;
  const _MonthlyBarCard({required this.months, required this.maxAmt,
      required this.anim, required this.touched, required this.onTouch});

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
          const Icon(Icons.bar_chart_rounded, size: 18, color: AppColors.primary),
          const SizedBox(width: 8),
          Text('Monthly Spending', style: AppText.h4),
        ]),

        if (touched >= 0 && touched < months.length) ...[
          const SizedBox(height: AppDim.sm),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.12),
              borderRadius: BorderRadius.circular(AppDim.radiusMd),
              border: Border.all(color: AppColors.accent.withOpacity(0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(months[touched].label,
                    style: AppText.labelLg.copyWith(color: AppColors.accent)),
                const SizedBox(width: 8),
                Text(Formatters.pkrCompact(months[touched].amount),
                    style: AppText.moneySm.copyWith(color: AppColors.accent, fontSize: 14)),
              ],
            ),
          ),
        ],
        const SizedBox(height: AppDim.base),

        SizedBox(
          height: 180,
          child: AnimatedBuilder(
            animation: anim,
            builder: (_, __) => BarChart(
              BarChartData(
                maxY: maxAmt * 1.25,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (_) => FlLine(
                    color: AppColors.border,
                    strokeWidth: 1,
                    dashArray: [4, 4],
                  ),
                ),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: (val, meta) {
                        final i = val.toInt();
                        if (i < 0 || i >= months.length) return const SizedBox.shrink();
                        return Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(months[i].label,
                              style: AppText.caption.copyWith(fontSize: 10)),
                        );
                      },
                    ),
                  ),
                ),
                barTouchData: BarTouchData(
                  touchCallback: (_, r) => onTouch(
                    r?.spot?.touchedBarGroupIndex ?? -1,
                  ),
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (_) => AppColors.primaryDark,
                    getTooltipItem: (group, _, rod, __) => BarTooltipItem(
                      Formatters.pkrCompact(rod.toY),
                      const TextStyle(fontFamily: 'Sora', color: Colors.white, fontSize: 11),
                    ),
                  ),
                ),
                barGroups: months.asMap().entries.map((entry) {
                  final i   = entry.key;
                  final m   = entry.value;
                  final sel = touched == i;
                  return BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY: m.amount * anim.value,
                        color: sel ? AppColors.accent : AppColors.primary,
                        width: sel ? 18 : 14,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: maxAmt * 1.25,
                          color: AppColors.surfaceVariant,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class _MonthlyListCard extends StatelessWidget {
  final List<MonthlySpend> months;
  const _MonthlyListCard({required this.months});

  @override
  Widget build(BuildContext context) {
    final sorted = [...months]..sort((a, b) => b.amount.compareTo(a.amount));
    return Container(
      padding: const EdgeInsets.all(AppDim.base),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDim.cardRadius),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Month by Month', style: AppText.h4),
          const SizedBox(height: AppDim.sm),
          ...sorted.map((m) => Padding(
            padding: const EdgeInsets.only(bottom: AppDim.sm),
            child: Row(
              children: [
                Container(
                  width: 42,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(AppDim.radiusSm),
                  ),
                  child: Text(m.label,
                      textAlign: TextAlign.center,
                      style: AppText.labelSm.copyWith(color: AppColors.primary)),
                ),
                const SizedBox(width: AppDim.md),
                Expanded(
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0,
                        end: sorted.first.amount > 0 ? m.amount / sorted.first.amount : 0),
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeOut,
                    builder: (_, v, __) => ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: LinearProgressIndicator(
                        value: v,
                        minHeight: 8,
                        backgroundColor: AppColors.surfaceVariant,
                        valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppDim.sm),
                SizedBox(
                  width: 70,
                  child: Text(Formatters.pkrCompact(m.amount),
                      textAlign: TextAlign.right,
                      style: AppText.moneySm.copyWith(fontSize: 12)),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

// Phases & Vendors Tab
class _PhasesVendorsTab extends ConsumerWidget {
  final String projectId;
  final ProjectAnalytics data;
  const _PhasesVendorsTab({required this.projectId, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendors = ref.watch(vendorSpendProvider(projectId));
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDim.pageHPadding),
      child: Column(
        children: [
          if (data.byPhase.isNotEmpty) ...[
            _PhaseBudgetCard(phases: data.byPhase),
            const SizedBox(height: AppDim.base),
          ],
          vendors.when(
            data: (list) => list.isEmpty
                ? const SizedBox.shrink()
                : _VendorSpendCard(vendors: list),
            loading: () => BBShimmer(height: 200),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _PhaseBudgetCard extends StatelessWidget {
  final List<PhaseSpend> phases;
  const _PhaseBudgetCard({required this.phases});

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
          const Icon(Icons.layers_outlined, size: 18, color: AppColors.primary),
          const SizedBox(width: 8),
          Text('Phase Budget vs Spent', style: AppText.h4),
        ]),
        const SizedBox(height: AppDim.base),
        ...phases.map((p) => _PhaseBarRow(phase: p)),
      ],
    ),
  );
}

class _PhaseBarRow extends StatelessWidget {
  final PhaseSpend phase;
  const _PhaseBarRow({required this.phase});

  Color get _statusColor => phase.status == 'completed'
      ? AppColors.success
      : phase.status == 'active'
          ? AppColors.primary
          : AppColors.textTertiary;

  double get _pct => phase.budgetAllocated > 0
      ? (phase.spent / phase.budgetAllocated).clamp(0.0, 1.0)
      : 0.0;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: AppDim.base),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Container(
                width: 8, height: 8,
                decoration: BoxDecoration(color: _statusColor, shape: BoxShape.circle),
              ),
              const SizedBox(width: 8),
              Text(phase.name, style: AppText.labelLg),
            ]),
            Text(
              '${Formatters.pkrCompact(phase.spent)} / ${Formatters.pkrCompact(phase.budgetAllocated)}',
              style: AppText.caption,
            ),
          ],
        ),
        const SizedBox(height: 6),
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Container(
                height: 10,
                width: double.infinity,
                color: AppColors.surfaceVariant,
              ),
            ),
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: _pct),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOut,
              builder: (_, v, __) => FractionallySizedBox(
                widthFactor: v,
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: _pct > 1.0 ? AppColors.error : _statusColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 3),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '${(_pct * 100).toStringAsFixed(0)}% used',
            style: AppText.caption.copyWith(
                color: _pct > 1.0 ? AppColors.error : AppColors.textTertiary),
          ),
        ),
      ],
    ),
  );
}

class _VendorSpendCard extends StatelessWidget {
  final List<VendorSpend> vendors;
  const _VendorSpendCard({required this.vendors});

  @override
  Widget build(BuildContext context) {
    final sorted = [...vendors]..sort((a, b) => b.totalPaid.compareTo(a.totalPaid));
    final maxPaid = sorted.first.totalPaid;

    return Container(
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
            const Icon(Icons.store_outlined, size: 18, color: AppColors.primary),
            const SizedBox(width: 8),
            Text('Top Vendors', style: AppText.h4),
          ]),
          const SizedBox(height: AppDim.base),
          ...sorted.take(8).toList().asMap().entries.map((entry) {
            final i = entry.key;
            final v = entry.value;
            final rankColors = [AppColors.accent, AppColors.primary, AppColors.primaryLight];
            final rankColor = i < 3 ? rankColors[i] : AppColors.textTertiary;

            return Padding(
              padding: const EdgeInsets.only(bottom: AppDim.sm),
              child: Row(
                children: [
                  Container(
                    width: 24, height: 24,
                    decoration: BoxDecoration(
                      color: rankColor.withOpacity(0.12),
                      shape: BoxShape.circle,
                      border: Border.all(color: rankColor.withOpacity(0.3)),
                    ),
                    child: Center(
                      child: Text('${i + 1}',
                          style: TextStyle(fontFamily: 'Sora', fontSize: 10,
                              fontWeight: FontWeight.w700, color: rankColor)),
                    ),
                  ),
                  const SizedBox(width: AppDim.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(v.name, style: AppText.labelLg,
                                  maxLines: 1, overflow: TextOverflow.ellipsis),
                            ),
                            Text(Formatters.pkrCompact(v.totalPaid),
                                style: AppText.moneySm.copyWith(fontSize: 12, color: AppColors.primary)),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Row(children: [
                          Expanded(
                            child: TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0, end: maxPaid > 0 ? v.totalPaid / maxPaid : 0),
                              duration: Duration(milliseconds: (600 + i * 80).toInt()),
                              curve: Curves.easeOut,
                              builder: (_, val, __) => ClipRRect(
                                borderRadius: BorderRadius.circular(3),
                                child: LinearProgressIndicator(
                                  value: val,
                                  minHeight: 5,
                                  backgroundColor: AppColors.surfaceVariant,
                                  valueColor: AlwaysStoppedAnimation<Color>(rankColor),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text('${v.transactionCount} txns',
                              style: AppText.caption.copyWith(fontSize: 10)),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

// Shared Widgets
class _EmptyChart extends StatelessWidget {
  final String label;
  const _EmptyChart({required this.label});

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(AppDim.pageHPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('📊', style: TextStyle(fontSize: 48)),
          const SizedBox(height: 16),
          Text(label, style: AppText.h3),
          const SizedBox(height: 8),
          Text('Add expenses to see analytics',
              style: AppText.bodyMd.copyWith(color: AppColors.textSecondary)),
        ],
      ),
    ),
  );
}

class _AnalyticsShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(AppDim.pageHPadding),
    child: Column(
      children: [
        BBShimmer(height: 280, radius: AppDim.cardRadius),
        const SizedBox(height: AppDim.base),
        Row(children: [
          Expanded(child: BBShimmer(height: 80)),
          const SizedBox(width: AppDim.sm),
          Expanded(child: BBShimmer(height: 80)),
          const SizedBox(width: AppDim.sm),
          Expanded(child: BBShimmer(height: 80)),
        ]),
        const SizedBox(height: AppDim.base),
        BBShimmer(height: 180, radius: AppDim.cardRadius),
      ],
    ),
  );
}
