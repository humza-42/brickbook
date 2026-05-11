import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/router/route_names.dart';
import '../../../core/widgets/bb_button.dart';
import '../../../core/widgets/bb_text_field.dart';
import '../providers/project_providers.dart';
import '../data/models/project_models.dart';

class CreateProjectScreen extends ConsumerStatefulWidget {
  const CreateProjectScreen({super.key});

  @override
  ConsumerState<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends ConsumerState<CreateProjectScreen> {
  final _formKey    = GlobalKey<FormState>();
  final _nameCtrl   = TextEditingController();
  final _budgetCtrl = TextEditingController();
  final _locCtrl    = TextEditingController();
  final _descCtrl   = TextEditingController();

  String _type = 'residential';
  DateTime? _startDate;
  DateTime? _endDate;

  final List<String> _phases = [];
  bool _addDefaultPhases = true;

  @override
  void dispose() {
    _nameCtrl.dispose(); _budgetCtrl.dispose();
    _locCtrl.dispose(); _descCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDate(bool isStart) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2040),
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: const ColorScheme.light(primary: AppColors.primary),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => isStart ? _startDate = picked : _endDate = picked);
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final phases = _addDefaultPhases
        ? kDefaultPhases
        : _phases;

    await ref.read(createProjectNotifierProvider.notifier).create({
      'name':         _nameCtrl.text.trim(),
      'type':         _type,
      'total_budget': double.parse(_budgetCtrl.text.replaceAll(',', '')),
      'location':     _locCtrl.text.trim(),
      'description':  _descCtrl.text.trim(),
      'start_date':   _startDate?.toIso8601String().split('T').first,
      'end_date':     _endDate?.toIso8601String().split('T').first,
      'phases':       phases,
    });

    final state = ref.read(createProjectNotifierProvider);
    if (state.created != null && mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createProjectNotifierProvider);

    ref.listen(createProjectNotifierProvider, (_, s) {
      if (s.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(s.error!), backgroundColor: AppColors.error),
        );
      }
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('New Project'),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppDim.pageHPadding),
          children: [
            _SectionHeader(title: 'Basic Information', icon: '📋'),
            const SizedBox(height: AppDim.base),

            BBTextField(
              controller: _nameCtrl,
              label: 'Project Name',
              hint: 'e.g. DHA House Phase 2',
              prefixIcon: Icons.drive_file_rename_outline_rounded,
              validator: (v) => (v == null || v.isEmpty) ? 'Name is required' : null,
            ),
            const SizedBox(height: AppDim.base),

            Text('Project Type', style: AppText.labelLg.copyWith(color: AppColors.textSecondary)),
            const SizedBox(height: 8),
            Wrap(
              spacing: AppDim.sm,
              runSpacing: AppDim.sm,
              children: kProjectTypes.map((t) {
                final sel = _type == t['slug'];
                return GestureDetector(
                  onTap: () => setState(() => _type = t['slug']!),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: sel ? AppColors.primary : AppColors.surface,
                      borderRadius: BorderRadius.circular(AppDim.radiusFull),
                      border: Border.all(color: sel ? AppColors.primary : AppColors.border, width: sel ? 2 : 1),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(t['icon']!, style: const TextStyle(fontSize: 16)),
                        const SizedBox(width: 6),
                        Text(t['label']!,
                            style: AppText.labelMd.copyWith(
                                color: sel ? Colors.white : AppColors.textPrimary,
                                fontWeight: sel ? FontWeight.w600 : FontWeight.w400)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: AppDim.base),

            BBTextField(
              controller: _locCtrl,
              label: 'Location (optional)',
              hint: 'e.g. DHA Phase 6, Lahore',
              prefixIcon: Icons.location_on_outlined,
            ),

            const SizedBox(height: AppDim.xl),
            _SectionHeader(title: 'Budget & Timeline', icon: '💰'),
            const SizedBox(height: AppDim.base),

            BBTextField(
              controller: _budgetCtrl,
              label: 'Total Budget (Rs.)',
              hint: '5,000,000',
              keyboardType: TextInputType.number,
              prefixIcon: Icons.account_balance_wallet_outlined,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9,]'))],
              validator: (v) {
                if (v == null || v.isEmpty) return 'Budget is required';
                final n = double.tryParse(v.replaceAll(',', ''));
                if (n == null || n <= 0) return 'Enter a valid amount';
                return null;
              },
            ),
            const SizedBox(height: AppDim.base),

            Row(children: [
              Expanded(child: _DateField(
                label: 'Start Date',
                value: _startDate,
                onTap: () => _pickDate(true),
              )),
              const SizedBox(width: AppDim.sm),
              Expanded(child: _DateField(
                label: 'End Date (Est.)',
                value: _endDate,
                onTap: () => _pickDate(false),
              )),
            ]),

            const SizedBox(height: AppDim.xl),
            _SectionHeader(title: 'Project Phases', icon: '🏗️'),
            const SizedBox(height: AppDim.base),

            Container(
              padding: const EdgeInsets.all(AppDim.base),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppDim.radiusMd),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Use default phases', style: AppText.labelLg),
                        Text('Foundation, Structure, Roof, Finishing...',
                            style: AppText.caption),
                      ],
                    ),
                  ),
                  Switch(
                    value: _addDefaultPhases,
                    onChanged: (v) => setState(() => _addDefaultPhases = v),
                    activeColor: AppColors.primary,
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppDim.base),
            BBTextField(
              controller: _descCtrl,
              label: 'Description (optional)',
              hint: 'Add any notes about this project...',
              maxLines: 3,
              prefixIcon: null,
            ),

            const SizedBox(height: AppDim.xxl),
            BBButton(
              label: 'Create Project',
              isLoading: state.isLoading,
              onPressed: _submit,
              icon: Icons.add_rounded,
            ),
            const SizedBox(height: AppDim.xxl),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title, icon;
  const _SectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Text(icon, style: const TextStyle(fontSize: 16)),
      const SizedBox(width: 8),
      Text(title, style: AppText.h4.copyWith(color: AppColors.primary)),
      const SizedBox(width: 8),
      Expanded(child: Divider(color: AppColors.border, thickness: 1)),
    ],
  );
}

class _DateField extends StatelessWidget {
  final String label;
  final DateTime? value;
  final VoidCallback onTap;
  const _DateField({required this.label, required this.value, required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppText.labelLg.copyWith(color: AppColors.textSecondary)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppDim.base, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(AppDim.radiusMd),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(children: [
            const Icon(Icons.calendar_today_outlined, size: 16, color: AppColors.textTertiary),
            const SizedBox(width: 8),
            Expanded(child: Text(
              value != null ? '${value!.day}/${value!.month}/${value!.year}' : 'Select',
              style: AppText.bodyMd.copyWith(
                color: value != null ? AppColors.textPrimary : AppColors.textTertiary,
              ),
            )),
          ]),
        ),
      ],
    ),
  );
}
