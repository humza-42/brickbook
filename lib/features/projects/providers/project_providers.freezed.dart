// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_providers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateProjectState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  ProjectModel? get created => throw _privateConstructorUsedError;

  /// Create a copy of CreateProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateProjectStateCopyWith<CreateProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateProjectStateCopyWith<$Res> {
  factory $CreateProjectStateCopyWith(
          CreateProjectState value, $Res Function(CreateProjectState) then) =
      _$CreateProjectStateCopyWithImpl<$Res, CreateProjectState>;
  @useResult
  $Res call({bool isLoading, String? error, ProjectModel? created});

  $ProjectModelCopyWith<$Res>? get created;
}

/// @nodoc
class _$CreateProjectStateCopyWithImpl<$Res, $Val extends CreateProjectState>
    implements $CreateProjectStateCopyWith<$Res> {
  _$CreateProjectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateProjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? created = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as ProjectModel?,
    ) as $Val);
  }

  /// Create a copy of CreateProjectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectModelCopyWith<$Res>? get created {
    if (_value.created == null) {
      return null;
    }

    return $ProjectModelCopyWith<$Res>(_value.created!, (value) {
      return _then(_value.copyWith(created: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateProjectStateImplCopyWith<$Res>
    implements $CreateProjectStateCopyWith<$Res> {
  factory _$$CreateProjectStateImplCopyWith(_$CreateProjectStateImpl value,
          $Res Function(_$CreateProjectStateImpl) then) =
      __$$CreateProjectStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error, ProjectModel? created});

  @override
  $ProjectModelCopyWith<$Res>? get created;
}

/// @nodoc
class __$$CreateProjectStateImplCopyWithImpl<$Res>
    extends _$CreateProjectStateCopyWithImpl<$Res, _$CreateProjectStateImpl>
    implements _$$CreateProjectStateImplCopyWith<$Res> {
  __$$CreateProjectStateImplCopyWithImpl(_$CreateProjectStateImpl _value,
      $Res Function(_$CreateProjectStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateProjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? created = freezed,
  }) {
    return _then(_$CreateProjectStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as ProjectModel?,
    ));
  }
}

/// @nodoc

class _$CreateProjectStateImpl implements _CreateProjectState {
  const _$CreateProjectStateImpl(
      {this.isLoading = false, this.error, this.created});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  @override
  final ProjectModel? created;

  @override
  String toString() {
    return 'CreateProjectState(isLoading: $isLoading, error: $error, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateProjectStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.created, created) || other.created == created));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error, created);

  /// Create a copy of CreateProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateProjectStateImplCopyWith<_$CreateProjectStateImpl> get copyWith =>
      __$$CreateProjectStateImplCopyWithImpl<_$CreateProjectStateImpl>(
          this, _$identity);
}

abstract class _CreateProjectState implements CreateProjectState {
  const factory _CreateProjectState(
      {final bool isLoading,
      final String? error,
      final ProjectModel? created}) = _$CreateProjectStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  ProjectModel? get created;

  /// Create a copy of CreateProjectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateProjectStateImplCopyWith<_$CreateProjectStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
