// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_expense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DraftExpense _$DraftExpenseFromJson(Map<String, dynamic> json) {
  return _DraftExpense.fromJson(json);
}

/// @nodoc
mixin _$DraftExpense {
  String get localId => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String get expenseDate => throw _privateConstructorUsedError;
  String get paymentStatus => throw _privateConstructorUsedError;
  double get taxAmount => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get vendorId => throw _privateConstructorUsedError;
  String? get phaseId => throw _privateConstructorUsedError;
  List<String> get attachmentPaths => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;
  int get syncAttempts => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this DraftExpense to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DraftExpense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DraftExpenseCopyWith<DraftExpense> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraftExpenseCopyWith<$Res> {
  factory $DraftExpenseCopyWith(
          DraftExpense value, $Res Function(DraftExpense) then) =
      _$DraftExpenseCopyWithImpl<$Res, DraftExpense>;
  @useResult
  $Res call(
      {String localId,
      String projectId,
      String title,
      double amount,
      String categoryId,
      String paymentMethod,
      String expenseDate,
      String paymentStatus,
      double taxAmount,
      String? notes,
      String? vendorId,
      String? phaseId,
      List<String> attachmentPaths,
      bool isSynced,
      int syncAttempts,
      String? createdAt});
}

/// @nodoc
class _$DraftExpenseCopyWithImpl<$Res, $Val extends DraftExpense>
    implements $DraftExpenseCopyWith<$Res> {
  _$DraftExpenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DraftExpense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? projectId = null,
    Object? title = null,
    Object? amount = null,
    Object? categoryId = null,
    Object? paymentMethod = null,
    Object? expenseDate = null,
    Object? paymentStatus = null,
    Object? taxAmount = null,
    Object? notes = freezed,
    Object? vendorId = freezed,
    Object? phaseId = freezed,
    Object? attachmentPaths = null,
    Object? isSynced = null,
    Object? syncAttempts = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      localId: null == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
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
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      expenseDate: null == expenseDate
          ? _value.expenseDate
          : expenseDate // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: freezed == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      phaseId: freezed == phaseId
          ? _value.phaseId
          : phaseId // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentPaths: null == attachmentPaths
          ? _value.attachmentPaths
          : attachmentPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isSynced: null == isSynced
          ? _value.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
      syncAttempts: null == syncAttempts
          ? _value.syncAttempts
          : syncAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DraftExpenseImplCopyWith<$Res>
    implements $DraftExpenseCopyWith<$Res> {
  factory _$$DraftExpenseImplCopyWith(
          _$DraftExpenseImpl value, $Res Function(_$DraftExpenseImpl) then) =
      __$$DraftExpenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String localId,
      String projectId,
      String title,
      double amount,
      String categoryId,
      String paymentMethod,
      String expenseDate,
      String paymentStatus,
      double taxAmount,
      String? notes,
      String? vendorId,
      String? phaseId,
      List<String> attachmentPaths,
      bool isSynced,
      int syncAttempts,
      String? createdAt});
}

