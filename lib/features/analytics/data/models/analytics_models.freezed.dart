// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectAnalytics _$ProjectAnalyticsFromJson(Map<String, dynamic> json) {
  return _ProjectAnalytics.fromJson(json);
}

/// @nodoc
mixin _$ProjectAnalytics {
  String get projectId => throw _privateConstructorUsedError;
  double get totalBudget => throw _privateConstructorUsedError;
  double get totalSpent => throw _privateConstructorUsedError;
  double get remaining => throw _privateConstructorUsedError;
  double get taxPaid => throw _privateConstructorUsedError;
  List<CategorySpend> get byCategory => throw _privateConstructorUsedError;
  List<MonthlySpend> get byMonth => throw _privateConstructorUsedError;
  List<PhaseSpend> get byPhase => throw _privateConstructorUsedError;
  List<VendorSpend> get byVendor => throw _privateConstructorUsedError;
  List<PaymentMethodSpend> get byPaymentMethod =>
      throw _privateConstructorUsedError;

  /// Serializes this ProjectAnalytics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectAnalyticsCopyWith<ProjectAnalytics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectAnalyticsCopyWith<$Res> {
  factory $ProjectAnalyticsCopyWith(
          ProjectAnalytics value, $Res Function(ProjectAnalytics) then) =
      _$ProjectAnalyticsCopyWithImpl<$Res, ProjectAnalytics>;
  @useResult
  $Res call(
      {String projectId,
      double totalBudget,
      double totalSpent,
      double remaining,
      double taxPaid,
      List<CategorySpend> byCategory,
      List<MonthlySpend> byMonth,
      List<PhaseSpend> byPhase,
      List<VendorSpend> byVendor,
      List<PaymentMethodSpend> byPaymentMethod});
}

