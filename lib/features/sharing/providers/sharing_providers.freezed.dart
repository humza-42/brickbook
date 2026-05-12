// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sharing_providers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateLinkState {
  bool get isLoading => throw _privateConstructorUsedError;
  GuestLink? get created => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of CreateLinkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateLinkStateCopyWith<CreateLinkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateLinkStateCopyWith<$Res> {
  factory $CreateLinkStateCopyWith(
          CreateLinkState value, $Res Function(CreateLinkState) then) =
      _$CreateLinkStateCopyWithImpl<$Res, CreateLinkState>;
  @useResult
  $Res call({bool isLoading, GuestLink? created, String? error});

  $GuestLinkCopyWith<$Res>? get created;
}

/// @nodoc
class _$CreateLinkStateCopyWithImpl<$Res, $Val extends CreateLinkState>
    implements $CreateLinkStateCopyWith<$Res> {
  _$CreateLinkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateLinkState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? created = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as GuestLink?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of CreateLinkState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GuestLinkCopyWith<$Res>? get created {
    if (_value.created == null) {
      return null;
    }

    return $GuestLinkCopyWith<$Res>(_value.created!, (value) {
      return _then(_value.copyWith(created: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateLinkStateImplCopyWith<$Res>
    implements $CreateLinkStateCopyWith<$Res> {
  factory _$$CreateLinkStateImplCopyWith(_$CreateLinkStateImpl value,
          $Res Function(_$CreateLinkStateImpl) then) =
      __$$CreateLinkStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, GuestLink? created, String? error});

  @override
  $GuestLinkCopyWith<$Res>? get created;
}

/// @nodoc
class __$$CreateLinkStateImplCopyWithImpl<$Res>
    extends _$CreateLinkStateCopyWithImpl<$Res, _$CreateLinkStateImpl>
    implements _$$CreateLinkStateImplCopyWith<$Res> {
  __$$CreateLinkStateImplCopyWithImpl(
      _$CreateLinkStateImpl _value, $Res Function(_$CreateLinkStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateLinkState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? created = freezed,
    Object? error = freezed,
  }) {
    return _then(_$CreateLinkStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as GuestLink?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreateLinkStateImpl implements _CreateLinkState {
  const _$CreateLinkStateImpl(
      {this.isLoading = false, this.created, this.error});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final GuestLink? created;
  @override
  final String? error;

  @override
  String toString() {
    return 'CreateLinkState(isLoading: $isLoading, created: $created, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateLinkStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, created, error);

  /// Create a copy of CreateLinkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateLinkStateImplCopyWith<_$CreateLinkStateImpl> get copyWith =>
      __$$CreateLinkStateImplCopyWithImpl<_$CreateLinkStateImpl>(
          this, _$identity);
}

abstract class _CreateLinkState implements CreateLinkState {
  const factory _CreateLinkState(
      {final bool isLoading,
      final GuestLink? created,
      final String? error}) = _$CreateLinkStateImpl;

  @override
  bool get isLoading;
  @override
  GuestLink? get created;
  @override
  String? get error;

  /// Create a copy of CreateLinkState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateLinkStateImplCopyWith<_$CreateLinkStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExportState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  File? get file => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get exportType => throw _privateConstructorUsedError;

  /// Create a copy of ExportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExportStateCopyWith<ExportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExportStateCopyWith<$Res> {
  factory $ExportStateCopyWith(
          ExportState value, $Res Function(ExportState) then) =
      _$ExportStateCopyWithImpl<$Res, ExportState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isDone,
      File? file,
      String? error,
      String? exportType});
}

/// @nodoc
class _$ExportStateCopyWithImpl<$Res, $Val extends ExportState>
    implements $ExportStateCopyWith<$Res> {
  _$ExportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isDone = null,
    Object? file = freezed,
    Object? error = freezed,
    Object? exportType = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      exportType: freezed == exportType
          ? _value.exportType
          : exportType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExportStateImplCopyWith<$Res>
    implements $ExportStateCopyWith<$Res> {
  factory _$$ExportStateImplCopyWith(
          _$ExportStateImpl value, $Res Function(_$ExportStateImpl) then) =
      __$$ExportStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isDone,
      File? file,
      String? error,
      String? exportType});
}

/// @nodoc
class __$$ExportStateImplCopyWithImpl<$Res>
    extends _$ExportStateCopyWithImpl<$Res, _$ExportStateImpl>
    implements _$$ExportStateImplCopyWith<$Res> {
  __$$ExportStateImplCopyWithImpl(
      _$ExportStateImpl _value, $Res Function(_$ExportStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isDone = null,
    Object? file = freezed,
    Object? error = freezed,
    Object? exportType = freezed,
  }) {
    return _then(_$ExportStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      exportType: freezed == exportType
          ? _value.exportType
          : exportType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ExportStateImpl implements _ExportState {
  const _$ExportStateImpl(
      {this.isLoading = false,
      this.isDone = false,
      this.file,
      this.error,
      this.exportType});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isDone;
  @override
  final File? file;
  @override
  final String? error;
  @override
  final String? exportType;

  @override
  String toString() {
    return 'ExportState(isLoading: $isLoading, isDone: $isDone, file: $file, error: $error, exportType: $exportType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExportStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.exportType, exportType) ||
                other.exportType == exportType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isDone, file, error, exportType);

  /// Create a copy of ExportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExportStateImplCopyWith<_$ExportStateImpl> get copyWith =>
      __$$ExportStateImplCopyWithImpl<_$ExportStateImpl>(this, _$identity);
}

abstract class _ExportState implements ExportState {
  const factory _ExportState(
      {final bool isLoading,
      final bool isDone,
      final File? file,
      final String? error,
      final String? exportType}) = _$ExportStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isDone;
  @override
  File? get file;
  @override
  String? get error;
  @override
  String? get exportType;

  /// Create a copy of ExportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExportStateImplCopyWith<_$ExportStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EmailReportState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSent => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of EmailReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmailReportStateCopyWith<EmailReportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailReportStateCopyWith<$Res> {
  factory $EmailReportStateCopyWith(
          EmailReportState value, $Res Function(EmailReportState) then) =
      _$EmailReportStateCopyWithImpl<$Res, EmailReportState>;
  @useResult
  $Res call({bool isLoading, bool isSent, String? error});
}

/// @nodoc
class _$EmailReportStateCopyWithImpl<$Res, $Val extends EmailReportState>
    implements $EmailReportStateCopyWith<$Res> {
  _$EmailReportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmailReportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSent = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSent: null == isSent
          ? _value.isSent
          : isSent // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailReportStateImplCopyWith<$Res>
    implements $EmailReportStateCopyWith<$Res> {
  factory _$$EmailReportStateImplCopyWith(_$EmailReportStateImpl value,
          $Res Function(_$EmailReportStateImpl) then) =
      __$$EmailReportStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isSent, String? error});
}

/// @nodoc
class __$$EmailReportStateImplCopyWithImpl<$Res>
    extends _$EmailReportStateCopyWithImpl<$Res, _$EmailReportStateImpl>
    implements _$$EmailReportStateImplCopyWith<$Res> {
  __$$EmailReportStateImplCopyWithImpl(_$EmailReportStateImpl _value,
      $Res Function(_$EmailReportStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmailReportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSent = null,
    Object? error = freezed,
  }) {
    return _then(_$EmailReportStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSent: null == isSent
          ? _value.isSent
          : isSent // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EmailReportStateImpl implements _EmailReportState {
  const _$EmailReportStateImpl(
      {this.isLoading = false, this.isSent = false, this.error});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSent;
  @override
  final String? error;

  @override
  String toString() {
    return 'EmailReportState(isLoading: $isLoading, isSent: $isSent, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailReportStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSent, isSent) || other.isSent == isSent) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSent, error);

  /// Create a copy of EmailReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailReportStateImplCopyWith<_$EmailReportStateImpl> get copyWith =>
      __$$EmailReportStateImplCopyWithImpl<_$EmailReportStateImpl>(
          this, _$identity);
}

abstract class _EmailReportState implements EmailReportState {
  const factory _EmailReportState(
      {final bool isLoading,
      final bool isSent,
      final String? error}) = _$EmailReportStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSent;
  @override
  String? get error;

  /// Create a copy of EmailReportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailReportStateImplCopyWith<_$EmailReportStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
