import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppText {
  AppText._();

  static const String _fontFamily = 'Sora';
  static const String _monoFamily = 'JetBrainsMono';

  // Display
  static const TextStyle displayLg = TextStyle(
    fontFamily: _fontFamily, fontSize: 32, fontWeight: FontWeight.w700,
    color: AppColors.textPrimary, height: 1.2, letterSpacing: -0.5,
  );
  static const TextStyle displayMd = TextStyle(
    fontFamily: _fontFamily, fontSize: 28, fontWeight: FontWeight.w700,
    color: AppColors.textPrimary, height: 1.25, letterSpacing: -0.3,
  );
  static const TextStyle displaySm = TextStyle(
    fontFamily: _fontFamily, fontSize: 24, fontWeight: FontWeight.w600,
    color: AppColors.textPrimary, height: 1.3, letterSpacing: -0.2,
  );

  // Headings
  static const TextStyle h1 = TextStyle(
    fontFamily: _fontFamily, fontSize: 22, fontWeight: FontWeight.w700,
    color: AppColors.textPrimary, height: 1.3,
  );
  static const TextStyle h2 = TextStyle(
    fontFamily: _fontFamily, fontSize: 20, fontWeight: FontWeight.w600,
    color: AppColors.textPrimary, height: 1.35,
  );
  static const TextStyle h3 = TextStyle(
    fontFamily: _fontFamily, fontSize: 18, fontWeight: FontWeight.w600,
    color: AppColors.textPrimary, height: 1.4,
  );
  static const TextStyle h4 = TextStyle(
    fontFamily: _fontFamily, fontSize: 16, fontWeight: FontWeight.w600,
    color: AppColors.textPrimary, height: 1.4,
  );

  // Body
  static const TextStyle bodyLg = TextStyle(
    fontFamily: _fontFamily, fontSize: 16, fontWeight: FontWeight.w400,
    color: AppColors.textPrimary, height: 1.6,
  );
  static const TextStyle bodyMd = TextStyle(
    fontFamily: _fontFamily, fontSize: 14, fontWeight: FontWeight.w400,
    color: AppColors.textPrimary, height: 1.6,
  );
  static const TextStyle bodySm = TextStyle(
    fontFamily: _fontFamily, fontSize: 13, fontWeight: FontWeight.w400,
    color: AppColors.textSecondary, height: 1.5,
  );

  // Labels
  static const TextStyle labelLg = TextStyle(
    fontFamily: _fontFamily, fontSize: 14, fontWeight: FontWeight.w600,
    color: AppColors.textPrimary, letterSpacing: 0.1,
  );
  static const TextStyle labelMd = TextStyle(
    fontFamily: _fontFamily, fontSize: 12, fontWeight: FontWeight.w600,
    color: AppColors.textSecondary, letterSpacing: 0.3,
  );
  static const TextStyle labelSm = TextStyle(
    fontFamily: _fontFamily, fontSize: 11, fontWeight: FontWeight.w500,
    color: AppColors.textTertiary, letterSpacing: 0.3,
  );
  static const TextStyle caption = TextStyle(
    fontFamily: _fontFamily, fontSize: 11, fontWeight: FontWeight.w400,
    color: AppColors.textTertiary, height: 1.5,
  );

  // Overline / Uppercase label
  static const TextStyle overline = TextStyle(
    fontFamily: _fontFamily, fontSize: 11, fontWeight: FontWeight.w600,
    color: AppColors.textTertiary, letterSpacing: 0.8,
  );

  // Money
  static const TextStyle moneyXl = TextStyle(
    fontFamily: _fontFamily, fontSize: 30, fontWeight: FontWeight.w700,
    color: AppColors.textPrimary, letterSpacing: -1.0,
  );
  static const TextStyle moneyLg = TextStyle(
    fontFamily: _fontFamily, fontSize: 22, fontWeight: FontWeight.w700,
    color: AppColors.textPrimary, letterSpacing: -0.5,
  );
  static const TextStyle moneyMd = TextStyle(
    fontFamily: _fontFamily, fontSize: 18, fontWeight: FontWeight.w600,
    color: AppColors.textPrimary, letterSpacing: -0.3,
  );
  static const TextStyle moneySm = TextStyle(
    fontFamily: _fontFamily, fontSize: 14, fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Buttons
  static const TextStyle btnLg = TextStyle(
    fontFamily: _fontFamily, fontSize: 16, fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
  );
  static const TextStyle btnMd = TextStyle(
    fontFamily: _fontFamily, fontSize: 14, fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
  );
}
