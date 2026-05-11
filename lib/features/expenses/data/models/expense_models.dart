import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:flutter/material.dart';

part 'expense_models.freezed.dart';
part 'expense_models.g.dart';

@freezed
class ExpenseCategory with _$ExpenseCategory {
  const factory ExpenseCategory({
    required String id,
    required String nameEn,
    required String nameUr,
    required String icon,
    String? colorHex,
    @Default(true) bool isActive,
    @Default(0) int sortOrder,
  }) = _ExpenseCategory;

  factory ExpenseCategory.fromJson(Map<String, dynamic> json) =>
      _$ExpenseCategoryFromJson(json);
}

@freezed
class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel({
    required String id,
    required String projectId,
    required String title,
    required double amount,
    required String categoryId,
    required String expenseDate,
    required String paymentMethod,
    @Default(0.0)   double taxAmount,
    @Default(0.0)   double totalAmount,
    @Default('paid') String paymentStatus,
    String? phaseId,
    String? vendorId,
    String? vendorName,
    String? notes,
    String? categoryName,
    String? categoryIcon,
    String? categoryColor,
    String? addedByName,
    @Default(false) bool isFlagged,
    @Default([])    List<ExpenseAttachment> attachments,
    String? createdAt,
  }) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);
}

@freezed
class ExpenseAttachment with _$ExpenseAttachment {
  const factory ExpenseAttachment({
    required String id,
    required String filePath,
    required String fileType,
    String? originalName,
    int? fileSizeKb,
  }) = _ExpenseAttachment;

  factory ExpenseAttachment.fromJson(Map<String, dynamic> json) =>
      _$ExpenseAttachmentFromJson(json);
}

@freezed
class ExpenseFilter with _$ExpenseFilter {
  const factory ExpenseFilter({
    String? categoryId,
    String? paymentMethod,
    String? paymentStatus,
    String? phaseId,
    String? vendorId,
    String? dateFrom,
    String? dateTo,
    String? search,
    @Default('date_desc') String sortBy,
  }) = _ExpenseFilter;
}

// Payment methods
const kPaymentMethods = [
  {'slug': 'cash',          'label': 'Cash',          'icon': '💵'},
  {'slug': 'bank_transfer', 'label': 'Bank Transfer',  'icon': '🏦'},
  {'slug': 'cheque',        'label': 'Cheque',        'icon': '📝'},
  {'slug': 'credit',        'label': 'Credit',        'icon': '💳'},
  {'slug': 'pending',       'label': 'Pending',       'icon': '⏳'},
];

// Default categories (matches DB seed)
const kDefaultCategories = [
  {'id': '1',  'nameEn': 'Materials',           'nameUr': 'سامان',          'icon': '🏗️', 'color': '6B4EFF'},
  {'id': '2',  'nameEn': 'Labor / Contractors', 'nameUr': 'مزدوری',          'icon': '👷', 'color': '0EA5E9'},
  {'id': '3',  'nameEn': 'Equipment & Tools',   'nameUr': 'آلات',           'icon': '🚜', 'color': 'F59E0B'},
  {'id': '4',  'nameEn': 'Fuel & Utilities',    'nameUr': 'ایندھن',         'icon': '⛽', 'color': 'EF4444'},
  {'id': '5',  'nameEn': 'Transport',           'nameUr': 'ٹرانسپورٹ',     'icon': '🚚', 'color': '10B981'},
  {'id': '6',  'nameEn': 'Professional Fees',   'nameUr': 'پیشہ ورانہ فیس','icon': '📐', 'color': '8B5CF6'},
  {'id': '7',  'nameEn': 'Permits & Govt',      'nameUr': 'اجازت نامے',    'icon': '📋', 'color': 'F97316'},
  {'id': '8',  'nameEn': 'Safety & PPE',        'nameUr': 'حفاظت',         'icon': '🦺', 'color': '14B8A6'},
  {'id': '9',  'nameEn': 'Site Setup',          'nameUr': 'سائٹ سیٹ اپ',  'icon': '🏢', 'color': '6366F1'},
  {'id': '10', 'nameEn': 'Plumbing',            'nameUr': 'پلمبنگ',        'icon': '💧', 'color': '3B82F6'},
  {'id': '11', 'nameEn': 'Electrical',          'nameUr': 'بجلی',          'icon': '⚡', 'color': 'EAB308'},
  {'id': '12', 'nameEn': 'Finishing',           'nameUr': 'فنشنگ',         'icon': '🎨', 'color': 'EC4899'},
  {'id': '13', 'nameEn': 'Miscellaneous',       'nameUr': 'متفرق',         'icon': '💰', 'color': '94A3B8'},
];
