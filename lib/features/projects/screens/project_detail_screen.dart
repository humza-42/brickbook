import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/router/route_names.dart';
import '../../../core/utils/formatters.dart';
import '../providers/project_providers.dart';
import '../data/models/project_models.dart';
import '../../expenses/screens/expense_list_screen.dart';

class ProjectDetailScreen extends ConsumerStatefulWidget {
  final String id;
  const ProjectDetailScreen({super.key, required this.id});

  @override
  ConsumerState<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends ConsumerState<ProjectDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tab;

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() { _tab.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final project = ref.watch(projectDetailProvider(widget.id));

    return project.when(
      data: (p) => Scaffold(
        backgroundColor: AppColors.background,
        body: NestedScrollView(
          headerSliverBuilder: (_, __) => [
            SliverAppBar(
              expandedHeight: 320,
              pinned: true,
              backgroundColor: AppColors.primaryDark,
              foregroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                onPressed: () => context.pop(),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.share_outlined, color: Colors.white),
                  onPressed: () => context.push(Routes.shareProject.replaceFirst(':id', p.id)),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
                  onPressed: () => _showOptions(context, p),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: _ProjectHeroBanner(project: p),
              ),
              bottom: TabBar(
                controller: _tab,
                indicatorColor: AppColors.accent,
                indicatorWeight: 3,
                labelStyle: const TextStyle(fontFamily: 'Sora', fontSize: 13, fontWeight: FontWeight.w600),
                unselectedLabelStyle: const TextStyle(fontFamily: 'Sora', fontSize: 13),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white60,
                tabs: const [
                  Tab(text: 'Expenses'),
                  Tab(text: 'Budget'),
                  Tab(text: 'Phases'),
                  Tab(text: 'Team'),
                ],
              ),
            ),
          ],
          body: TabBarView(
            controller: _tab,
            children: [
              _ExpensesTab(projectId: p.id),
              _BudgetTab(project: p),
              _PhasesTab(project: p),
              _TeamTab(projectId: p.id),
            ],
          ),
        ),
        floatingActionButton: _tab.index == 0
            ? FloatingActionButton.extended(
                onPressed: () => context.push(Routes.addExpense.replaceFirst(':id', p.id)),
                backgroundColor: AppColors.accent,
                foregroundColor: Colors.white,
                icon: const Icon(Icons.add_rounded),
                label: Text('Add Expense', style: AppText.btnMd.copyWith(color: Colors.white)),
              )
            : null,
      ),
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error:   (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
    );
  }

  void _showOptions(BuildContext context, ProjectModel p) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: AppDim.md),
          Container(width: 40, height: 4,
              decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: AppDim.base),
          _OptionTile(icon: Icons.edit_outlined, label: 'Edit Project', onTap: () {}),
          _OptionTile(icon: Icons.photo_camera_outlined, label: 'Site Photos', onTap: () => context.push(Routes.sitePhotos.replaceFirst(':id', p.id))),
          _OptionTile(icon: Icons.bar_chart_rounded, label: 'Analytics', onTap: () => context.push(Routes.analytics.replaceFirst(':id', p.id))),
          _OptionTile(icon: Icons.delete_outline_rounded, label: 'Delete Project', color: AppColors.error, onTap: () {}),
          const SizedBox(height: AppDim.xl),
        ],
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;
  const _OptionTile({required this.icon, required this.label, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) => ListTile(
    leading: Icon(icon, color: color ?? AppColors.textPrimary),
    title: Text(label, style: AppText.bodyLg.copyWith(color: color ?? AppColors.textPrimary)),
    onTap: () { Navigator.pop(context); onTap(); },
  );
}

class _ProjectHeroBanner extends StatelessWidget {
  final ProjectModel project;
  const _ProjectHeroBanner({required this.project});