/// @nodoc
class _$ProjectAnalyticsCopyWithImpl<$Res, $Val extends ProjectAnalytics>
    implements $ProjectAnalyticsCopyWith<$Res> {
  _$ProjectAnalyticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? totalBudget = null,
    Object? totalSpent = null,
    Object? remaining = null,
    Object? taxPaid = null,
    Object? byCategory = null,
    Object? byMonth = null,
    Object? byPhase = null,
    Object? byVendor = null,
    Object? byPaymentMethod = null,
  }) {
    return _then(_value.copyWith(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      totalBudget: null == totalBudget
          ? _value.totalBudget
          : totalBudget // ignore: cast_nullable_to_non_nullable
              as double,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      remaining: null == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as double,
      taxPaid: null == taxPaid
          ? _value.taxPaid
          : taxPaid // ignore: cast_nullable_to_non_nullable
              as double,
      byCategory: null == byCategory
          ? _value.byCategory
          : byCategory // ignore: cast_nullable_to_non_nullable
              as List<CategorySpend>,
      byMonth: null == byMonth
          ? _value.byMonth
          : byMonth // ignore: cast_nullable_to_non_nullable
              as List<MonthlySpend>,
      byPhase: null == byPhase
          ? _value.byPhase
          : byPhase // ignore: cast_nullable_to_non_nullable
              as List<PhaseSpend>,
      byVendor: null == byVendor
          ? _value.byVendor
          : byVendor // ignore: cast_nullable_to_non_nullable
              as List<VendorSpend>,
      byPaymentMethod: null == byPaymentMethod
          ? _value.byPaymentMethod
          : byPaymentMethod // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodSpend>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectAnalyticsImplCopyWith<$Res>
    implements $ProjectAnalyticsCopyWith<$Res> {
  factory _$$ProjectAnalyticsImplCopyWith(_$ProjectAnalyticsImpl value,
          $Res Function(_$ProjectAnalyticsImpl) then) =
      __$$ProjectAnalyticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String projectId,
      double totalBudget,
      double totalSpent,
      double remaining,
      double taxPaid,
      List<CategorySpend> byCategory,
      List<MonthlySpend> byMonth,
      List<PhaseSpend> byPhase,
      List<VendorSpend> byVendor,
      List<PaymentMethodSpend> byPaymentMethod});
}

/// @nodoc
class __$$ProjectAnalyticsImplCopyWithImpl<$Res>
    extends _$ProjectAnalyticsCopyWithImpl<$Res, _$ProjectAnalyticsImpl>
    implements _$$ProjectAnalyticsImplCopyWith<$Res> {
  __$$ProjectAnalyticsImplCopyWithImpl(_$ProjectAnalyticsImpl _value,
      $Res Function(_$ProjectAnalyticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? totalBudget = null,
    Object? totalSpent = null,
    Object? remaining = null,
    Object? taxPaid = null,
    Object? byCategory = null,
    Object? byMonth = null,
    Object? byPhase = null,
    Object? byVendor = null,
    Object? byPaymentMethod = null,
  }) {
    return _then(_$ProjectAnalyticsImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      totalBudget: null == totalBudget
          ? _value.totalBudget
          : totalBudget // ignore: cast_nullable_to_non_nullable
              as double,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      remaining: null == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as double,
      taxPaid: null == taxPaid
          ? _value.taxPaid
          : taxPaid // ignore: cast_nullable_to_non_nullable
              as double,
      byCategory: null == byCategory
          ? _value._byCategory
          : byCategory // ignore: cast_nullable_to_non_nullable
              as List<CategorySpend>,
      byMonth: null == byMonth
          ? _value._byMonth
          : byMonth // ignore: cast_nullable_to_non_nullable
              as List<MonthlySpend>,
      byPhase: null == byPhase
          ? _value._byPhase
          : byPhase // ignore: cast_nullable_to_non_nullable
              as List<PhaseSpend>,
      byVendor: null == byVendor
          ? _value._byVendor
          : byVendor // ignore: cast_nullable_to_non_nullable
              as List<VendorSpend>,
      byPaymentMethod: null == byPaymentMethod
          ? _value._byPaymentMethod
          : byPaymentMethod // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodSpend>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectAnalyticsImpl implements _ProjectAnalytics {
  const _$ProjectAnalyticsImpl(
      {required this.projectId,
      required this.totalBudget,
      required this.totalSpent,
      required this.remaining,
      this.taxPaid = 0.0,
      final List<CategorySpend> byCategory = const [],
      final List<MonthlySpend> byMonth = const [],
      final List<PhaseSpend> byPhase = const [],
      final List<VendorSpend> byVendor = const [],
      final List<PaymentMethodSpend> byPaymentMethod = const []})
      : _byCategory = byCategory,
        _byMonth = byMonth,
        _byPhase = byPhase,
        _byVendor = byVendor,
        _byPaymentMethod = byPaymentMethod;

  factory _$ProjectAnalyticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectAnalyticsImplFromJson(json);

  @override
  final String projectId;
  @override
  final double totalBudget;
  @override
  final double totalSpent;
  @override
  final double remaining;
  @override
  @JsonKey()
  final double taxPaid;
  final List<CategorySpend> _byCategory;
  @override
  @JsonKey()
  List<CategorySpend> get byCategory {
    if (_byCategory is EqualUnmodifiableListView) return _byCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_byCategory);
  }

  final List<MonthlySpend> _byMonth;
  @override
  @JsonKey()
  List<MonthlySpend> get byMonth {
    if (_byMonth is EqualUnmodifiableListView) return _byMonth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_byMonth);
  }

  final List<PhaseSpend> _byPhase;
  @override
  @JsonKey()
  List<PhaseSpend> get byPhase {
    if (_byPhase is EqualUnmodifiableListView) return _byPhase;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_byPhase);
  }

  final List<VendorSpend> _byVendor;
  @override
  @JsonKey()
  List<VendorSpend> get byVendor {
    if (_byVendor is EqualUnmodifiableListView) return _byVendor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_byVendor);
  }

  final List<PaymentMethodSpend> _byPaymentMethod;
  @override
  @JsonKey()
  List<PaymentMethodSpend> get byPaymentMethod {
    if (_byPaymentMethod is EqualUnmodifiableListView) return _byPaymentMethod;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_byPaymentMethod);
  }

  @override
  String toString() {
    return 'ProjectAnalytics(projectId: $projectId, totalBudget: $totalBudget, totalSpent: $totalSpent, remaining: $remaining, taxPaid: $taxPaid, byCategory: $byCategory, byMonth: $byMonth, byPhase: $byPhase, byVendor: $byVendor, byPaymentMethod: $byPaymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectAnalyticsImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.totalBudget, totalBudget) ||
                other.totalBudget == totalBudget) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.taxPaid, taxPaid) || other.taxPaid == taxPaid) &&
            const DeepCollectionEquality()
                .equals(other._byCategory, _byCategory) &&
            const DeepCollectionEquality().equals(other._byMonth, _byMonth) &&
            const DeepCollectionEquality().equals(other._byPhase, _byPhase) &&
            const DeepCollectionEquality().equals(other._byVendor, _byVendor) &&
            const DeepCollectionEquality()
                .equals(other._byPaymentMethod, _byPaymentMethod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectId,
      totalBudget,
      totalSpent,
      remaining,
      taxPaid,
      const DeepCollectionEquality().hash(_byCategory),
      const DeepCollectionEquality().hash(_byMonth),
      const DeepCollectionEquality().hash(_byPhase),
      const DeepCollectionEquality().hash(_byVendor),
      const DeepCollectionEquality().hash(_byPaymentMethod));

  /// Create a copy of ProjectAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectAnalyticsImplCopyWith<_$ProjectAnalyticsImpl> get copyWith =>
      __$$ProjectAnalyticsImplCopyWithImpl<_$ProjectAnalyticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectAnalyticsImplToJson(
      this,
    );
  }
}

