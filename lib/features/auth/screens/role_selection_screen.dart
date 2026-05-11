import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/router/route_names.dart';
import '../../../core/widgets/bb_button.dart';
import '../data/models/auth_models.dart';

class RoleSelectionScreen extends ConsumerStatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  ConsumerState<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends ConsumerState<RoleSelectionScreen> {
  String _selected = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDim.pageHPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDim.xl),
              Row(children: [
                Container(
                  width: 40, height: 40,
                  decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(10)),
                  child: const Center(child: Text('🧱', style: TextStyle(fontSize: 20))),
                ),
                const SizedBox(width: AppDim.sm),
                const Text('BrickBook', style: TextStyle(fontFamily: 'Sora', fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.primary)),
              ]),
              const SizedBox(height: AppDim.xxl),
              Text('What describes\nyou best?', style: AppText.displayMd),
              const SizedBox(height: 8),
              Text('Choose your role to personalize your experience', style: AppText.bodyMd.copyWith(color: AppColors.textSecondary)),
              const SizedBox(height: AppDim.xxl),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: AppDim.sm,
                    mainAxisSpacing: AppDim.sm,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: kUserRoles.length,
                  itemBuilder: (_, i) {
                    final role = kUserRoles[i];
                    final sel = _selected == role['slug'];
                    return GestureDetector(
                      onTap: () => setState(() => _selected = role['slug']!),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.all(AppDim.base),
                        decoration: BoxDecoration(
                          color: sel ? AppColors.primary : AppColors.surface,
                          borderRadius: BorderRadius.circular(AppDim.cardRadius),
                          border: Border.all(color: sel ? AppColors.primary : AppColors.border, width: sel ? 2 : 1),
                          boxShadow: sel ? [BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 16, offset: const Offset(0, 4))] : [],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(role['icon']!, style: const TextStyle(fontSize: 32)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(role['en']!, style: AppText.labelLg.copyWith(color: sel ? Colors.white : AppColors.textPrimary)),
                                Text(role['ur']!, style: AppText.caption.copyWith(color: sel ? Colors.white.withOpacity(0.7) : AppColors.textTertiary)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppDim.xl),
              BBButton(
                label: 'Continue',
                onPressed: _selected.isEmpty ? null : () => context.go(Routes.dashboard),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
