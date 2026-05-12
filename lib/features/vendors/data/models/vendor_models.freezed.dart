// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VendorModel _$VendorModelFromJson(Map<String, dynamic> json) {
  return _VendorModel.fromJson(json);
}

/// @nodoc
mixin _$VendorModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  String? get categoryIcon => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  double get totalPaid => throw _privateConstructorUsedError;
  int get transactionCount => throw _privateConstructorUsedError;
  int get projectCount => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this VendorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorModelCopyWith<VendorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorModelCopyWith<$Res> {
  factory $VendorModelCopyWith(
          VendorModel value, $Res Function(VendorModel) then) =
      _$VendorModelCopyWithImpl<$Res, VendorModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? categoryId,
      String? categoryName,
      String? categoryIcon,
      String? phone,
      String? email,
      String? address,
      String? notes,
      bool isActive,
      double totalPaid,
      int transactionCount,
      int projectCount,
      String? createdAt});
}

/// @nodoc
class _$VendorModelCopyWithImpl<$Res, $Val extends VendorModel>
    implements $VendorModelCopyWith<$Res> {
  _$VendorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? categoryIcon = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? notes = freezed,
    Object? isActive = null,
    Object? totalPaid = null,
    Object? transactionCount = null,
    Object? projectCount = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryIcon: freezed == categoryIcon
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      totalPaid: null == totalPaid
          ? _value.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      projectCount: null == projectCount
          ? _value.projectCount
          : projectCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VendorModelImplCopyWith<$Res>
    implements $VendorModelCopyWith<$Res> {
  factory _$$VendorModelImplCopyWith(
          _$VendorModelImpl value, $Res Function(_$VendorModelImpl) then) =
      __$$VendorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? categoryId,
      String? categoryName,
      String? categoryIcon,
      String? phone,
      String? email,
      String? address,
      String? notes,
      bool isActive,
      double totalPaid,
      int transactionCount,
      int projectCount,
      String? createdAt});
}

/// @nodoc
class __$$VendorModelImplCopyWithImpl<$Res>
    extends _$VendorModelCopyWithImpl<$Res, _$VendorModelImpl>
    implements _$$VendorModelImplCopyWith<$Res> {
  __$$VendorModelImplCopyWithImpl(
      _$VendorModelImpl _value, $Res Function(_$VendorModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VendorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? categoryIcon = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? notes = freezed,
    Object? isActive = null,
    Object? totalPaid = null,
    Object? transactionCount = null,
    Object? projectCount = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$VendorModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryIcon: freezed == categoryIcon
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      totalPaid: null == totalPaid
          ? _value.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      projectCount: null == projectCount
          ? _value.projectCount
          : projectCount // ignore: cast_nullable_to_non_nullable
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
class _$VendorModelImpl implements _VendorModel {
  const _$VendorModelImpl(
      {required this.id,
      required this.name,
      this.categoryId,
      this.categoryName,
      this.categoryIcon,
      this.phone,
      this.email,
      this.address,
      this.notes,
      this.isActive = true,
      this.totalPaid = 0.0,
      this.transactionCount = 0,
      this.projectCount = 0,
      this.createdAt});

  factory _$VendorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? categoryId;
  @override
  final String? categoryName;
  @override
  final String? categoryIcon;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? address;
  @override
  final String? notes;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final double totalPaid;
  @override
  @JsonKey()
  final int transactionCount;
  @override
  @JsonKey()
  final int projectCount;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'VendorModel(id: $id, name: $name, categoryId: $categoryId, categoryName: $categoryName, categoryIcon: $categoryIcon, phone: $phone, email: $email, address: $address, notes: $notes, isActive: $isActive, totalPaid: $totalPaid, transactionCount: $transactionCount, projectCount: $projectCount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryIcon, categoryIcon) ||
                other.categoryIcon == categoryIcon) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.totalPaid, totalPaid) ||
                other.totalPaid == totalPaid) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount) &&
            (identical(other.projectCount, projectCount) ||
                other.projectCount == projectCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      categoryId,
      categoryName,
      categoryIcon,
      phone,
      email,
      address,
      notes,
      isActive,
      totalPaid,
      transactionCount,
      projectCount,
      createdAt);

  /// Create a copy of VendorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorModelImplCopyWith<_$VendorModelImpl> get copyWith =>
      __$$VendorModelImplCopyWithImpl<_$VendorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorModelImplToJson(
      this,
    );
  }
}

abstract class _VendorModel implements VendorModel {
  const factory _VendorModel(
      {required final String id,
      required final String name,
      final String? categoryId,
      final String? categoryName,
      final String? categoryIcon,
      final String? phone,
      final String? email,
      final String? address,
      final String? notes,
      final bool isActive,
      final double totalPaid,
      final int transactionCount,
      final int projectCount,
      final String? createdAt}) = _$VendorModelImpl;

  factory _VendorModel.fromJson(Map<String, dynamic> json) =
      _$VendorModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get categoryId;
  @override
  String? get categoryName;
  @override
  String? get categoryIcon;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get address;
  @override
  String? get notes;
  @override
  bool get isActive;
  @override
  double get totalPaid;
  @override
  int get transactionCount;
  @override
  int get projectCount;
  @override
  String? get createdAt;

