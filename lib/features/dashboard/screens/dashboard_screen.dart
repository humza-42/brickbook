import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/router/route_names.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/bb_shimmer.dart';
import '../../../core/widgets/offline_banner.dart';
import '../../projects/data/models/project_models.dart';
import '../../projects/providers/project_providers.dart';
import '../../auth/providers/auth_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(dashboardSummaryProvider);
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const OfflineBanner(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: _DashboardHeader(userName: authState.user?.name ?? 'there'),
                ),
                SliverToBoxAdapter(
                  child: summary.when(
                    data: (s) => _StatsRow(summary: s),
                    loading: () => _StatsRowShimmer(),
                    error: (_, __) => const SizedBox.shrink(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: summary.when(
                    data: (s) => _BudgetOverviewCard(summary: s),
                    loading: () => const _CardShimmer(height: 140),
                    error: (_, __) => const SizedBox.shrink(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(AppDim.pageHPadding, AppDim.xl, AppDim.pageHPadding, AppDim.sm),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recent Projects', style: AppText.h3),
                        GestureDetector(
                          onTap: () => context.go(Routes.projects),
                          child: Text('See all', style: AppText.labelLg.copyWith(color: AppColors.primary)),
                        ),
                      ],
                    ),
                  ),
                ),
                summary.when(
                  data: (s) => s.recentProjects.isEmpty
                      ? SliverToBoxAdapter(child: _EmptyProjects(onTap: () => context.push(Routes.createProject)))
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (_, i) => _ProjectCard(
                              project: s.recentProjects[i],
                              index: i,
                            ),
                            childCount: s.recentProjects.length,
                          ),
                        ),
                  loading: () => SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, __) => const _CardShimmer(height: 160),
                      childCount: 3,
                    ),
                  ),
                  error: (e, _) => SliverToBoxAdapter(
                    child: Center(child: Text('Failed to load: $e')),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(Routes.createProject),
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        elevation: 0,
        icon: const Icon(Icons.add_rounded),
        label: Text('New Project', style: AppText.btnMd.copyWith(color: Colors.white)),
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  final String userName;
  const _DashboardHeader({required this.userName});

  String get _greeting {
    final h = DateTime.now().hour;
    if (h < 12) return 'Good morning';
    if (h < 17) return 'Good afternoon';
    return 'Good evening';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        AppDim.pageHPadding,
        MediaQuery.of(context).padding.top + AppDim.base,
        AppDim.pageHPadding,
        AppDim.xl,
      ),
      decoration: const BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
              child: CustomPaint(painter: _DiagPainter()),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Container(
                      width: 36, height: 36,
                      decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(9)),
                      child: const Center(child: Text('🧱', style: TextStyle(fontSize: 18))),
                    ),
                    const SizedBox(width: AppDim.sm),
                    const Text('BrickBook', style: TextStyle(fontFamily: 'Sora', fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                  ]),
                  Container(
                    width: 38, height: 38,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.notifications_outlined, color: Colors.white, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: AppDim.xl),
              Text(
                '$_greeting,',
                style: TextStyle(fontFamily: 'Sora', fontSize: 14, color: Colors.white.withOpacity(0.65)),
              ),
              const SizedBox(height: 2),
              Text(
                userName.split(' ').first,
                style: const TextStyle(fontFamily: 'Sora', fontSize: 26, fontWeight: FontWeight.w700, color: Colors.white, height: 1.1),
              ),
            ],
          ),
        ],
      ),
    );
  }
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

