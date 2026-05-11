// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpenseCategory _$ExpenseCategoryFromJson(Map<String, dynamic> json) {
  return _ExpenseCategory.fromJson(json);
}

/// @nodoc
mixin _$ExpenseCategory {
  String get id => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  String get nameUr => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String? get colorHex => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this ExpenseCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseCategoryCopyWith<ExpenseCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseCategoryCopyWith<$Res> {
  factory $ExpenseCategoryCopyWith(
          ExpenseCategory value, $Res Function(ExpenseCategory) then) =
      _$ExpenseCategoryCopyWithImpl<$Res, ExpenseCategory>;
  @useResult
  $Res call(
      {String id,
      String nameEn,
      String nameUr,
      String icon,
      String? colorHex,
      bool isActive,
      int sortOrder});
}

/// @nodoc
class _$ExpenseCategoryCopyWithImpl<$Res, $Val extends ExpenseCategory>
    implements $ExpenseCategoryCopyWith<$Res> {
  _$ExpenseCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameEn = null,
    Object? nameUr = null,
    Object? icon = null,
    Object? colorHex = freezed,
    Object? isActive = null,
    Object? sortOrder = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameUr: null == nameUr
          ? _value.nameUr
          : nameUr // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      colorHex: freezed == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseCategoryImplCopyWith<$Res>
    implements $ExpenseCategoryCopyWith<$Res> {
  factory _$$ExpenseCategoryImplCopyWith(_$ExpenseCategoryImpl value,
          $Res Function(_$ExpenseCategoryImpl) then) =
      __$$ExpenseCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nameEn,
      String nameUr,
      String icon,
      String? colorHex,
      bool isActive,
      int sortOrder});
}

/// @nodoc
class __$$ExpenseCategoryImplCopyWithImpl<$Res>
    extends _$ExpenseCategoryCopyWithImpl<$Res, _$ExpenseCategoryImpl>
    implements _$$ExpenseCategoryImplCopyWith<$Res> {
  __$$ExpenseCategoryImplCopyWithImpl(
      _$ExpenseCategoryImpl _value, $Res Function(_$ExpenseCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameEn = null,
    Object? nameUr = null,
    Object? icon = null,
    Object? colorHex = freezed,
    Object? isActive = null,
    Object? sortOrder = null,
  }) {
    return _then(_$ExpenseCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameUr: null == nameUr
          ? _value.nameUr
          : nameUr // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      colorHex: freezed == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseCategoryImpl implements _ExpenseCategory {
  const _$ExpenseCategoryImpl(
      {required this.id,
      required this.nameEn,
      required this.nameUr,
      required this.icon,
      this.colorHex,
      this.isActive = true,
      this.sortOrder = 0});

  factory _$ExpenseCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseCategoryImplFromJson(json);

  @override
  final String id;
  @override
  final String nameEn;
  @override
  final String nameUr;
  @override
  final String icon;
  @override
  final String? colorHex;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final int sortOrder;

  @override
  String toString() {
    return 'ExpenseCategory(id: $id, nameEn: $nameEn, nameUr: $nameUr, icon: $icon, colorHex: $colorHex, isActive: $isActive, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.nameUr, nameUr) || other.nameUr == nameUr) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.colorHex, colorHex) ||
                other.colorHex == colorHex) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, nameEn, nameUr, icon, colorHex, isActive, sortOrder);

  /// Create a copy of ExpenseCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseCategoryImplCopyWith<_$ExpenseCategoryImpl> get copyWith =>
      __$$ExpenseCategoryImplCopyWithImpl<_$ExpenseCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseCategoryImplToJson(
      this,
    );
  }
}

abstract class _ExpenseCategory implements ExpenseCategory {
  const factory _ExpenseCategory(
      {required final String id,
      required final String nameEn,
      required final String nameUr,
      required final String icon,
      final String? colorHex,
      final bool isActive,
      final int sortOrder}) = _$ExpenseCategoryImpl;