  /// Create a copy of VendorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorModelImplCopyWith<_$VendorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VendorTransaction _$VendorTransactionFromJson(Map<String, dynamic> json) {
  return _VendorTransaction.fromJson(json);
}

/// @nodoc
mixin _$VendorTransaction {
  String get id => throw _privateConstructorUsedError;
  String get projectName => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get expenseDate => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get paymentStatus => throw _privateConstructorUsedError;

  /// Serializes this VendorTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorTransactionCopyWith<VendorTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorTransactionCopyWith<$Res> {
  factory $VendorTransactionCopyWith(
          VendorTransaction value, $Res Function(VendorTransaction) then) =
      _$VendorTransactionCopyWithImpl<$Res, VendorTransaction>;
  @useResult
  $Res call(
      {String id,
      String projectName,
      double amount,
      String expenseDate,
      String title,
      String? paymentMethod,
      String? paymentStatus});
}

/// @nodoc
class _$VendorTransactionCopyWithImpl<$Res, $Val extends VendorTransaction>
    implements $VendorTransactionCopyWith<$Res> {
  _$VendorTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectName = null,
    Object? amount = null,
    Object? expenseDate = null,
    Object? title = null,
    Object? paymentMethod = freezed,
    Object? paymentStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      expenseDate: null == expenseDate
          ? _value.expenseDate
          : expenseDate // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VendorTransactionImplCopyWith<$Res>
    implements $VendorTransactionCopyWith<$Res> {
  factory _$$VendorTransactionImplCopyWith(_$VendorTransactionImpl value,
          $Res Function(_$VendorTransactionImpl) then) =
      __$$VendorTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String projectName,
      double amount,
      String expenseDate,
      String title,
      String? paymentMethod,
      String? paymentStatus});
}