class _StatsRow extends StatelessWidget {
  final DashboardSummary summary;
  const _StatsRow({required this.summary});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppDim.pageHPadding, AppDim.xl, AppDim.pageHPadding, 0),
      child: Row(
        children: [
          _StatChip(label: 'Projects', value: '${summary.totalProjects}', icon: Icons.construction_rounded, color: AppColors.primary),
          const SizedBox(width: AppDim.sm),
          _StatChip(label: 'Active', value: '${summary.activeProjects}', icon: Icons.play_circle_outline_rounded, color: AppColors.success),
          const SizedBox(width: AppDim.sm),
          _StatChip(
            label: 'Total Spent',
            value: Formatters.pkrCompact(summary.totalSpent),
            icon: Icons.payments_outlined,
            color: AppColors.accent,
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label, value;
  final IconData icon;
  final Color color;
  const _StatChip({required this.label, required this.value, required this.icon, required this.color});

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
          Text(value, style: AppText.moneySm.copyWith(color: color, fontSize: 15)),
          Text(label, style: AppText.caption),
        ],
      ),
    ),
  );
}

class _BudgetOverviewCard extends StatelessWidget {
  final DashboardSummary summary;
  const _BudgetOverviewCard({required this.summary});

  @override
  Widget build(BuildContext context) {
    final pct = summary.totalBudget > 0
        ? (summary.totalSpent / summary.totalBudget).clamp(0.0, 1.0)
        : 0.0;
    final barColor = pct < 0.7
        ? AppColors.success
        : pct < 0.85
            ? AppColors.warning
            : AppColors.error;

    return Container(
      margin: const EdgeInsets.fromLTRB(AppDim.pageHPadding, AppDim.base, AppDim.pageHPadding, 0),
      padding: const EdgeInsets.all(AppDim.base),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDim.cardRadius),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Overall Budget', style: AppText.labelLg.copyWith(color: AppColors.textSecondary)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: barColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(AppDim.radiusFull),
                ),
                child: Text(
                  '${(pct * 100).toStringAsFixed(0)}% used',
                  style: AppText.labelSm.copyWith(color: barColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDim.sm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(Formatters.pkrCompact(summary.totalSpent), style: AppText.moneyLg),
              const SizedBox(width: 6),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text('of ${Formatters.pkrCompact(summary.totalBudget)}',
                    style: AppText.bodyMd.copyWith(color: AppColors.textSecondary)),
              ),
            ],
          ),
          const SizedBox(height: AppDim.sm),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: pct,
              minHeight: 8,
              backgroundColor: AppColors.surfaceVariant,
              valueColor: AlwaysStoppedAnimation<Color>(barColor),
            ),
          ),
          const SizedBox(height: AppDim.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Remaining: ${Formatters.pkrCompact(summary.totalBudget - summary.totalSpent)}',
                  style: AppText.caption),
              Text('Budget: ${Formatters.pkrCompact(summary.totalBudget)}',
                  style: AppText.caption),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends ConsumerWidget {
  final ProjectModel project;
  final int index;
  const _ProjectCard({required this.project, required this.index});

  Color get _statusColor {
    if (project.isOverBudget) return AppColors.error;
    if (project.isCompleted)  return AppColors.success;
    if (project.isOnHold)     return AppColors.warning;
    return AppColors.success;
  }

  String get _statusLabel {
    if (project.isOverBudget) return 'Over Budget';
    if (project.isCompleted)  return 'Completed';
    if (project.isOnHold)     return 'On Hold';
    return 'Active';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 400 + index * 80),
      curve: Curves.easeOut,
      builder: (_, v, child) => Opacity(
        opacity: v,
        child: Transform.translate(offset: Offset(0, 20 * (1 - v)), child: child),
      ),
      child: GestureDetector(
        onTap: () => context.push(Routes.projectDetail.replaceFirst(':id', project.id)),
        child: Container(
          margin: const EdgeInsets.fromLTRB(AppDim.pageHPadding, 0, AppDim.pageHPadding, AppDim.sm),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppDim.cardRadius),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(AppDim.base),
                decoration: const BoxDecoration(
                  gradient: AppColors.cardGradient,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppDim.cardRadius),
                    topRight: Radius.circular(AppDim.cardRadius),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44, height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          kProjectTypes.firstWhere((t) => t['slug'] == project.type,
                              orElse: () => {'icon': '📋'})['icon']!,
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppDim.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(project.name,
                              style: const TextStyle(fontFamily: 'Sora', fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
                              maxLines: 1, overflow: TextOverflow.ellipsis),
                          if (project.location != null)
                            Row(children: [
                              Icon(Icons.location_on_outlined, color: Colors.white.withOpacity(0.6), size: 12),
                              const SizedBox(width: 2),
                              Expanded(
                                child: Text(project.location!,
                                    style: TextStyle(fontFamily: 'Sora', fontSize: 12, color: Colors.white.withOpacity(0.6)),
                                    maxLines: 1, overflow: TextOverflow.ellipsis),
                              ),
                            ]),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _statusColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(AppDim.radiusFull),
                        border: Border.all(color: _statusColor.withOpacity(0.4)),
                      ),
                      child: Text(_statusLabel,
                          style: TextStyle(fontFamily: 'Sora', fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppDim.base),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _BudgetItem(label: 'Budget', value: Formatters.pkrCompact(project.totalBudget)),
                        _BudgetItem(label: 'Spent', value: Formatters.pkrCompact(project.totalSpent), valueColor: AppColors.primary),
                        _BudgetItem(
                          label: 'Remaining',
                          value: Formatters.pkrCompact(project.remaining),
                          valueColor: project.isOverBudget ? AppColors.error : AppColors.success,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDim.sm),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: project.percentUsed),
                        duration: Duration(milliseconds: 600 + index * 100),
                        curve: Curves.easeOut,
                        builder: (_, v, __) => LinearProgressIndicator(
                          value: v,
                          minHeight: 6,
                          backgroundColor: AppColors.surfaceVariant,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            project.isOverBudget ? AppColors.error : AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${(project.percentUsed * 100).toStringAsFixed(0)}% used',
                            style: AppText.caption),
                        if (project.endDate != null)
                          Text('Due: ${project.endDate}', style: AppText.caption),
                      ],
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
}

