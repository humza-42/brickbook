// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DraftExpenseImpl _$$DraftExpenseImplFromJson(Map<String, dynamic> json) =>
    _$DraftExpenseImpl(
      localId: json['localId'] as String,
      projectId: json['projectId'] as String,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      categoryId: json['categoryId'] as String,
      paymentMethod: json['paymentMethod'] as String,
      expenseDate: json['expenseDate'] as String,
      paymentStatus: json['paymentStatus'] as String? ?? 'paid',
      taxAmount: (json['taxAmount'] as num?)?.toDouble() ?? 0.0,
      notes: json['notes'] as String?,
      vendorId: json['vendorId'] as String?,
      phaseId: json['phaseId'] as String?,
      attachmentPaths: (json['attachmentPaths'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isSynced: json['isSynced'] as bool? ?? false,
      syncAttempts: (json['syncAttempts'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$DraftExpenseImplToJson(_$DraftExpenseImpl instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'projectId': instance.projectId,
      'title': instance.title,
      'amount': instance.amount,
      'categoryId': instance.categoryId,
      'paymentMethod': instance.paymentMethod,
      'expenseDate': instance.expenseDate,
      'paymentStatus': instance.paymentStatus,
      'taxAmount': instance.taxAmount,
      'notes': instance.notes,
      'vendorId': instance.vendorId,
      'phaseId': instance.phaseId,
      'attachmentPaths': instance.attachmentPaths,
      'isSynced': instance.isSynced,
      'syncAttempts': instance.syncAttempts,
      'createdAt': instance.createdAt,
    };
