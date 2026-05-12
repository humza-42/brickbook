import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'analytics_models.freezed.dart';
part 'analytics_models.g.dart';

@freezed
class ProjectAnalytics with _$ProjectAnalytics {
  const factory ProjectAnalytics({
    required String  projectId,
    required double  totalBudget,
    required double  totalSpent,
    required double  remaining,
    @Default(0.0)    double taxPaid,
    @Default([])     List<CategorySpend>   byCategory,
    @Default([])     List<MonthlySpend>    byMonth,
    @Default([])     List<PhaseSpend>      byPhase,
    @Default([])     List<VendorSpend>     byVendor,
    @Default([])     List<PaymentMethodSpend> byPaymentMethod,
  }) = _ProjectAnalytics;

  factory ProjectAnalytics.fromJson(Map<String, dynamic> json) =>
      _$ProjectAnalyticsFromJson(json);
}

@freezed
class CategorySpend with _$CategorySpend {
  const factory CategorySpend({
    required String id,
    required String nameEn,
    required String icon,
    required double amount,
    required double percentage,
    String? colorHex,
  }) = _CategorySpend;

  factory CategorySpend.fromJson(Map<String, dynamic> json) =>
      _$CategorySpendFromJson(json);
}

@freezed
class MonthlySpend with _$MonthlySpend {
  const factory MonthlySpend({
    required String month,   // "2025-01"
    required String label,   // "Jan"
    required double amount,
    required double budget,  // monthly budget target (optional)
  }) = _MonthlySpend;

  factory MonthlySpend.fromJson(Map<String, dynamic> json) =>
      _$MonthlySpendFromJson(json);
}

@freezed
class PhaseSpend with _$PhaseSpend {
  const factory PhaseSpend({
    required String id,
    required String name,
    required double budgetAllocated,
    required double spent,
    required String status,
  }) = _PhaseSpend;

  factory PhaseSpend.fromJson(Map<String, dynamic> json) =>
      _$PhaseSpendFromJson(json);
}

@freezed
class VendorSpend with _$VendorSpend {
  const factory VendorSpend({
    required String id,
    required String name,
    required double totalPaid,
    required int    transactionCount,
  }) = _VendorSpend;

  factory VendorSpend.fromJson(Map<String, dynamic> json) =>
      _$VendorSpendFromJson(json);
}

@freezed
class PaymentMethodSpend with _$PaymentMethodSpend {
  const factory PaymentMethodSpend({
    required String method,
    required double amount,
    required double percentage,
  }) = _PaymentMethodSpend;

  factory PaymentMethodSpend.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodSpendFromJson(json);
}

// Category color lookup
Color categoryColor(String? hex) {
  if (hex == null) return const Color(0xFF1B3A5C);
  try { return Color(int.parse('FF$hex', radix: 16)); }
  catch (_) { return const Color(0xFF1B3A5C); }
}