class _BudgetItem extends StatelessWidget {
  final String label, value;
  final Color? valueColor;
  const _BudgetItem({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: AppText.caption),
      const SizedBox(height: 2),
      Text(value, style: AppText.moneySm.copyWith(color: valueColor ?? AppColors.textPrimary, fontSize: 13)),
    ],
  );
}

class _EmptyProjects extends StatelessWidget {
  final VoidCallback onTap;
  const _EmptyProjects({required this.onTap});

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.all(AppDim.pageHPadding),
    padding: const EdgeInsets.all(AppDim.xxl),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppDim.cardRadius),
      border: Border.all(color: AppColors.border, style: BorderStyle.solid),
    ),
    child: Column(
      children: [
        const Text('🏗️', style: TextStyle(fontSize: 48)),
        const SizedBox(height: AppDim.base),
        Text('No projects yet', style: AppText.h3),
        const SizedBox(height: 6),
        Text('Create your first construction project to start tracking expenses.',
            textAlign: TextAlign.center,
            style: AppText.bodyMd.copyWith(color: AppColors.textSecondary)),
        const SizedBox(height: AppDim.xl),
        ElevatedButton.icon(
          onPressed: onTap,
          icon: const Icon(Icons.add_rounded, size: 18),
          label: const Text('Create Project'),
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
        ),
      ],
    ),
  );
}

class _StatsRowShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(AppDim.pageHPadding, AppDim.xl, AppDim.pageHPadding, 0),
    child: Row(children: List.generate(3, (i) => Expanded(
      child: Container(
        height: 76,
        margin: EdgeInsets.only(right: i < 2 ? AppDim.sm : 0),
        child: const BBShimmer(),
      ),
    ))),
  );
}

class _CardShimmer extends StatelessWidget {
  final double height;
  const _CardShimmer({required this.height});

  @override
  Widget build(BuildContext context) => Container(
    height: height,
    margin: const EdgeInsets.fromLTRB(AppDim.pageHPadding, AppDim.sm, AppDim.pageHPadding, 0),
    child: const BBShimmer(),
  );
}