  factory _ExpenseCategory.fromJson(Map<String, dynamic> json) =
      _$ExpenseCategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get nameEn;
  @override
  String get nameUr;
  @override
  String get icon;
  @override
  String? get colorHex;
  @override
  bool get isActive;
  @override
  int get sortOrder;

  /// Create a copy of ExpenseCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseCategoryImplCopyWith<_$ExpenseCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExpenseModel _$ExpenseModelFromJson(Map<String, dynamic> json) {
  return _ExpenseModel.fromJson(json);
}

/// @nodoc
mixin _$ExpenseModel {
  String get id => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get expenseDate => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  double get taxAmount => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  String get paymentStatus => throw _privateConstructorUsedError;
  String? get phaseId => throw _privateConstructorUsedError;
  String? get vendorId => throw _privateConstructorUsedError;
  String? get vendorName => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  String? get categoryIcon => throw _privateConstructorUsedError;
  String? get categoryColor => throw _privateConstructorUsedError;
  String? get addedByName => throw _privateConstructorUsedError;
  bool get isFlagged => throw _privateConstructorUsedError;
  List<ExpenseAttachment> get attachments => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ExpenseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseModelCopyWith<ExpenseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseModelCopyWith<$Res> {
  factory $ExpenseModelCopyWith(
          ExpenseModel value, $Res Function(ExpenseModel) then) =
      _$ExpenseModelCopyWithImpl<$Res, ExpenseModel>;
  @useResult
  $Res call(
      {String id,
      String projectId,
      String title,
      double amount,
      String categoryId,
      String expenseDate,
      String paymentMethod,
      double taxAmount,
      double totalAmount,
      String paymentStatus,
      String? phaseId,
      String? vendorId,
      String? vendorName,
      String? notes,
      String? categoryName,
      String? categoryIcon,
      String? categoryColor,
      String? addedByName,
      bool isFlagged,
      List<ExpenseAttachment> attachments,
      String? createdAt});
}

/// @nodoc
class _$ExpenseModelCopyWithImpl<$Res, $Val extends ExpenseModel>
    implements $ExpenseModelCopyWith<$Res> {
  _$ExpenseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? title = null,
    Object? amount = null,
    Object? categoryId = null,
    Object? expenseDate = null,
    Object? paymentMethod = null,
    Object? taxAmount = null,
    Object? totalAmount = null,
    Object? paymentStatus = null,
    Object? phaseId = freezed,
    Object? vendorId = freezed,
    Object? vendorName = freezed,
    Object? notes = freezed,
    Object? categoryName = freezed,
    Object? categoryIcon = freezed,
    Object? categoryColor = freezed,
    Object? addedByName = freezed,
    Object? isFlagged = null,
    Object? attachments = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      expenseDate: null == expenseDate
          ? _value.expenseDate
          : expenseDate // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      phaseId: freezed == phaseId
          ? _value.phaseId
          : phaseId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: freezed == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorName: freezed == vendorName
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryIcon: freezed == categoryIcon
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryColor: freezed == categoryColor
          ? _value.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as String?,
      addedByName: freezed == addedByName
          ? _value.addedByName
          : addedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      isFlagged: null == isFlagged
          ? _value.isFlagged
          : isFlagged // ignore: cast_nullable_to_non_nullable
              as bool,
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<ExpenseAttachment>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseModelImplCopyWith<$Res>
    implements $ExpenseModelCopyWith<$Res> {
  factory _$$ExpenseModelImplCopyWith(
          _$ExpenseModelImpl value, $Res Function(_$ExpenseModelImpl) then) =
      __$$ExpenseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String projectId,
      String title,
      double amount,
      String categoryId,
      String expenseDate,
      String paymentMethod,
      double taxAmount,
      double totalAmount,
      String paymentStatus,
      String? phaseId,
      String? vendorId,
      String? vendorName,
      String? notes,
      String? categoryName,
      String? categoryIcon,
      String? categoryColor,
      String? addedByName,
      bool isFlagged,
      List<ExpenseAttachment> attachments,
      String? createdAt});
}

