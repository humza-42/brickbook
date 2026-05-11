import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/router/route_names.dart';
import '../providers/project_providers.dart';
import '../data/models/project_models.dart';

class ProjectsListScreen extends ConsumerWidget {
  const ProjectsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsListProvider);
    final filter   = ref.watch(projectFilterProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Projects'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded),
            onPressed: () => context.push(Routes.createProject),
          ),
        ],
      ),
      body: Column(
        children: [
          _FilterTabs(current: filter, onChanged: (f) => ref.read(projectFilterProvider.notifier).set(f)),
          Expanded(
            child: projects.when(
              data: (list) {
                final filtered = list.where((p) {
                  if (filter == 'all')       return true;
                  if (filter == 'active')    return p.status == 'active';
                  if (filter == 'completed') return p.status == 'completed';
                  if (filter == 'on_hold')   return p.status == 'on_hold';
                  return true;
                }).toList();

                if (filtered.isEmpty) return _EmptyFilter(filter: filter);

                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(AppDim.pageHPadding, AppDim.base, AppDim.pageHPadding, 100),
                  itemCount: filtered.length,
                  itemBuilder: (_, i) => _ProjectListTile(project: filtered[i], index: i),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterTabs extends StatelessWidget {
  final String current;
  final ValueChanged<String> onChanged;
  const _FilterTabs({required this.current, required this.onChanged});

  static const _tabs = [
    {'slug': 'all',       'label': 'All'},
    {'slug': 'active',    'label': 'Active'},
    {'slug': 'on_hold',   'label': 'On Hold'},
    {'slug': 'completed', 'label': 'Done'},
  ];

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
        final t   = _tabs[i];
        final sel = current == t['slug'];
        return GestureDetector(
          onTap: () => onChanged(t['slug']!),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: sel ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(AppDim.radiusFull),
              border: Border.all(color: sel ? AppColors.primary : AppColors.border),
            ),
            child: Text(t['label']!,
                style: AppText.labelMd.copyWith(
                    color: sel ? Colors.white : AppColors.textSecondary,
                    fontWeight: sel ? FontWeight.w600 : FontWeight.w400)),
          ),
        );
      },
    ),
  );
}

class _ProjectListTile extends StatelessWidget {
  final ProjectModel project;
  final int index;
  const _ProjectListTile({required this.project, required this.index});

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => context.push(Routes.projectDetail.replaceFirst(':id', project.id)),
    child: Container(
      margin: const EdgeInsets.only(bottom: AppDim.sm),
      padding: const EdgeInsets.all(AppDim.base),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDim.cardRadius),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 50, height: 50,
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: Text(
              kProjectTypes.firstWhere((t) => t['slug'] == project.type, orElse: () => {'icon': '📋'})['icon']!,
              style: const TextStyle(fontSize: 24),
            )),
          ),
          const SizedBox(width: AppDim.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(project.name, style: AppText.h4, maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 2),
                Text(
                  project.location ?? project.type,
                  style: AppText.caption,
                  maxLines: 1, overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: LinearProgressIndicator(
                    value: project.percentUsed,
                    minHeight: 4,
                    backgroundColor: AppColors.surfaceVariant,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      project.isOverBudget ? AppColors.error : AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppDim.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${(project.percentUsed * 100).toStringAsFixed(0)}%',
                  style: AppText.moneySm.copyWith(
                      color: project.isOverBudget ? AppColors.error : AppColors.primary)),
              const SizedBox(height: 2),
              Text('used', style: AppText.caption),
            ],
          ),
          const SizedBox(width: AppDim.sm),
          const Icon(Icons.chevron_right_rounded, color: AppColors.textTertiary),
        ],
      ),
    ),
  );
}

class _EmptyFilter extends StatelessWidget {
  final String filter;
  const _EmptyFilter({required this.filter});

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('📂', style: TextStyle(fontSize: 48)),
        const SizedBox(height: 12),
        Text('No $filter projects', style: AppText.h3),
      ],
    ),
  );
}