  @override
  Widget build(BuildContext context) {
    final pct = project.percentUsed;
    final barColor = project.isOverBudget ? AppColors.error
        : pct > 0.85 ? AppColors.warning
        : AppColors.success;

    return Container(
      decoration: const BoxDecoration(gradient: AppColors.cardGradient),
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: _DiagPainter2())),
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppDim.pageHPadding,
              MediaQuery.of(context).padding.top + 56,
              AppDim.pageHPadding,
              56,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Text(project.name,
                     style: const TextStyle(fontFamily: 'Sora', fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                     maxLines: 2),
                 const SizedBox(height: 2),
                if (project.location != null)
                  Row(children: [
                    Icon(Icons.location_on_outlined, color: Colors.white.withOpacity(0.6), size: 14),
                    Text(' ${project.location}',
                        style: TextStyle(fontFamily: 'Sora', fontSize: 12, color: Colors.white.withOpacity(0.6))),
                   ]),
                 const SizedBox(height: 8),
                Row(
                  children: [
                     Expanded(child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(Formatters.pkrCompact(project.totalSpent),
                             style: const TextStyle(fontFamily: 'Sora', fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                         Text('of ${Formatters.pkrCompact(project.totalBudget)} budget',
                             style: TextStyle(fontFamily: 'Sora', fontSize: 10, color: Colors.white.withOpacity(0.6))),
                       ],
                     )),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: barColor.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(AppDim.radiusFull),
                        border: Border.all(color: barColor.withOpacity(0.5)),
                      ),
                      child: Text('${(pct * 100).toStringAsFixed(0)}% used',
                          style: TextStyle(fontFamily: 'Sora', fontSize: 12, fontWeight: FontWeight.w600, color: barColor)),
                    ),
                  ],
                ),
                 const SizedBox(height: 4),
                 ClipRRect(
                   borderRadius: BorderRadius.circular(4),
                   child: LinearProgressIndicator(
                     value: pct,
                     minHeight: 4,
                    backgroundColor: Colors.white.withOpacity(0.15),
                    valueColor: AlwaysStoppedAnimation<Color>(barColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DiagPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = Colors.white.withOpacity(0.04)..strokeWidth = 1;
    for (double i = -size.height; i < size.width + size.height; i += 50) {
      canvas.drawLine(Offset(i, 0), Offset(i + size.height, size.height), p);
    }
  }
  @override bool shouldRepaint(_) => false;
}

class _BudgetTab extends StatelessWidget {
  final ProjectModel project;
  const _BudgetTab({required this.project});

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(AppDim.pageHPadding),
    children: [
      _BigBudgetCard(project: project),
      const SizedBox(height: AppDim.base),
      if (project.phases.isNotEmpty) ...[
        Text('Phase Budgets', style: AppText.h4),
        const SizedBox(height: AppDim.sm),
        ...project.phases.map((phase) => _PhaseBudgetRow(phase: phase)),
      ],
    ],
  );
}

class _BigBudgetCard extends StatelessWidget {
  final ProjectModel project;
  const _BigBudgetCard({required this.project});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(AppDim.base),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppDim.cardRadius),
      border: Border.all(color: AppColors.border),
    ),
    child: Column(children: [
      Row(children: [
        Expanded(child: _BudgetKpi(label: 'Total Budget', value: Formatters.pkr(project.totalBudget), color: AppColors.primary)),
        const SizedBox(width: AppDim.sm),
        Expanded(child: _BudgetKpi(label: 'Spent', value: Formatters.pkr(project.totalSpent), color: AppColors.accent)),
        const SizedBox(width: AppDim.sm),
        Expanded(child: _BudgetKpi(
          label: 'Remaining',
          value: Formatters.pkr(project.remaining),
          color: project.isOverBudget ? AppColors.error : AppColors.success,
        )),
      ]),
      const SizedBox(height: AppDim.base),
      ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: LinearProgressIndicator(
          value: project.percentUsed,
          minHeight: 10,
          backgroundColor: AppColors.surfaceVariant,
          valueColor: AlwaysStoppedAnimation<Color>(
            project.isOverBudget ? AppColors.error : AppColors.primary),
        ),
      ),
    ]),
  );
}

class _BudgetKpi extends StatelessWidget {
  final String label, value;
  final Color color;
  const _BudgetKpi({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) => Column(children: [
    Text(value, style: AppText.moneySm.copyWith(color: color, fontSize: 14), overflow: TextOverflow.ellipsis, maxLines: 1),
    Text(label, style: AppText.caption, overflow: TextOverflow.ellipsis, maxLines: 1),
  ]);
}

class _PhaseBudgetRow extends StatelessWidget {
  final ProjectPhase phase;
  const _PhaseBudgetRow({required this.phase});