/// @nodoc
class __$$ExpenseModelImplCopyWithImpl<$Res>
    extends _$ExpenseModelCopyWithImpl<$Res, _$ExpenseModelImpl>
    implements _$$ExpenseModelImplCopyWith<$Res> {
  __$$ExpenseModelImplCopyWithImpl(
      _$ExpenseModelImpl _value, $Res Function(_$ExpenseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? title = null,
    Object? amount = null,
    Object? categoryId = null,
    Object? expenseDate = null,
    Object? paymentMethod = null,
    Object? taxAmount = null,
    Object? totalAmount = null,
    Object? paymentStatus = null,
    Object? phaseId = freezed,
    Object? vendorId = freezed,
    Object? vendorName = freezed,
    Object? notes = freezed,
    Object? categoryName = freezed,
    Object? categoryIcon = freezed,
    Object? categoryColor = freezed,
    Object? addedByName = freezed,
    Object? isFlagged = null,
    Object? attachments = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$ExpenseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      expenseDate: null == expenseDate
          ? _value.expenseDate
          : expenseDate // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      phaseId: freezed == phaseId
          ? _value.phaseId
          : phaseId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: freezed == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorName: freezed == vendorName
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryIcon: freezed == categoryIcon
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryColor: freezed == categoryColor
          ? _value.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as String?,
      addedByName: freezed == addedByName
          ? _value.addedByName
          : addedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      isFlagged: null == isFlagged
          ? _value.isFlagged
          : isFlagged // ignore: cast_nullable_to_non_nullable
              as bool,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<ExpenseAttachment>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseModelImpl implements _ExpenseModel {
  const _$ExpenseModelImpl(
      {required this.id,
      required this.projectId,
      required this.title,
      required this.amount,
      required this.categoryId,
      required this.expenseDate,
      required this.paymentMethod,
      this.taxAmount = 0.0,
      this.totalAmount = 0.0,
      this.paymentStatus = 'paid',
      this.phaseId,
      this.vendorId,
      this.vendorName,
      this.notes,
      this.categoryName,
      this.categoryIcon,
      this.categoryColor,
      this.addedByName,
      this.isFlagged = false,
      final List<ExpenseAttachment> attachments = const [],
      this.createdAt})
      : _attachments = attachments;

  factory _$ExpenseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseModelImplFromJson(json);

  @override
  final String id;
  @override
  final String projectId;
  @override
  final String title;
  @override
  final double amount;
  @override
  final String categoryId;
  @override
  final String expenseDate;
  @override
  final String paymentMethod;
  @override
  @JsonKey()
  final double taxAmount;
  @override
  @JsonKey()
  final double totalAmount;
  @override
  @JsonKey()
  final String paymentStatus;
  @override
  final String? phaseId;
  @override
  final String? vendorId;
  @override
  final String? vendorName;
  @override
  final String? notes;
  @override
  final String? categoryName;
  @override
  final String? categoryIcon;
  @override
  final String? categoryColor;
  @override
  final String? addedByName;
  @override
  @JsonKey()
  final bool isFlagged;
  final List<ExpenseAttachment> _attachments;
  @override
  @JsonKey()
  List<ExpenseAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  final String? createdAt;

  @override
  String toString() {
    return 'ExpenseModel(id: $id, projectId: $projectId, title: $title, amount: $amount, categoryId: $categoryId, expenseDate: $expenseDate, paymentMethod: $paymentMethod, taxAmount: $taxAmount, totalAmount: $totalAmount, paymentStatus: $paymentStatus, phaseId: $phaseId, vendorId: $vendorId, vendorName: $vendorName, notes: $notes, categoryName: $categoryName, categoryIcon: $categoryIcon, categoryColor: $categoryColor, addedByName: $addedByName, isFlagged: $isFlagged, attachments: $attachments, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.expenseDate, expenseDate) ||
                other.expenseDate == expenseDate) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.phaseId, phaseId) || other.phaseId == phaseId) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.vendorName, vendorName) ||
                other.vendorName == vendorName) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryIcon, categoryIcon) ||
                other.categoryIcon == categoryIcon) &&
            (identical(other.categoryColor, categoryColor) ||
                other.categoryColor == categoryColor) &&
            (identical(other.addedByName, addedByName) ||
                other.addedByName == addedByName) &&
            (identical(other.isFlagged, isFlagged) ||
                other.isFlagged == isFlagged) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        projectId,
        title,
        amount,
        categoryId,
        expenseDate,
        paymentMethod,
        taxAmount,
        totalAmount,
        paymentStatus,
        phaseId,
        vendorId,
        vendorName,
        notes,
        categoryName,
        categoryIcon,
        categoryColor,
        addedByName,
        isFlagged,
        const DeepCollectionEquality().hash(_attachments),
        createdAt
      ]);

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseModelImplCopyWith<_$ExpenseModelImpl> get copyWith =>
      __$$ExpenseModelImplCopyWithImpl<_$ExpenseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseModelImplToJson(
      this,
    );
  }
}

