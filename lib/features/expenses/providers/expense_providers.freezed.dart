// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_providers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExpenseFormState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  ExpenseModel? get saved => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseFormStateCopyWith<ExpenseFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseFormStateCopyWith<$Res> {
  factory $ExpenseFormStateCopyWith(
          ExpenseFormState value, $Res Function(ExpenseFormState) then) =
      _$ExpenseFormStateCopyWithImpl<$Res, ExpenseFormState>;
  @useResult
  $Res call({bool isLoading, bool isSaved, String? error, ExpenseModel? saved});

  $ExpenseModelCopyWith<$Res>? get saved;
}

/// @nodoc
class _$ExpenseFormStateCopyWithImpl<$Res, $Val extends ExpenseFormState>
    implements $ExpenseFormStateCopyWith<$Res> {
  _$ExpenseFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaved = null,
    Object? error = freezed,
    Object? saved = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      saved: freezed == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as ExpenseModel?,
    ) as $Val);
  }

  /// Create a copy of ExpenseFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpenseModelCopyWith<$Res>? get saved {
    if (_value.saved == null) {
      return null;
    }

    return $ExpenseModelCopyWith<$Res>(_value.saved!, (value) {
      return _then(_value.copyWith(saved: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExpenseFormStateImplCopyWith<$Res>
    implements $ExpenseFormStateCopyWith<$Res> {
  factory _$$ExpenseFormStateImplCopyWith(_$ExpenseFormStateImpl value,
          $Res Function(_$ExpenseFormStateImpl) then) =
      __$$ExpenseFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isSaved, String? error, ExpenseModel? saved});

  @override
  $ExpenseModelCopyWith<$Res>? get saved;
}

/// @nodoc
class __$$ExpenseFormStateImplCopyWithImpl<$Res>
    extends _$ExpenseFormStateCopyWithImpl<$Res, _$ExpenseFormStateImpl>
    implements _$$ExpenseFormStateImplCopyWith<$Res> {
  __$$ExpenseFormStateImplCopyWithImpl(_$ExpenseFormStateImpl _value,
      $Res Function(_$ExpenseFormStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaved = null,
    Object? error = freezed,
    Object? saved = freezed,
  }) {
    return _then(_$ExpenseFormStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      saved: freezed == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as ExpenseModel?,
    ));
  }
}

/// @nodoc

class _$ExpenseFormStateImpl implements _ExpenseFormState {
  const _$ExpenseFormStateImpl(
      {this.isLoading = false, this.isSaved = false, this.error, this.saved});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSaved;
  @override
  final String? error;
  @override
  final ExpenseModel? saved;

  @override
  String toString() {
    return 'ExpenseFormState(isLoading: $isLoading, isSaved: $isSaved, error: $error, saved: $saved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseFormStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.saved, saved) || other.saved == saved));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isSaved, error, saved);

  /// Create a copy of ExpenseFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseFormStateImplCopyWith<_$ExpenseFormStateImpl> get copyWith =>
      __$$ExpenseFormStateImplCopyWithImpl<_$ExpenseFormStateImpl>(
          this, _$identity);
}

abstract class _ExpenseFormState implements ExpenseFormState {
  const factory _ExpenseFormState(
      {final bool isLoading,
      final bool isSaved,
      final String? error,
      final ExpenseModel? saved}) = _$ExpenseFormStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSaved;
  @override
  String? get error;
  @override
  ExpenseModel? get saved;

  /// Create a copy of ExpenseFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseFormStateImplCopyWith<_$ExpenseFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
