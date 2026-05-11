// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseCategoryImpl _$$ExpenseCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpenseCategoryImpl(
      id: json['id'] as String,
      nameEn: json['nameEn'] as String,
      nameUr: json['nameUr'] as String,
      icon: json['icon'] as String,
      colorHex: json['colorHex'] as String?,
      isActive: json['isActive'] as bool? ?? true,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ExpenseCategoryImplToJson(
        _$ExpenseCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameEn': instance.nameEn,
      'nameUr': instance.nameUr,
      'icon': instance.icon,
      'colorHex': instance.colorHex,
      'isActive': instance.isActive,
      'sortOrder': instance.sortOrder,
    };

_$ExpenseModelImpl _$$ExpenseModelImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseModelImpl(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      categoryId: json['categoryId'] as String,
      expenseDate: json['expenseDate'] as String,
      paymentMethod: json['paymentMethod'] as String,
      taxAmount: (json['taxAmount'] as num?)?.toDouble() ?? 0.0,
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0.0,
      paymentStatus: json['paymentStatus'] as String? ?? 'paid',
      phaseId: json['phaseId'] as String?,
      vendorId: json['vendorId'] as String?,
      vendorName: json['vendorName'] as String?,
      notes: json['notes'] as String?,
      categoryName: json['categoryName'] as String?,
      categoryIcon: json['categoryIcon'] as String?,
      categoryColor: json['categoryColor'] as String?,
      addedByName: json['addedByName'] as String?,
      isFlagged: json['isFlagged'] as bool? ?? false,
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map(
                  (e) => ExpenseAttachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$ExpenseModelImplToJson(_$ExpenseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'title': instance.title,
      'amount': instance.amount,
      'categoryId': instance.categoryId,
      'expenseDate': instance.expenseDate,
      'paymentMethod': instance.paymentMethod,
      'taxAmount': instance.taxAmount,
      'totalAmount': instance.totalAmount,
      'paymentStatus': instance.paymentStatus,
      'phaseId': instance.phaseId,
      'vendorId': instance.vendorId,
      'vendorName': instance.vendorName,
      'notes': instance.notes,
      'categoryName': instance.categoryName,
      'categoryIcon': instance.categoryIcon,
      'categoryColor': instance.categoryColor,
      'addedByName': instance.addedByName,
      'isFlagged': instance.isFlagged,
      'attachments': instance.attachments,
      'createdAt': instance.createdAt,
    };

_$ExpenseAttachmentImpl _$$ExpenseAttachmentImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpenseAttachmentImpl(
      id: json['id'] as String,
      filePath: json['filePath'] as String,
      fileType: json['fileType'] as String,
      originalName: json['originalName'] as String?,
      fileSizeKb: (json['fileSizeKb'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ExpenseAttachmentImplToJson(
        _$ExpenseAttachmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filePath': instance.filePath,
      'fileType': instance.fileType,
      'originalName': instance.originalName,
      'fileSizeKb': instance.fileSizeKb,
    };