abstract class _ExpenseModel implements ExpenseModel {
  const factory _ExpenseModel(
      {required final String id,
      required final String projectId,
      required final String title,
      required final double amount,
      required final String categoryId,
      required final String expenseDate,
      required final String paymentMethod,
      final double taxAmount,
      final double totalAmount,
      final String paymentStatus,
      final String? phaseId,
      final String? vendorId,
      final String? vendorName,
      final String? notes,
      final String? categoryName,
      final String? categoryIcon,
      final String? categoryColor,
      final String? addedByName,
      final bool isFlagged,
      final List<ExpenseAttachment> attachments,
      final String? createdAt}) = _$ExpenseModelImpl;

  factory _ExpenseModel.fromJson(Map<String, dynamic> json) =
      _$ExpenseModelImpl.fromJson;

  @override
  String get id;
  @override
  String get projectId;
  @override
  String get title;
  @override
  double get amount;
  @override
  String get categoryId;
  @override
  String get expenseDate;
  @override
  String get paymentMethod;
  @override
  double get taxAmount;
  @override
  double get totalAmount;
  @override
  String get paymentStatus;
  @override
  String? get phaseId;
  @override
  String? get vendorId;
  @override
  String? get vendorName;
  @override
  String? get notes;
  @override
  String? get categoryName;
  @override
  String? get categoryIcon;
  @override
  String? get categoryColor;
  @override
  String? get addedByName;
  @override
  bool get isFlagged;
  @override
  List<ExpenseAttachment> get attachments;
  @override
  String? get createdAt;

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseModelImplCopyWith<_$ExpenseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExpenseAttachment _$ExpenseAttachmentFromJson(Map<String, dynamic> json) {
  return _ExpenseAttachment.fromJson(json);
}

/// @nodoc
mixin _$ExpenseAttachment {
  String get id => throw _privateConstructorUsedError;
  String get filePath => throw _privateConstructorUsedError;
  String get fileType => throw _privateConstructorUsedError;
  String? get originalName => throw _privateConstructorUsedError;
  int? get fileSizeKb => throw _privateConstructorUsedError;

  /// Serializes this ExpenseAttachment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseAttachmentCopyWith<ExpenseAttachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseAttachmentCopyWith<$Res> {
  factory $ExpenseAttachmentCopyWith(
          ExpenseAttachment value, $Res Function(ExpenseAttachment) then) =
      _$ExpenseAttachmentCopyWithImpl<$Res, ExpenseAttachment>;
  @useResult
  $Res call(
      {String id,
      String filePath,
      String fileType,
      String? originalName,
      int? fileSizeKb});
}

/// @nodoc
class _$ExpenseAttachmentCopyWithImpl<$Res, $Val extends ExpenseAttachment>
    implements $ExpenseAttachmentCopyWith<$Res> {
  _$ExpenseAttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filePath = null,
    Object? fileType = null,
    Object? originalName = freezed,
    Object? fileSizeKb = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSizeKb: freezed == fileSizeKb
          ? _value.fileSizeKb
          : fileSizeKb // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseAttachmentImplCopyWith<$Res>
    implements $ExpenseAttachmentCopyWith<$Res> {
  factory _$$ExpenseAttachmentImplCopyWith(_$ExpenseAttachmentImpl value,
          $Res Function(_$ExpenseAttachmentImpl) then) =
      __$$ExpenseAttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String filePath,
      String fileType,
      String? originalName,
      int? fileSizeKb});
}