/// @nodoc
class __$$DraftExpenseImplCopyWithImpl<$Res>
    extends _$DraftExpenseCopyWithImpl<$Res, _$DraftExpenseImpl>
    implements _$$DraftExpenseImplCopyWith<$Res> {
  __$$DraftExpenseImplCopyWithImpl(
      _$DraftExpenseImpl _value, $Res Function(_$DraftExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraftExpense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? projectId = null,
    Object? title = null,
    Object? amount = null,
    Object? categoryId = null,
    Object? paymentMethod = null,
    Object? expenseDate = null,
    Object? paymentStatus = null,
    Object? taxAmount = null,
    Object? notes = freezed,
    Object? vendorId = freezed,
    Object? phaseId = freezed,
    Object? attachmentPaths = null,
    Object? isSynced = null,
    Object? syncAttempts = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$DraftExpenseImpl(
      localId: null == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
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
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      expenseDate: null == expenseDate
          ? _value.expenseDate
          : expenseDate // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: freezed == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      phaseId: freezed == phaseId
          ? _value.phaseId
          : phaseId // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentPaths: null == attachmentPaths
          ? _value._attachmentPaths
          : attachmentPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isSynced: null == isSynced
          ? _value.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
      syncAttempts: null == syncAttempts
          ? _value.syncAttempts
          : syncAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DraftExpenseImpl implements _DraftExpense {
  const _$DraftExpenseImpl(
      {required this.localId,
      required this.projectId,
      required this.title,
      required this.amount,
      required this.categoryId,
      required this.paymentMethod,
      required this.expenseDate,
      this.paymentStatus = 'paid',
      this.taxAmount = 0.0,
      this.notes,
      this.vendorId,
      this.phaseId,
      final List<String> attachmentPaths = const [],
      this.isSynced = false,
      this.syncAttempts = 0,
      this.createdAt})
      : _attachmentPaths = attachmentPaths;

  factory _$DraftExpenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DraftExpenseImplFromJson(json);

  @override
  final String localId;
  @override
  final String projectId;
  @override
  final String title;
  @override
  final double amount;
  @override
  final String categoryId;
  @override
  final String paymentMethod;
  @override
  final String expenseDate;
  @override
  @JsonKey()
  final String paymentStatus;
  @override
  @JsonKey()
  final double taxAmount;
  @override
  final String? notes;
  @override
  final String? vendorId;
  @override
  final String? phaseId;
  final List<String> _attachmentPaths;
  @override
  @JsonKey()
  List<String> get attachmentPaths {
    if (_attachmentPaths is EqualUnmodifiableListView) return _attachmentPaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachmentPaths);
  }

  @override
  @JsonKey()
  final bool isSynced;
  @override
  @JsonKey()
  final int syncAttempts;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'DraftExpense(localId: $localId, projectId: $projectId, title: $title, amount: $amount, categoryId: $categoryId, paymentMethod: $paymentMethod, expenseDate: $expenseDate, paymentStatus: $paymentStatus, taxAmount: $taxAmount, notes: $notes, vendorId: $vendorId, phaseId: $phaseId, attachmentPaths: $attachmentPaths, isSynced: $isSynced, syncAttempts: $syncAttempts, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraftExpenseImpl &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.expenseDate, expenseDate) ||
                other.expenseDate == expenseDate) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.phaseId, phaseId) || other.phaseId == phaseId) &&
            const DeepCollectionEquality()
                .equals(other._attachmentPaths, _attachmentPaths) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced) &&
            (identical(other.syncAttempts, syncAttempts) ||
                other.syncAttempts == syncAttempts) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      localId,
      projectId,
      title,
      amount,
      categoryId,
      paymentMethod,
      expenseDate,
      paymentStatus,
      taxAmount,
      notes,
      vendorId,
      phaseId,
      const DeepCollectionEquality().hash(_attachmentPaths),
      isSynced,
      syncAttempts,
      createdAt);

  /// Create a copy of DraftExpense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DraftExpenseImplCopyWith<_$DraftExpenseImpl> get copyWith =>
      __$$DraftExpenseImplCopyWithImpl<_$DraftExpenseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DraftExpenseImplToJson(
      this,
    );
  }
}

abstract class _DraftExpense implements DraftExpense {
  const factory _DraftExpense(
      {required final String localId,
      required final String projectId,
      required final String title,
      required final double amount,
      required final String categoryId,
      required final String paymentMethod,
      required final String expenseDate,
      final String paymentStatus,
      final double taxAmount,
      final String? notes,
      final String? vendorId,
      final String? phaseId,
      final List<String> attachmentPaths,
      final bool isSynced,
      final int syncAttempts,
      final String? createdAt}) = _$DraftExpenseImpl;

  factory _DraftExpense.fromJson(Map<String, dynamic> json) =
      _$DraftExpenseImpl.fromJson;

  @override
  String get localId;
  @override
  String get projectId;
  @override
  String get title;
  @override
  double get amount;
  @override
  String get categoryId;
  @override
  String get paymentMethod;
  @override
  String get expenseDate;
  @override
  String get paymentStatus;
  @override
  double get taxAmount;
  @override
  String? get notes;
  @override
  String? get vendorId;
  @override
  String? get phaseId;
  @override
  List<String> get attachmentPaths;
  @override
  bool get isSynced;
  @override
  int get syncAttempts;
  @override
  String? get createdAt;

  /// Create a copy of DraftExpense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DraftExpenseImplCopyWith<_$DraftExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
