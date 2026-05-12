import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_models.freezed.dart';
part 'vendor_models.g.dart';

@freezed
class VendorModel with _$VendorModel {
  const factory VendorModel({
    required String id,
    required String name,
    String? categoryId,
    String? categoryName,
    String? categoryIcon,
    String? phone,
    String? email,
    String? address,
    String? notes,
    @Default(true)  bool   isActive,
    @Default(0.0)   double totalPaid,
    @Default(0)     int    transactionCount,
    @Default(0)     int    projectCount,
    String? createdAt,
  }) = _VendorModel;

  factory VendorModel.fromJson(Map<String, dynamic> json) =>
      _$VendorModelFromJson(json);
}

@freezed
class VendorTransaction with _$VendorTransaction {
  const factory VendorTransaction({
    required String id,
    required String projectName,
    required double amount,
    required String expenseDate,
    required String title,
    String? paymentMethod,
    String? paymentStatus,
  }) = _VendorTransaction;

  factory VendorTransaction.fromJson(Map<String, dynamic> json) =>
      _$VendorTransactionFromJson(json);
}

@freezed
class VendorSummary with _$VendorSummary {
  const factory VendorSummary({
    required VendorModel vendor,
    @Default([]) List<VendorTransaction> transactions,
    @Default(0.0) double totalPaid,
    @Default(0.0) double pendingAmount,
    @Default([])  List<String> projectNames,
  }) = _VendorSummary;

  factory VendorSummary.fromJson(Map<String, dynamic> json) =>
      _$VendorSummaryFromJson(json);
}
