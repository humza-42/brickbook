// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectAnalyticsImpl _$$ProjectAnalyticsImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectAnalyticsImpl(
      projectId: json['projectId'] as String,
      totalBudget: (json['totalBudget'] as num).toDouble(),
      totalSpent: (json['totalSpent'] as num).toDouble(),
      remaining: (json['remaining'] as num).toDouble(),
      taxPaid: (json['taxPaid'] as num?)?.toDouble() ?? 0.0,
      byCategory: (json['byCategory'] as List<dynamic>?)
              ?.map((e) => CategorySpend.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      byMonth: (json['byMonth'] as List<dynamic>?)
              ?.map((e) => MonthlySpend.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      byPhase: (json['byPhase'] as List<dynamic>?)
              ?.map((e) => PhaseSpend.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      byVendor: (json['byVendor'] as List<dynamic>?)
              ?.map((e) => VendorSpend.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      byPaymentMethod: (json['byPaymentMethod'] as List<dynamic>?)
              ?.map(
                  (e) => PaymentMethodSpend.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProjectAnalyticsImplToJson(
        _$ProjectAnalyticsImpl instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'totalBudget': instance.totalBudget,
      'totalSpent': instance.totalSpent,
      'remaining': instance.remaining,
      'taxPaid': instance.taxPaid,
      'byCategory': instance.byCategory,
      'byMonth': instance.byMonth,
      'byPhase': instance.byPhase,
      'byVendor': instance.byVendor,
      'byPaymentMethod': instance.byPaymentMethod,
    };

_$CategorySpendImpl _$$CategorySpendImplFromJson(Map<String, dynamic> json) =>
    _$CategorySpendImpl(
      id: json['id'] as String,
      nameEn: json['nameEn'] as String,
      icon: json['icon'] as String,
      amount: (json['amount'] as num).toDouble(),
      percentage: (json['percentage'] as num).toDouble(),
      colorHex: json['colorHex'] as String?,
    );

Map<String, dynamic> _$$CategorySpendImplToJson(_$CategorySpendImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameEn': instance.nameEn,
      'icon': instance.icon,
      'amount': instance.amount,
      'percentage': instance.percentage,
      'colorHex': instance.colorHex,
    };

_$MonthlySpendImpl _$$MonthlySpendImplFromJson(Map<String, dynamic> json) =>
    _$MonthlySpendImpl(
      month: json['month'] as String,
      label: json['label'] as String,
      amount: (json['amount'] as num).toDouble(),
      budget: (json['budget'] as num).toDouble(),
    );

Map<String, dynamic> _$$MonthlySpendImplToJson(_$MonthlySpendImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'label': instance.label,
      'amount': instance.amount,
      'budget': instance.budget,
    };

_$PhaseSpendImpl _$$PhaseSpendImplFromJson(Map<String, dynamic> json) =>
    _$PhaseSpendImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      budgetAllocated: (json['budgetAllocated'] as num).toDouble(),
      spent: (json['spent'] as num).toDouble(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$PhaseSpendImplToJson(_$PhaseSpendImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'budgetAllocated': instance.budgetAllocated,
      'spent': instance.spent,
      'status': instance.status,
    };

_$VendorSpendImpl _$$VendorSpendImplFromJson(Map<String, dynamic> json) =>
    _$VendorSpendImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      totalPaid: (json['totalPaid'] as num).toDouble(),
      transactionCount: (json['transactionCount'] as num).toInt(),
    );

Map<String, dynamic> _$$VendorSpendImplToJson(_$VendorSpendImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'totalPaid': instance.totalPaid,
      'transactionCount': instance.transactionCount,
    };

_$PaymentMethodSpendImpl _$$PaymentMethodSpendImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentMethodSpendImpl(
      method: json['method'] as String,
      amount: (json['amount'] as num).toDouble(),
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$$PaymentMethodSpendImplToJson(
        _$PaymentMethodSpendImpl instance) =>
    <String, dynamic>{
      'method': instance.method,
      'amount': instance.amount,
      'percentage': instance.percentage,
    };