/// @nodoc
class __$$ExpenseAttachmentImplCopyWithImpl<$Res>
    extends _$ExpenseAttachmentCopyWithImpl<$Res, _$ExpenseAttachmentImpl>
    implements _$$ExpenseAttachmentImplCopyWith<$Res> {
  __$$ExpenseAttachmentImplCopyWithImpl(_$ExpenseAttachmentImpl _value,
      $Res Function(_$ExpenseAttachmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filePath = null,
    Object? fileType = null,
    Object? originalName = freezed,
    Object? fileSizeKb = freezed,
  }) {
    return _then(_$ExpenseAttachmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSizeKb: freezed == fileSizeKb
          ? _value.fileSizeKb
          : fileSizeKb // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseAttachmentImpl implements _ExpenseAttachment {
  const _$ExpenseAttachmentImpl(
      {required this.id,
      required this.filePath,
      required this.fileType,
      this.originalName,
      this.fileSizeKb});

  factory _$ExpenseAttachmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseAttachmentImplFromJson(json);

  @override
  final String id;
  @override
  final String filePath;
  @override
  final String fileType;
  @override
  final String? originalName;
  @override
  final int? fileSizeKb;

  @override
  String toString() {
    return 'ExpenseAttachment(id: $id, filePath: $filePath, fileType: $fileType, originalName: $originalName, fileSizeKb: $fileSizeKb)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseAttachmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.fileSizeKb, fileSizeKb) ||
                other.fileSizeKb == fileSizeKb));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, filePath, fileType, originalName, fileSizeKb);

  /// Create a copy of ExpenseAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseAttachmentImplCopyWith<_$ExpenseAttachmentImpl> get copyWith =>
      __$$ExpenseAttachmentImplCopyWithImpl<_$ExpenseAttachmentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseAttachmentImplToJson(
      this,
    );
  }
}

abstract class _ExpenseAttachment implements ExpenseAttachment {
  const factory _ExpenseAttachment(
      {required final String id,
      required final String filePath,
      required final String fileType,
      final String? originalName,
      final int? fileSizeKb}) = _$ExpenseAttachmentImpl;

  factory _ExpenseAttachment.fromJson(Map<String, dynamic> json) =
      _$ExpenseAttachmentImpl.fromJson;

  @override
  String get id;
  @override
  String get filePath;
  @override
  String get fileType;
  @override
  String? get originalName;
  @override
  int? get fileSizeKb;

