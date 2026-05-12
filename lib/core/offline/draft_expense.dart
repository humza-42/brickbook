import 'package:freezed_annotation/freezed_annotation.dart';

part 'draft_expense.freezed.dart';
part 'draft_expense.g.dart';

@freezed
class DraftExpense with _$DraftExpense {
  const factory DraftExpense({
    required String localId,
    required String projectId,
    required String title,
    required double amount,
    required String categoryId,
    required String paymentMethod,
    required String expenseDate,
    @Default('paid') String paymentStatus,
    @Default(0.0) double taxAmount,
    String? notes,
    String? vendorId,
    String? phaseId,
    @Default([]) List<String> attachmentPaths,
    @Default(false) bool isSynced,
    @Default(0) int syncAttempts,
    String? createdAt,
  }) = _DraftExpense;

  factory DraftExpense.fromJson(Map<String, dynamic> json) =>
      _$DraftExpenseFromJson(json);
}
