// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationPrefs {
  bool get budgetAlerts =>
      throw _privateConstructorUsedError; // 70%, 85%, 100% alerts
  bool get expenseAdded =>
      throw _privateConstructorUsedError; // when team member adds expense
  bool get guestLinkViewed =>
      throw _privateConstructorUsedError; // when someone views guest link
  bool get dailySummary =>
      throw _privateConstructorUsedError; // daily spending summary
  bool get paymentReminders =>
      throw _privateConstructorUsedError; // upcoming payment due
  bool get announcements => throw _privateConstructorUsedError;

  /// Create a copy of NotificationPrefs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationPrefsCopyWith<NotificationPrefs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPrefsCopyWith<$Res> {
  factory $NotificationPrefsCopyWith(
          NotificationPrefs value, $Res Function(NotificationPrefs) then) =
      _$NotificationPrefsCopyWithImpl<$Res, NotificationPrefs>;
  @useResult
  $Res call(
      {bool budgetAlerts,
      bool expenseAdded,
      bool guestLinkViewed,
      bool dailySummary,
      bool paymentReminders,
      bool announcements});
}

/// @nodoc
class _$NotificationPrefsCopyWithImpl<$Res, $Val extends NotificationPrefs>
    implements $NotificationPrefsCopyWith<$Res> {
  _$NotificationPrefsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationPrefs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budgetAlerts = null,
    Object? expenseAdded = null,
    Object? guestLinkViewed = null,
    Object? dailySummary = null,
    Object? paymentReminders = null,
    Object? announcements = null,
  }) {
    return _then(_value.copyWith(
      budgetAlerts: null == budgetAlerts
          ? _value.budgetAlerts
          : budgetAlerts // ignore: cast_nullable_to_non_nullable
              as bool,
      expenseAdded: null == expenseAdded
          ? _value.expenseAdded
          : expenseAdded // ignore: cast_nullable_to_non_nullable
              as bool,
      guestLinkViewed: null == guestLinkViewed
          ? _value.guestLinkViewed
          : guestLinkViewed // ignore: cast_nullable_to_non_nullable
              as bool,
      dailySummary: null == dailySummary
          ? _value.dailySummary
          : dailySummary // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentReminders: null == paymentReminders
          ? _value.paymentReminders
          : paymentReminders // ignore: cast_nullable_to_non_nullable
              as bool,
      announcements: null == announcements
          ? _value.announcements
          : announcements // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationPrefsImplCopyWith<$Res>
    implements $NotificationPrefsCopyWith<$Res> {
  factory _$$NotificationPrefsImplCopyWith(_$NotificationPrefsImpl value,
          $Res Function(_$NotificationPrefsImpl) then) =
      __$$NotificationPrefsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool budgetAlerts,
      bool expenseAdded,
      bool guestLinkViewed,
      bool dailySummary,
      bool paymentReminders,
      bool announcements});
}

/// @nodoc
class __$$NotificationPrefsImplCopyWithImpl<$Res>
    extends _$NotificationPrefsCopyWithImpl<$Res, _$NotificationPrefsImpl>
    implements _$$NotificationPrefsImplCopyWith<$Res> {
  __$$NotificationPrefsImplCopyWithImpl(_$NotificationPrefsImpl _value,
      $Res Function(_$NotificationPrefsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationPrefs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budgetAlerts = null,
    Object? expenseAdded = null,
    Object? guestLinkViewed = null,
    Object? dailySummary = null,
    Object? paymentReminders = null,
    Object? announcements = null,
  }) {
    return _then(_$NotificationPrefsImpl(
      budgetAlerts: null == budgetAlerts
          ? _value.budgetAlerts
          : budgetAlerts // ignore: cast_nullable_to_non_nullable
              as bool,
      expenseAdded: null == expenseAdded
          ? _value.expenseAdded
          : expenseAdded // ignore: cast_nullable_to_non_nullable
              as bool,
      guestLinkViewed: null == guestLinkViewed
          ? _value.guestLinkViewed
          : guestLinkViewed // ignore: cast_nullable_to_non_nullable
              as bool,
      dailySummary: null == dailySummary
          ? _value.dailySummary
          : dailySummary // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentReminders: null == paymentReminders
          ? _value.paymentReminders
          : paymentReminders // ignore: cast_nullable_to_non_nullable
              as bool,
      announcements: null == announcements
          ? _value.announcements
          : announcements // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NotificationPrefsImpl implements _NotificationPrefs {
  const _$NotificationPrefsImpl(
      {this.budgetAlerts = true,
      this.expenseAdded = true,
      this.guestLinkViewed = true,
      this.dailySummary = false,
      this.paymentReminders = true,
      this.announcements = true});

  @override
  @JsonKey()
  final bool budgetAlerts;
// 70%, 85%, 100% alerts
  @override
  @JsonKey()
  final bool expenseAdded;
// when team member adds expense
  @override
  @JsonKey()
  final bool guestLinkViewed;
// when someone views guest link
  @override
  @JsonKey()
  final bool dailySummary;
// daily spending summary
  @override
  @JsonKey()
  final bool paymentReminders;
// upcoming payment due
  @override
  @JsonKey()
  final bool announcements;

  @override
  String toString() {
    return 'NotificationPrefs(budgetAlerts: $budgetAlerts, expenseAdded: $expenseAdded, guestLinkViewed: $guestLinkViewed, dailySummary: $dailySummary, paymentReminders: $paymentReminders, announcements: $announcements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationPrefsImpl &&
            (identical(other.budgetAlerts, budgetAlerts) ||
                other.budgetAlerts == budgetAlerts) &&
            (identical(other.expenseAdded, expenseAdded) ||
                other.expenseAdded == expenseAdded) &&
            (identical(other.guestLinkViewed, guestLinkViewed) ||
                other.guestLinkViewed == guestLinkViewed) &&
            (identical(other.dailySummary, dailySummary) ||
                other.dailySummary == dailySummary) &&
            (identical(other.paymentReminders, paymentReminders) ||
                other.paymentReminders == paymentReminders) &&
            (identical(other.announcements, announcements) ||
                other.announcements == announcements));
  }

  @override
  int get hashCode => Object.hash(runtimeType, budgetAlerts, expenseAdded,
      guestLinkViewed, dailySummary, paymentReminders, announcements);

  /// Create a copy of NotificationPrefs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationPrefsImplCopyWith<_$NotificationPrefsImpl> get copyWith =>
      __$$NotificationPrefsImplCopyWithImpl<_$NotificationPrefsImpl>(
          this, _$identity);
}

abstract class _NotificationPrefs implements NotificationPrefs {
  const factory _NotificationPrefs(
      {final bool budgetAlerts,
      final bool expenseAdded,
      final bool guestLinkViewed,
      final bool dailySummary,
      final bool paymentReminders,
      final bool announcements}) = _$NotificationPrefsImpl;

  @override
  bool get budgetAlerts; // 70%, 85%, 100% alerts
  @override
  bool get expenseAdded; // when team member adds expense
  @override
  bool get guestLinkViewed; // when someone views guest link
  @override
  bool get dailySummary; // daily spending summary
  @override
  bool get paymentReminders; // upcoming payment due
  @override
  bool get announcements;

  /// Create a copy of NotificationPrefs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationPrefsImplCopyWith<_$NotificationPrefsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