abstract class _ProjectAnalytics implements ProjectAnalytics {
  const factory _ProjectAnalytics(
      {required final String projectId,
      required final double totalBudget,
      required final double totalSpent,
      required final double remaining,
      final double taxPaid,
      final List<CategorySpend> byCategory,
      final List<MonthlySpend> byMonth,
      final List<PhaseSpend> byPhase,
      final List<VendorSpend> byVendor,
      final List<PaymentMethodSpend> byPaymentMethod}) = _$ProjectAnalyticsImpl;

  factory _ProjectAnalytics.fromJson(Map<String, dynamic> json) =
      _$ProjectAnalyticsImpl.fromJson;

  @override
  String get projectId;
  @override
  double get totalBudget;
  @override
  double get totalSpent;
  @override
  double get remaining;
  @override
  double get taxPaid;
  @override
  List<CategorySpend> get byCategory;
  @override
  List<MonthlySpend> get byMonth;
  @override
  List<PhaseSpend> get byPhase;
  @override
  List<VendorSpend> get byVendor;
  @override
  List<PaymentMethodSpend> get byPaymentMethod;

  /// Create a copy of ProjectAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectAnalyticsImplCopyWith<_$ProjectAnalyticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategorySpend _$CategorySpendFromJson(Map<String, dynamic> json) {
  return _CategorySpend.fromJson(json);
}

/// @nodoc
mixin _$CategorySpend {
  String get id => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;
  String? get colorHex => throw _privateConstructorUsedError;

  /// Serializes this CategorySpend to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategorySpend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategorySpendCopyWith<CategorySpend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorySpendCopyWith<$Res> {
  factory $CategorySpendCopyWith(
          CategorySpend value, $Res Function(CategorySpend) then) =
      _$CategorySpendCopyWithImpl<$Res, CategorySpend>;
  @useResult
  $Res call(
      {String id,
      String nameEn,
      String icon,
      double amount,
      double percentage,
      String? colorHex});
}

/// @nodoc
class _$CategorySpendCopyWithImpl<$Res, $Val extends CategorySpend>
    implements $CategorySpendCopyWith<$Res> {
  _$CategorySpendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategorySpend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameEn = null,
    Object? icon = null,
    Object? amount = null,
    Object? percentage = null,
    Object? colorHex = freezed,
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
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      colorHex: freezed == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategorySpendImplCopyWith<$Res>
    implements $CategorySpendCopyWith<$Res> {
  factory _$$CategorySpendImplCopyWith(
          _$CategorySpendImpl value, $Res Function(_$CategorySpendImpl) then) =
      __$$CategorySpendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nameEn,
      String icon,
      double amount,
      double percentage,
      String? colorHex});
}

