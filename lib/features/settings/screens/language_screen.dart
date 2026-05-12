import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../providers/language_provider.dart';

class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(languageProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Language / زبان')),
      body: Padding(
        padding: const EdgeInsets.all(AppDim.pageHPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppDim.base),

            // Info card
            Container(
              padding: const EdgeInsets.all(AppDim.base),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.06),
                borderRadius: BorderRadius.circular(AppDim.radiusMd),
                border: Border.all(color: AppColors.primary.withOpacity(0.2)),
              ),
              child: Row(children: [
                const Icon(Icons.info_outline_rounded,
                    color: AppColors.primary, size: 18),
                const SizedBox(width: AppDim.sm),
                Expanded(child: Text(
                  'The app will restart with the selected language.',
                  style: AppText.bodySm.copyWith(color: AppColors.primary),
                )),
              ]),
            ),
            const SizedBox(height: AppDim.xl),

            Text('Select Language',
                style: AppText.h4.copyWith(color: AppColors.textSecondary)),
            const SizedBox(height: AppDim.base),

            // English option
            _LangCard(
              flag: '🇬🇧',
              nameNative: 'English',
              nameLocal: 'English',
              langCode: 'en',
              isSelected: current == 'en',
              onTap: () async {
                await ref.read(languageProvider.notifier).setLanguage('en');
                if (context.mounted) context.pop();
              },
            ),
            const SizedBox(height: AppDim.sm),

            // Urdu option
            _LangCard(
              flag: '🇵🇰',
              nameNative: 'اردو',
              nameLocal: 'Urdu',
              langCode: 'ur',
              isSelected: current == 'ur',
              isRTL: true,
              onTap: () async {
                await ref.read(languageProvider.notifier).setLanguage('ur');
                if (context.mounted) context.pop();
              },
            ),

            const SizedBox(height: AppDim.xxl),
            Center(child: Text(
              'More languages coming soon',
              style: AppText.caption.copyWith(color: AppColors.textTertiary),
            )),
          ],
        ),
      ),
    );
  }
}

class _LangCard extends StatelessWidget {
  final String flag, nameNative, nameLocal, langCode;
  final bool isSelected;
  final bool isRTL;
  final VoidCallback onTap;

  const _LangCard({
    required this.flag,
    required this.nameNative,
    required this.nameLocal,
    required this.langCode,
    required this.isSelected,
    this.isRTL = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      padding: const EdgeInsets.all(AppDim.base),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primary.withOpacity(0.06)
            : AppColors.surface,
        borderRadius: BorderRadius.circular(AppDim.radiusMd),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.border,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Row(children: [
        Text(flag, style: const TextStyle(fontSize: 36)),
        const SizedBox(width: AppDim.base),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nameNative,
                  style: AppText.h3.copyWith(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.textPrimary,
                      fontFamily: isRTL ? 'Noto Naskh Arabic' : 'Sora')),
              Text(nameLocal, style: AppText.caption),
            ],
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          width: 24, height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? AppColors.primary : Colors.transparent,
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.border,
              width: 2,
            ),
          ),
          child: isSelected
              ? const Icon(Icons.check_rounded, color: Colors.white, size: 14)
              : null,
        ),
      ]),
    ),
  );
}
