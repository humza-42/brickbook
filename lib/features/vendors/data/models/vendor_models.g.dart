// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorModelImpl _$$VendorModelImplFromJson(Map<String, dynamic> json) =>
    _$VendorModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      categoryId: json['categoryId'] as String?,
      categoryName: json['categoryName'] as String?,
      categoryIcon: json['categoryIcon'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      notes: json['notes'] as String?,
      isActive: json['isActive'] as bool? ?? true,
      totalPaid: (json['totalPaid'] as num?)?.toDouble() ?? 0.0,
      transactionCount: (json['transactionCount'] as num?)?.toInt() ?? 0,
      projectCount: (json['projectCount'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$VendorModelImplToJson(_$VendorModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'categoryIcon': instance.categoryIcon,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'notes': instance.notes,
      'isActive': instance.isActive,
      'totalPaid': instance.totalPaid,
      'transactionCount': instance.transactionCount,
      'projectCount': instance.projectCount,
      'createdAt': instance.createdAt,
    };

_$VendorTransactionImpl _$$VendorTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$VendorTransactionImpl(
      id: json['id'] as String,
      projectName: json['projectName'] as String,
      amount: (json['amount'] as num).toDouble(),
      expenseDate: json['expenseDate'] as String,
      title: json['title'] as String,
      paymentMethod: json['paymentMethod'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
    );

Map<String, dynamic> _$$VendorTransactionImplToJson(
        _$VendorTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectName': instance.projectName,
      'amount': instance.amount,
      'expenseDate': instance.expenseDate,
      'title': instance.title,
      'paymentMethod': instance.paymentMethod,
      'paymentStatus': instance.paymentStatus,
    };

_$VendorSummaryImpl _$$VendorSummaryImplFromJson(Map<String, dynamic> json) =>
    _$VendorSummaryImpl(
      vendor: VendorModel.fromJson(json['vendor'] as Map<String, dynamic>),
      transactions: (json['transactions'] as List<dynamic>?)
              ?.map(
                  (e) => VendorTransaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalPaid: (json['totalPaid'] as num?)?.toDouble() ?? 0.0,
      pendingAmount: (json['pendingAmount'] as num?)?.toDouble() ?? 0.0,
      projectNames: (json['projectNames'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$VendorSummaryImplToJson(_$VendorSummaryImpl instance) =>
    <String, dynamic>{
      'vendor': instance.vendor,
      'transactions': instance.transactions,
      'totalPaid': instance.totalPaid,
      'pendingAmount': instance.pendingAmount,
      'projectNames': instance.projectNames,
    };