  /// Create a copy of ExpenseAttachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseAttachmentImplCopyWith<_$ExpenseAttachmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExpenseFilter {
  String? get categoryId => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get paymentStatus => throw _privateConstructorUsedError;
  String? get phaseId => throw _privateConstructorUsedError;
  String? get vendorId => throw _privateConstructorUsedError;
  String? get dateFrom => throw _privateConstructorUsedError;
  String? get dateTo => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;
  String get sortBy => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseFilterCopyWith<ExpenseFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseFilterCopyWith<$Res> {
  factory $ExpenseFilterCopyWith(
          ExpenseFilter value, $Res Function(ExpenseFilter) then) =
      _$ExpenseFilterCopyWithImpl<$Res, ExpenseFilter>;
  @useResult
  $Res call(
      {String? categoryId,
      String? paymentMethod,
      String? paymentStatus,
      String? phaseId,
      String? vendorId,
      String? dateFrom,
      String? dateTo,
      String? search,
      String sortBy});
}

/// @nodoc
class _$ExpenseFilterCopyWithImpl<$Res, $Val extends ExpenseFilter>
    implements $ExpenseFilterCopyWith<$Res> {
  _$ExpenseFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? paymentMethod = freezed,
    Object? paymentStatus = freezed,
    Object? phaseId = freezed,
    Object? vendorId = freezed,
    Object? dateFrom = freezed,
    Object? dateTo = freezed,
    Object? search = freezed,
    Object? sortBy = null,
  }) {
    return _then(_value.copyWith(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      phaseId: freezed == phaseId
          ? _value.phaseId
          : phaseId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: freezed == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      dateFrom: freezed == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTo: freezed == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as String?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseFilterImplCopyWith<$Res>
    implements $ExpenseFilterCopyWith<$Res> {
  factory _$$ExpenseFilterImplCopyWith(
          _$ExpenseFilterImpl value, $Res Function(_$ExpenseFilterImpl) then) =
      __$$ExpenseFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? categoryId,
      String? paymentMethod,
      String? paymentStatus,
      String? phaseId,
      String? vendorId,
      String? dateFrom,
      String? dateTo,
      String? search,
      String sortBy});
}

/// @nodoc
class __$$ExpenseFilterImplCopyWithImpl<$Res>
    extends _$ExpenseFilterCopyWithImpl<$Res, _$ExpenseFilterImpl>
    implements _$$ExpenseFilterImplCopyWith<$Res> {
  __$$ExpenseFilterImplCopyWithImpl(
      _$ExpenseFilterImpl _value, $Res Function(_$ExpenseFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? paymentMethod = freezed,
    Object? paymentStatus = freezed,
    Object? phaseId = freezed,
    Object? vendorId = freezed,
    Object? dateFrom = freezed,
    Object? dateTo = freezed,
    Object? search = freezed,
    Object? sortBy = null,
  }) {
    return _then(_$ExpenseFilterImpl(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      phaseId: freezed == phaseId
          ? _value.phaseId
          : phaseId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: freezed == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      dateFrom: freezed == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTo: freezed == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as String?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ExpenseFilterImpl implements _ExpenseFilter {
  const _$ExpenseFilterImpl(
      {this.categoryId,
      this.paymentMethod,
      this.paymentStatus,
      this.phaseId,
      this.vendorId,
      this.dateFrom,
      this.dateTo,
      this.search,
      this.sortBy = 'date_desc'});

  @override
  final String? categoryId;
  @override
  final String? paymentMethod;
  @override
  final String? paymentStatus;
  @override
  final String? phaseId;
  @override
  final String? vendorId;
  @override
  final String? dateFrom;
  @override
  final String? dateTo;
  @override
  final String? search;
  @override
  @JsonKey()
  final String sortBy;

  @override
  String toString() {
    return 'ExpenseFilter(categoryId: $categoryId, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, phaseId: $phaseId, vendorId: $vendorId, dateFrom: $dateFrom, dateTo: $dateTo, search: $search, sortBy: $sortBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseFilterImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.phaseId, phaseId) || other.phaseId == phaseId) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.dateFrom, dateFrom) ||
                other.dateFrom == dateFrom) &&
            (identical(other.dateTo, dateTo) || other.dateTo == dateTo) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId, paymentMethod,
      paymentStatus, phaseId, vendorId, dateFrom, dateTo, search, sortBy);

  /// Create a copy of ExpenseFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseFilterImplCopyWith<_$ExpenseFilterImpl> get copyWith =>
      __$$ExpenseFilterImplCopyWithImpl<_$ExpenseFilterImpl>(this, _$identity);
}

abstract class _ExpenseFilter implements ExpenseFilter {
  const factory _ExpenseFilter(
      {final String? categoryId,
      final String? paymentMethod,
      final String? paymentStatus,
      final String? phaseId,
      final String? vendorId,
      final String? dateFrom,
      final String? dateTo,
      final String? search,
      final String sortBy}) = _$ExpenseFilterImpl;

  @override
  String? get categoryId;
  @override
  String? get paymentMethod;
  @override
  String? get paymentStatus;
  @override
  String? get phaseId;
  @override
  String? get vendorId;
  @override
  String? get dateFrom;
  @override
  String? get dateTo;
  @override
  String? get search;
  @override
  String get sortBy;

  /// Create a copy of ExpenseFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseFilterImplCopyWith<_$ExpenseFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