/// @nodoc
class __$$VendorTransactionImplCopyWithImpl<$Res>
    extends _$VendorTransactionCopyWithImpl<$Res, _$VendorTransactionImpl>
    implements _$$VendorTransactionImplCopyWith<$Res> {
  __$$VendorTransactionImplCopyWithImpl(_$VendorTransactionImpl _value,
      $Res Function(_$VendorTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of VendorTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectName = null,
    Object? amount = null,
    Object? expenseDate = null,
    Object? title = null,
    Object? paymentMethod = freezed,
    Object? paymentStatus = freezed,
  }) {
    return _then(_$VendorTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      expenseDate: null == expenseDate
          ? _value.expenseDate
          : expenseDate // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorTransactionImpl implements _VendorTransaction {
  const _$VendorTransactionImpl(
      {required this.id,
      required this.projectName,
      required this.amount,
      required this.expenseDate,
      required this.title,
      this.paymentMethod,
      this.paymentStatus});

  factory _$VendorTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorTransactionImplFromJson(json);

  @override
  final String id;
  @override
  final String projectName;
  @override
  final double amount;
  @override
  final String expenseDate;
  @override
  final String title;
  @override
  final String? paymentMethod;
  @override
  final String? paymentStatus;

  @override
  String toString() {
    return 'VendorTransaction(id: $id, projectName: $projectName, amount: $amount, expenseDate: $expenseDate, title: $title, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.expenseDate, expenseDate) ||
                other.expenseDate == expenseDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, projectName, amount,
      expenseDate, title, paymentMethod, paymentStatus);

  /// Create a copy of VendorTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorTransactionImplCopyWith<_$VendorTransactionImpl> get copyWith =>
      __$$VendorTransactionImplCopyWithImpl<_$VendorTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorTransactionImplToJson(
      this,
    );
  }
}

abstract class _VendorTransaction implements VendorTransaction {
  const factory _VendorTransaction(
      {required final String id,
      required final String projectName,
      required final double amount,
      required final String expenseDate,
      required final String title,
      final String? paymentMethod,
      final String? paymentStatus}) = _$VendorTransactionImpl;

  factory _VendorTransaction.fromJson(Map<String, dynamic> json) =
      _$VendorTransactionImpl.fromJson;

  @override
  String get id;
  @override
  String get projectName;
  @override
  double get amount;
  @override
  String get expenseDate;
  @override
  String get title;
  @override
  String? get paymentMethod;
  @override
  String? get paymentStatus;

  /// Create a copy of VendorTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorTransactionImplCopyWith<_$VendorTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VendorSummary _$VendorSummaryFromJson(Map<String, dynamic> json) {
  return _VendorSummary.fromJson(json);
}

/// @nodoc
mixin _$VendorSummary {
  VendorModel get vendor => throw _privateConstructorUsedError;
  List<VendorTransaction> get transactions =>
      throw _privateConstructorUsedError;
  double get totalPaid => throw _privateConstructorUsedError;
  double get pendingAmount => throw _privateConstructorUsedError;
  List<String> get projectNames => throw _privateConstructorUsedError;

  /// Serializes this VendorSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorSummaryCopyWith<VendorSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorSummaryCopyWith<$Res> {
  factory $VendorSummaryCopyWith(
          VendorSummary value, $Res Function(VendorSummary) then) =
      _$VendorSummaryCopyWithImpl<$Res, VendorSummary>;
  @useResult
  $Res call(
      {VendorModel vendor,
      List<VendorTransaction> transactions,
      double totalPaid,
      double pendingAmount,
      List<String> projectNames});

  $VendorModelCopyWith<$Res> get vendor;
}

/// @nodoc
class _$VendorSummaryCopyWithImpl<$Res, $Val extends VendorSummary>
    implements $VendorSummaryCopyWith<$Res> {
  _$VendorSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendor = null,
    Object? transactions = null,
    Object? totalPaid = null,
    Object? pendingAmount = null,
    Object? projectNames = null,
  }) {
    return _then(_value.copyWith(
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VendorModel,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<VendorTransaction>,
      totalPaid: null == totalPaid
          ? _value.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as double,
      pendingAmount: null == pendingAmount
          ? _value.pendingAmount
          : pendingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      projectNames: null == projectNames
          ? _value.projectNames
          : projectNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of VendorSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VendorModelCopyWith<$Res> get vendor {
    return $VendorModelCopyWith<$Res>(_value.vendor, (value) {
      return _then(_value.copyWith(vendor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VendorSummaryImplCopyWith<$Res>
    implements $VendorSummaryCopyWith<$Res> {
  factory _$$VendorSummaryImplCopyWith(
          _$VendorSummaryImpl value, $Res Function(_$VendorSummaryImpl) then) =
      __$$VendorSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {VendorModel vendor,
      List<VendorTransaction> transactions,
      double totalPaid,
      double pendingAmount,
      List<String> projectNames});

  @override
  $VendorModelCopyWith<$Res> get vendor;
}

/// @nodoc
class __$$VendorSummaryImplCopyWithImpl<$Res>
    extends _$VendorSummaryCopyWithImpl<$Res, _$VendorSummaryImpl>
    implements _$$VendorSummaryImplCopyWith<$Res> {
  __$$VendorSummaryImplCopyWithImpl(
      _$VendorSummaryImpl _value, $Res Function(_$VendorSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of VendorSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendor = null,
    Object? transactions = null,
    Object? totalPaid = null,
    Object? pendingAmount = null,
    Object? projectNames = null,
  }) {
    return _then(_$VendorSummaryImpl(
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VendorModel,
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<VendorTransaction>,
      totalPaid: null == totalPaid
          ? _value.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as double,
      pendingAmount: null == pendingAmount
          ? _value.pendingAmount
          : pendingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      projectNames: null == projectNames
          ? _value._projectNames
          : projectNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorSummaryImpl implements _VendorSummary {
  const _$VendorSummaryImpl(
      {required this.vendor,
      final List<VendorTransaction> transactions = const [],
      this.totalPaid = 0.0,
      this.pendingAmount = 0.0,
      final List<String> projectNames = const []})
      : _transactions = transactions,
        _projectNames = projectNames;

  factory _$VendorSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorSummaryImplFromJson(json);

  @override
  final VendorModel vendor;
  final List<VendorTransaction> _transactions;
  @override
  @JsonKey()
  List<VendorTransaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  @JsonKey()
  final double totalPaid;
  @override
  @JsonKey()
  final double pendingAmount;
  final List<String> _projectNames;
  @override
  @JsonKey()
  List<String> get projectNames {
    if (_projectNames is EqualUnmodifiableListView) return _projectNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projectNames);
  }

  @override
  String toString() {
    return 'VendorSummary(vendor: $vendor, transactions: $transactions, totalPaid: $totalPaid, pendingAmount: $pendingAmount, projectNames: $projectNames)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorSummaryImpl &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.totalPaid, totalPaid) ||
                other.totalPaid == totalPaid) &&
            (identical(other.pendingAmount, pendingAmount) ||
                other.pendingAmount == pendingAmount) &&
            const DeepCollectionEquality()
                .equals(other._projectNames, _projectNames));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      vendor,
      const DeepCollectionEquality().hash(_transactions),
      totalPaid,
      pendingAmount,
      const DeepCollectionEquality().hash(_projectNames));

  /// Create a copy of VendorSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorSummaryImplCopyWith<_$VendorSummaryImpl> get copyWith =>
      __$$VendorSummaryImplCopyWithImpl<_$VendorSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorSummaryImplToJson(
      this,
    );
  }
}

abstract class _VendorSummary implements VendorSummary {
  const factory _VendorSummary(
      {required final VendorModel vendor,
      final List<VendorTransaction> transactions,
      final double totalPaid,
      final double pendingAmount,
      final List<String> projectNames}) = _$VendorSummaryImpl;

  factory _VendorSummary.fromJson(Map<String, dynamic> json) =
      _$VendorSummaryImpl.fromJson;

  @override
  VendorModel get vendor;
  @override
  List<VendorTransaction> get transactions;
  @override
  double get totalPaid;
  @override
  double get pendingAmount;
  @override
  List<String> get projectNames;

  /// Create a copy of VendorSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorSummaryImplCopyWith<_$VendorSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