  @override
  Widget build(BuildContext context) {
    final pct = phase.budgetAllocated > 0
        ? (phase.spent / phase.budgetAllocated).clamp(0.0, 1.0) : 0.0;
    return Container(
      margin: const EdgeInsets.only(bottom: AppDim.sm),
      padding: const EdgeInsets.symmetric(horizontal: AppDim.base, vertical: AppDim.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDim.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(children: [
      Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              phase.name,
              style: AppText.labelLg,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: AppDim.sm),
          Flexible(
            flex: 1,
            child: Text(
              Formatters.pkrCompact(phase.spent),
              style: AppText.moneySm.copyWith(fontSize: 13),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: LinearProgressIndicator(
            value: pct, minHeight: 5,
            backgroundColor: AppColors.surfaceVariant,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
      ]),
    );
  }
}

class _ExpensesTab extends ConsumerWidget {
  final String projectId;
  const _ExpensesTab({required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ExpenseListScreen(projectId: projectId, isEmbedded: true);
  }
}

class _PhasesTab extends ConsumerWidget {
  final ProjectModel project;
  const _PhasesTab({required this.project});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (project.phases.isEmpty) {
      return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('🏗️', style: TextStyle(fontSize: 40)),
          const SizedBox(height: 12),
          Text('No phases added', style: AppText.h4),
          const SizedBox(height: 8),
          Text('Phases help track budget per stage', style: AppText.bodyMd.copyWith(color: AppColors.textSecondary)),
        ]),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(AppDim.pageHPadding),
      itemCount: project.phases.length,
      itemBuilder: (_, i) => _PhaseCard(phase: project.phases[i]),
    );
  }
}

class _PhaseCard extends StatelessWidget {
  final ProjectPhase phase;
  const _PhaseCard({required this.phase});

  Color get _statusColor => phase.status == 'completed'
      ? AppColors.success
      : phase.status == 'active'
          ? AppColors.primary
          : AppColors.textTertiary;

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: AppDim.sm),
    padding: const EdgeInsets.all(AppDim.base),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppDim.cardRadius),
      border: Border.all(color: AppColors.border),
    ),
    child: Row(children: [
      Container(
        width: 4, height: 48,
        decoration: BoxDecoration(color: _statusColor, borderRadius: BorderRadius.circular(2)),
      ),
      const SizedBox(width: AppDim.md),
      Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(phase.name, style: AppText.labelLg),
          const SizedBox(height: 2),
          Text('Budget: ${Formatters.pkrCompact(phase.budgetAllocated)}', style: AppText.caption),
        ],
      )),
      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Text(Formatters.pkrCompact(phase.spent), style: AppText.moneySm.copyWith(fontSize: 13, color: AppColors.primary)),
        Text(phase.status, style: AppText.labelSm.copyWith(color: _statusColor)),
      ]),
    ]),
  );
}

class _TeamTab extends ConsumerWidget {
  final String projectId;
  const _TeamTab({required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(AppDim.pageHPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Team Members', style: AppText.h4),
            TextButton.icon(
              onPressed: () => _showInviteDialog(context),
              icon: const Icon(Icons.person_add_outlined, size: 16),
              label: const Text('Invite'),
            ),
          ]),
          const SizedBox(height: AppDim.base),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Text('👥', style: TextStyle(fontSize: 40)),
                SizedBox(height: 12),
                Text('No team members yet'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showInviteDialog(BuildContext context) {
    final ctrl = TextEditingController();
    String permission = 'viewer';
    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (ctx, set) => AlertDialog(
          title: const Text('Invite Member'),
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            TextField(controller: ctrl, decoration: const InputDecoration(hintText: 'Email or phone')),
            const SizedBox(height: 12),
            DropdownButton<String>(
              value: permission,
              isExpanded: true,
              items: ['viewer','expense_adder','editor','project_admin']
                  .map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
              onChanged: (v) => set(() => permission = v!),
            ),
          ]),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () => Navigator.pop(ctx),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              child: const Text('Send Invite', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