/// @nodoc
class __$$CategorySpendImplCopyWithImpl<$Res>
    extends _$CategorySpendCopyWithImpl<$Res, _$CategorySpendImpl>
    implements _$$CategorySpendImplCopyWith<$Res> {
  __$$CategorySpendImplCopyWithImpl(
      _$CategorySpendImpl _value, $Res Function(_$CategorySpendImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategorySpend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameEn = null,
    Object? icon = null,
    Object? amount = null,
    Object? percentage = null,
    Object? colorHex = freezed,
  }) {
    return _then(_$CategorySpendImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      colorHex: freezed == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategorySpendImpl implements _CategorySpend {
  const _$CategorySpendImpl(
      {required this.id,
      required this.nameEn,
      required this.icon,
      required this.amount,
      required this.percentage,
      this.colorHex});

  factory _$CategorySpendImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategorySpendImplFromJson(json);

  @override
  final String id;
  @override
  final String nameEn;
  @override
  final String icon;
  @override
  final double amount;
  @override
  final double percentage;
  @override
  final String? colorHex;

  @override
  String toString() {
    return 'CategorySpend(id: $id, nameEn: $nameEn, icon: $icon, amount: $amount, percentage: $percentage, colorHex: $colorHex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorySpendImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.colorHex, colorHex) ||
                other.colorHex == colorHex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nameEn, icon, amount, percentage, colorHex);

  /// Create a copy of CategorySpend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorySpendImplCopyWith<_$CategorySpendImpl> get copyWith =>
      __$$CategorySpendImplCopyWithImpl<_$CategorySpendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategorySpendImplToJson(
      this,
    );
  }
}

abstract class _CategorySpend implements CategorySpend {
  const factory _CategorySpend(
      {required final String id,
      required final String nameEn,
      required final String icon,
      required final double amount,
      required final double percentage,
      final String? colorHex}) = _$CategorySpendImpl;

  factory _CategorySpend.fromJson(Map<String, dynamic> json) =
      _$CategorySpendImpl.fromJson;

  @override
  String get id;
  @override
  String get nameEn;
  @override
  String get icon;
  @override
  double get amount;
  @override
  double get percentage;
  @override
  String? get colorHex;

  /// Create a copy of CategorySpend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategorySpendImplCopyWith<_$CategorySpendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlySpend _$MonthlySpendFromJson(Map<String, dynamic> json) {
  return _MonthlySpend.fromJson(json);
}

/// @nodoc
mixin _$MonthlySpend {
  String get month => throw _privateConstructorUsedError; // "2025-01"
  String get label => throw _privateConstructorUsedError; // "Jan"
  double get amount => throw _privateConstructorUsedError;
  double get budget => throw _privateConstructorUsedError;

  /// Serializes this MonthlySpend to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlySpend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlySpendCopyWith<MonthlySpend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlySpendCopyWith<$Res> {
  factory $MonthlySpendCopyWith(
          MonthlySpend value, $Res Function(MonthlySpend) then) =
      _$MonthlySpendCopyWithImpl<$Res, MonthlySpend>;
  @useResult
  $Res call({String month, String label, double amount, double budget});
}

/// @nodoc
class _$MonthlySpendCopyWithImpl<$Res, $Val extends MonthlySpend>
    implements $MonthlySpendCopyWith<$Res> {
  _$MonthlySpendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlySpend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? label = null,
    Object? amount = null,
    Object? budget = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlySpendImplCopyWith<$Res>
    implements $MonthlySpendCopyWith<$Res> {
  factory _$$MonthlySpendImplCopyWith(
          _$MonthlySpendImpl value, $Res Function(_$MonthlySpendImpl) then) =
      __$$MonthlySpendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String month, String label, double amount, double budget});
}

/// @nodoc
class __$$MonthlySpendImplCopyWithImpl<$Res>
    extends _$MonthlySpendCopyWithImpl<$Res, _$MonthlySpendImpl>
    implements _$$MonthlySpendImplCopyWith<$Res> {
  __$$MonthlySpendImplCopyWithImpl(
      _$MonthlySpendImpl _value, $Res Function(_$MonthlySpendImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlySpend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? label = null,
    Object? amount = null,
    Object? budget = null,
  }) {
    return _then(_$MonthlySpendImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlySpendImpl implements _MonthlySpend {
  const _$MonthlySpendImpl(
      {required this.month,
      required this.label,
      required this.amount,
      required this.budget});

  factory _$MonthlySpendImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlySpendImplFromJson(json);

  @override
  final String month;
// "2025-01"
  @override
  final String label;
// "Jan"
  @override
  final double amount;
  @override
  final double budget;

  @override
  String toString() {
    return 'MonthlySpend(month: $month, label: $label, amount: $amount, budget: $budget)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlySpendImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.budget, budget) || other.budget == budget));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, month, label, amount, budget);

  /// Create a copy of MonthlySpend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlySpendImplCopyWith<_$MonthlySpendImpl> get copyWith =>
      __$$MonthlySpendImplCopyWithImpl<_$MonthlySpendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlySpendImplToJson(
      this,
    );
  }
}

abstract class _MonthlySpend implements MonthlySpend {
  const factory _MonthlySpend(
      {required final String month,
      required final String label,
      required final double amount,
      required final double budget}) = _$MonthlySpendImpl;

  factory _MonthlySpend.fromJson(Map<String, dynamic> json) =
      _$MonthlySpendImpl.fromJson;

  @override
  String get month; // "2025-01"
  @override
  String get label; // "Jan"
  @override
  double get amount;
  @override
  double get budget;

  /// Create a copy of MonthlySpend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlySpendImplCopyWith<_$MonthlySpendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PhaseSpend _$PhaseSpendFromJson(Map<String, dynamic> json) {
  return _PhaseSpend.fromJson(json);
}

/// @nodoc
mixin _$PhaseSpend {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get budgetAllocated => throw _privateConstructorUsedError;
  double get spent => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this PhaseSpend to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhaseSpend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhaseSpendCopyWith<PhaseSpend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhaseSpendCopyWith<$Res> {
  factory $PhaseSpendCopyWith(
          PhaseSpend value, $Res Function(PhaseSpend) then) =
      _$PhaseSpendCopyWithImpl<$Res, PhaseSpend>;
  @useResult
  $Res call(
      {String id,
      String name,
      double budgetAllocated,
      double spent,
      String status});
}

/// @nodoc
class _$PhaseSpendCopyWithImpl<$Res, $Val extends PhaseSpend>
    implements $PhaseSpendCopyWith<$Res> {
  _$PhaseSpendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhaseSpend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? budgetAllocated = null,
    Object? spent = null,
    Object? status = null,
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
      budgetAllocated: null == budgetAllocated
          ? _value.budgetAllocated
          : budgetAllocated // ignore: cast_nullable_to_non_nullable
              as double,
      spent: null == spent
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhaseSpendImplCopyWith<$Res>
    implements $PhaseSpendCopyWith<$Res> {
  factory _$$PhaseSpendImplCopyWith(
          _$PhaseSpendImpl value, $Res Function(_$PhaseSpendImpl) then) =
      __$$PhaseSpendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double budgetAllocated,
      double spent,
      String status});
}

/// @nodoc
class __$$PhaseSpendImplCopyWithImpl<$Res>
    extends _$PhaseSpendCopyWithImpl<$Res, _$PhaseSpendImpl>
    implements _$$PhaseSpendImplCopyWith<$Res> {
  __$$PhaseSpendImplCopyWithImpl(
      _$PhaseSpendImpl _value, $Res Function(_$PhaseSpendImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhaseSpend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? budgetAllocated = null,
    Object? spent = null,
    Object? status = null,
  }) {
    return _then(_$PhaseSpendImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      budgetAllocated: null == budgetAllocated
          ? _value.budgetAllocated
          : budgetAllocated // ignore: cast_nullable_to_non_nullable
              as double,
      spent: null == spent
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhaseSpendImpl implements _PhaseSpend {
  const _$PhaseSpendImpl(
      {required this.id,
      required this.name,
      required this.budgetAllocated,
      required this.spent,
      required this.status});

  factory _$PhaseSpendImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhaseSpendImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double budgetAllocated;
  @override
  final double spent;
  @override
  final String status;

  @override
  String toString() {
    return 'PhaseSpend(id: $id, name: $name, budgetAllocated: $budgetAllocated, spent: $spent, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhaseSpendImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.budgetAllocated, budgetAllocated) ||
                other.budgetAllocated == budgetAllocated) &&
            (identical(other.spent, spent) || other.spent == spent) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, budgetAllocated, spent, status);

  /// Create a copy of PhaseSpend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhaseSpendImplCopyWith<_$PhaseSpendImpl> get copyWith =>
      __$$PhaseSpendImplCopyWithImpl<_$PhaseSpendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhaseSpendImplToJson(
      this,
    );
  }
}

abstract class _PhaseSpend implements PhaseSpend {
  const factory _PhaseSpend(
      {required final String id,
      required final String name,
      required final double budgetAllocated,
      required final double spent,
      required final String status}) = _$PhaseSpendImpl;

  factory _PhaseSpend.fromJson(Map<String, dynamic> json) =
      _$PhaseSpendImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get budgetAllocated;
  @override
  double get spent;
  @override
  String get status;

  /// Create a copy of PhaseSpend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhaseSpendImplCopyWith<_$PhaseSpendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VendorSpend _$VendorSpendFromJson(Map<String, dynamic> json) {
  return _VendorSpend.fromJson(json);
}

/// @nodoc
mixin _$VendorSpend {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get totalPaid => throw _privateConstructorUsedError;
  int get transactionCount => throw _privateConstructorUsedError;

  /// Serializes this VendorSpend to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorSpend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorSpendCopyWith<VendorSpend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorSpendCopyWith<$Res> {
  factory $VendorSpendCopyWith(
          VendorSpend value, $Res Function(VendorSpend) then) =
      _$VendorSpendCopyWithImpl<$Res, VendorSpend>;
  @useResult
  $Res call({String id, String name, double totalPaid, int transactionCount});
}

/// @nodoc
class _$VendorSpendCopyWithImpl<$Res, $Val extends VendorSpend>
    implements $VendorSpendCopyWith<$Res> {
  _$VendorSpendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorSpend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? totalPaid = null,
    Object? transactionCount = null,
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
      totalPaid: null == totalPaid
          ? _value.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VendorSpendImplCopyWith<$Res>
    implements $VendorSpendCopyWith<$Res> {
  factory _$$VendorSpendImplCopyWith(
          _$VendorSpendImpl value, $Res Function(_$VendorSpendImpl) then) =
      __$$VendorSpendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, double totalPaid, int transactionCount});
}

/// @nodoc
class __$$VendorSpendImplCopyWithImpl<$Res>
    extends _$VendorSpendCopyWithImpl<$Res, _$VendorSpendImpl>
    implements _$$VendorSpendImplCopyWith<$Res> {
  __$$VendorSpendImplCopyWithImpl(
      _$VendorSpendImpl _value, $Res Function(_$VendorSpendImpl) _then)
      : super(_value, _then);

  /// Create a copy of VendorSpend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? totalPaid = null,
    Object? transactionCount = null,
  }) {
    return _then(_$VendorSpendImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalPaid: null == totalPaid
          ? _value.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorSpendImpl implements _VendorSpend {
  const _$VendorSpendImpl(
      {required this.id,
      required this.name,
      required this.totalPaid,
      required this.transactionCount});

  factory _$VendorSpendImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorSpendImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double totalPaid;
  @override
  final int transactionCount;

  @override
  String toString() {
    return 'VendorSpend(id: $id, name: $name, totalPaid: $totalPaid, transactionCount: $transactionCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorSpendImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.totalPaid, totalPaid) ||
                other.totalPaid == totalPaid) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, totalPaid, transactionCount);

  /// Create a copy of VendorSpend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorSpendImplCopyWith<_$VendorSpendImpl> get copyWith =>
      __$$VendorSpendImplCopyWithImpl<_$VendorSpendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorSpendImplToJson(
      this,
    );
  }
}

abstract class _VendorSpend implements VendorSpend {
  const factory _VendorSpend(
      {required final String id,
      required final String name,
      required final double totalPaid,
      required final int transactionCount}) = _$VendorSpendImpl;

  factory _VendorSpend.fromJson(Map<String, dynamic> json) =
      _$VendorSpendImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get totalPaid;
  @override
  int get transactionCount;

  /// Create a copy of VendorSpend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorSpendImplCopyWith<_$VendorSpendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentMethodSpend _$PaymentMethodSpendFromJson(Map<String, dynamic> json) {
  return _PaymentMethodSpend.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodSpend {
  String get method => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethodSpend to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethodSpend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodSpendCopyWith<PaymentMethodSpend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodSpendCopyWith<$Res> {
  factory $PaymentMethodSpendCopyWith(
          PaymentMethodSpend value, $Res Function(PaymentMethodSpend) then) =
      _$PaymentMethodSpendCopyWithImpl<$Res, PaymentMethodSpend>;
  @useResult
  $Res call({String method, double amount, double percentage});
}

/// @nodoc
class _$PaymentMethodSpendCopyWithImpl<$Res, $Val extends PaymentMethodSpend>
    implements $PaymentMethodSpendCopyWith<$Res> {
  _$PaymentMethodSpendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethodSpend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? amount = null,
    Object? percentage = null,
  }) {
    return _then(_value.copyWith(
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodSpendImplCopyWith<$Res>
    implements $PaymentMethodSpendCopyWith<$Res> {
  factory _$$PaymentMethodSpendImplCopyWith(_$PaymentMethodSpendImpl value,
          $Res Function(_$PaymentMethodSpendImpl) then) =
      __$$PaymentMethodSpendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String method, double amount, double percentage});
}

/// @nodoc
class __$$PaymentMethodSpendImplCopyWithImpl<$Res>
    extends _$PaymentMethodSpendCopyWithImpl<$Res, _$PaymentMethodSpendImpl>
    implements _$$PaymentMethodSpendImplCopyWith<$Res> {
  __$$PaymentMethodSpendImplCopyWithImpl(_$PaymentMethodSpendImpl _value,
      $Res Function(_$PaymentMethodSpendImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMethodSpend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? amount = null,
    Object? percentage = null,
  }) {
    return _then(_$PaymentMethodSpendImpl(
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodSpendImpl implements _PaymentMethodSpend {
  const _$PaymentMethodSpendImpl(
      {required this.method, required this.amount, required this.percentage});

  factory _$PaymentMethodSpendImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodSpendImplFromJson(json);

  @override
  final String method;
  @override
  final double amount;
  @override
  final double percentage;

  @override
  String toString() {
    return 'PaymentMethodSpend(method: $method, amount: $amount, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodSpendImpl &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, method, amount, percentage);

  /// Create a copy of PaymentMethodSpend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodSpendImplCopyWith<_$PaymentMethodSpendImpl> get copyWith =>
      __$$PaymentMethodSpendImplCopyWithImpl<_$PaymentMethodSpendImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodSpendImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethodSpend implements PaymentMethodSpend {
  const factory _PaymentMethodSpend(
      {required final String method,
      required final double amount,
      required final double percentage}) = _$PaymentMethodSpendImpl;

  factory _PaymentMethodSpend.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodSpendImpl.fromJson;

  @override
  String get method;
  @override
  double get amount;
  @override
  double get percentage;

  /// Create a copy of PaymentMethodSpend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodSpendImplCopyWith<_$PaymentMethodSpendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
