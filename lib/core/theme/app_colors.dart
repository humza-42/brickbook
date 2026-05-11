import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand
  static const Color primary = Color(0xFF1B3A5C);
  static const Color primaryLight = Color(0xFF2C5F8A);
  static const Color primaryDark = Color(0xFF0F2236);
  static const Color accent = Color(0xFFE8A020);
  static const Color accentLight = Color(0xFFF5C14E);
  static const Color accentDark = Color(0xFFC0810A);

  // Semantic
  static const Color success = Color(0xFF2E7D52);
  static const Color successLight = Color(0xFFEAF7EE);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFFF8E7);
  static const Color error = Color(0xFFDC3545);
  static const Color errorLight = Color(0xFFFDECEA);
  static const Color info = Color(0xFF0EA5E9);
  static const Color infoLight = Color(0xFFE0F4FE);

  // Neutrals Light
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF4F7FB);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFEEF2F7);
  static const Color border = Color(0xFFDDE3ED);
  static const Color borderLight = Color(0xFFF0F3F8);

  // Text Light
  static const Color textPrimary = Color(0xFF0F1E2E);
  static const Color textSecondary = Color(0xFF4A5F75);
  static const Color textTertiary = Color(0xFF8A9BB0);
  static const Color textDisabled = Color(0xFFB8C4D0);

  // Dark Mode
  static const Color darkBackground = Color(0xFF0A1628);
  static const Color darkSurface = Color(0xFF122240);
  static const Color darkSurfaceVariant = Color(0xFF1A3356);
  static const Color darkBorder = Color(0xFF243D5C);
  static const Color darkTextPrimary = Color(0xFFE8EFF7);
  static const Color darkTextSecondary = Color(0xFF8BA4BF);

  // Category Colors
  static const Color catMaterials = Color(0xFF6B4EFF);
  static const Color catLabor = Color(0xFF0EA5E9);
  static const Color catEquipment = Color(0xFFF59E0B);
  static const Color catFuel = Color(0xFFEF4444);
  static const Color catTransport = Color(0xFF10B981);
  static const Color catProfession = Color(0xFF8B5CF6);
  static const Color catPermits = Color(0xFFF97316);
  static const Color catSafety = Color(0xFF14B8A6);
  static const Color catSiteSetup = Color(0xFF6366F1);
  static const Color catPlumbing = Color(0xFF3B82F6);
  static const Color catElectrical = Color(0xFFEAB308);
  static const Color catFinishing = Color(0xFFEC4899);
  static const Color catMisc = Color(0xFF94A3B8);

  // Budget Status
  static const Color budgetSafe = Color(0xFF2E7D52);
  static const Color budgetCaution = Color(0xFFF59E0B);
  static const Color budgetWarning = Color(0xFFF97316);
  static const Color budgetOver = Color(0xFFDC3545);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1B3A5C), Color(0xFF0F2236)],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFE8A020), Color(0xFFC0810A)],
  );
}
