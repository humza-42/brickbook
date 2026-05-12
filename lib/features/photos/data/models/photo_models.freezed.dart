// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SitePhoto _$SitePhotoFromJson(Map<String, dynamic> json) {
  return _SitePhoto.fromJson(json);
}

/// @nodoc
mixin _$SitePhoto {
  String get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  String? get category =>
      throw _privateConstructorUsedError; // 'progress', 'safety', 'material', 'team', 'site'
  String? get projectId => throw _privateConstructorUsedError;
  String? get projectName => throw _privateConstructorUsedError;
  String? get uploadedBy => throw _privateConstructorUsedError;
  DateTime get takenAt => throw _privateConstructorUsedError;
  DateTime get uploadedAt => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get locationNotes => throw _privateConstructorUsedError;

  /// Serializes this SitePhoto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SitePhoto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SitePhotoCopyWith<SitePhoto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SitePhotoCopyWith<$Res> {
  factory $SitePhotoCopyWith(SitePhoto value, $Res Function(SitePhoto) then) =
      _$SitePhotoCopyWithImpl<$Res, SitePhoto>;
  @useResult
  $Res call(
      {String id,
      String url,
      String thumbnailUrl,
      String? caption,
      String? category,
      String? projectId,
      String? projectName,
      String? uploadedBy,
      DateTime takenAt,
      DateTime uploadedAt,
      double? latitude,
      double? longitude,
      String? locationNotes});
}

/// @nodoc
class _$SitePhotoCopyWithImpl<$Res, $Val extends SitePhoto>
    implements $SitePhotoCopyWith<$Res> {
  _$SitePhotoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SitePhoto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? thumbnailUrl = null,
    Object? caption = freezed,
    Object? category = freezed,
    Object? projectId = freezed,
    Object? projectName = freezed,
    Object? uploadedBy = freezed,
    Object? takenAt = null,
    Object? uploadedAt = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? locationNotes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedBy: freezed == uploadedBy
          ? _value.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      takenAt: null == takenAt
          ? _value.takenAt
          : takenAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      locationNotes: freezed == locationNotes
          ? _value.locationNotes
          : locationNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SitePhotoImplCopyWith<$Res>
    implements $SitePhotoCopyWith<$Res> {
  factory _$$SitePhotoImplCopyWith(
          _$SitePhotoImpl value, $Res Function(_$SitePhotoImpl) then) =
      __$$SitePhotoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String url,
      String thumbnailUrl,
      String? caption,
      String? category,
      String? projectId,
      String? projectName,
      String? uploadedBy,
      DateTime takenAt,
      DateTime uploadedAt,
      double? latitude,
      double? longitude,
      String? locationNotes});
}

/// @nodoc
class __$$SitePhotoImplCopyWithImpl<$Res>
    extends _$SitePhotoCopyWithImpl<$Res, _$SitePhotoImpl>
    implements _$$SitePhotoImplCopyWith<$Res> {
  __$$SitePhotoImplCopyWithImpl(
      _$SitePhotoImpl _value, $Res Function(_$SitePhotoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SitePhoto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? thumbnailUrl = null,
    Object? caption = freezed,
    Object? category = freezed,
    Object? projectId = freezed,
    Object? projectName = freezed,
    Object? uploadedBy = freezed,
    Object? takenAt = null,
    Object? uploadedAt = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? locationNotes = freezed,
  }) {
    return _then(_$SitePhotoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedBy: freezed == uploadedBy
          ? _value.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      takenAt: null == takenAt
          ? _value.takenAt
          : takenAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      locationNotes: freezed == locationNotes
          ? _value.locationNotes
          : locationNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SitePhotoImpl implements _SitePhoto {
  const _$SitePhotoImpl(
      {required this.id,
      required this.url,
      required this.thumbnailUrl,
      this.caption,
      this.category,
      this.projectId,
      this.projectName,
      this.uploadedBy,
      required this.takenAt,
      required this.uploadedAt,
      this.latitude,
      this.longitude,
      this.locationNotes});

  factory _$SitePhotoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SitePhotoImplFromJson(json);

  @override
  final String id;
  @override
  final String url;
  @override
  final String thumbnailUrl;
  @override
  final String? caption;
  @override
  final String? category;
// 'progress', 'safety', 'material', 'team', 'site'
  @override
  final String? projectId;
  @override
  final String? projectName;
  @override
  final String? uploadedBy;
  @override
  final DateTime takenAt;
  @override
  final DateTime uploadedAt;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? locationNotes;

  @override
  String toString() {
    return 'SitePhoto(id: $id, url: $url, thumbnailUrl: $thumbnailUrl, caption: $caption, category: $category, projectId: $projectId, projectName: $projectName, uploadedBy: $uploadedBy, takenAt: $takenAt, uploadedAt: $uploadedAt, latitude: $latitude, longitude: $longitude, locationNotes: $locationNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SitePhotoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.uploadedBy, uploadedBy) ||
                other.uploadedBy == uploadedBy) &&
            (identical(other.takenAt, takenAt) || other.takenAt == takenAt) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locationNotes, locationNotes) ||
                other.locationNotes == locationNotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      url,
      thumbnailUrl,
      caption,
      category,
      projectId,
      projectName,
      uploadedBy,
      takenAt,
      uploadedAt,
      latitude,
      longitude,
      locationNotes);

  /// Create a copy of SitePhoto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SitePhotoImplCopyWith<_$SitePhotoImpl> get copyWith =>
      __$$SitePhotoImplCopyWithImpl<_$SitePhotoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SitePhotoImplToJson(
      this,
    );
  }
}

abstract class _SitePhoto implements SitePhoto {
  const factory _SitePhoto(
      {required final String id,
      required final String url,
      required final String thumbnailUrl,
      final String? caption,
      final String? category,
      final String? projectId,
      final String? projectName,
      final String? uploadedBy,
      required final DateTime takenAt,
      required final DateTime uploadedAt,
      final double? latitude,
      final double? longitude,
      final String? locationNotes}) = _$SitePhotoImpl;

  factory _SitePhoto.fromJson(Map<String, dynamic> json) =
      _$SitePhotoImpl.fromJson;

  @override
  String get id;
  @override
  String get url;
  @override
  String get thumbnailUrl;
  @override
  String? get caption;
  @override
  String? get category; // 'progress', 'safety', 'material', 'team', 'site'
  @override
  String? get projectId;
  @override
  String? get projectName;
  @override
  String? get uploadedBy;
  @override
  DateTime get takenAt;
  @override
  DateTime get uploadedAt;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String? get locationNotes;

  /// Create a copy of SitePhoto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SitePhotoImplCopyWith<_$SitePhotoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PhotoUploadState {
  bool get isUploading => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  SitePhoto? get uploadedPhoto => throw _privateConstructorUsedError;

  /// Create a copy of PhotoUploadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotoUploadStateCopyWith<PhotoUploadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoUploadStateCopyWith<$Res> {
  factory $PhotoUploadStateCopyWith(
          PhotoUploadState value, $Res Function(PhotoUploadState) then) =
      _$PhotoUploadStateCopyWithImpl<$Res, PhotoUploadState>;
  @useResult
  $Res call(
      {bool isUploading,
      int progress,
      String? error,
      SitePhoto? uploadedPhoto});

  $SitePhotoCopyWith<$Res>? get uploadedPhoto;
}

/// @nodoc
class _$PhotoUploadStateCopyWithImpl<$Res, $Val extends PhotoUploadState>
    implements $PhotoUploadStateCopyWith<$Res> {
  _$PhotoUploadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoUploadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUploading = null,
    Object? progress = null,
    Object? error = freezed,
    Object? uploadedPhoto = freezed,
  }) {
    return _then(_value.copyWith(
      isUploading: null == isUploading
          ? _value.isUploading
          : isUploading // ignore: cast_nullable_to_non_nullable
              as bool,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedPhoto: freezed == uploadedPhoto
          ? _value.uploadedPhoto
          : uploadedPhoto // ignore: cast_nullable_to_non_nullable
              as SitePhoto?,
    ) as $Val);
  }

  /// Create a copy of PhotoUploadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SitePhotoCopyWith<$Res>? get uploadedPhoto {
    if (_value.uploadedPhoto == null) {
      return null;
    }

    return $SitePhotoCopyWith<$Res>(_value.uploadedPhoto!, (value) {
      return _then(_value.copyWith(uploadedPhoto: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PhotoUploadStateImplCopyWith<$Res>
    implements $PhotoUploadStateCopyWith<$Res> {
  factory _$$PhotoUploadStateImplCopyWith(_$PhotoUploadStateImpl value,
          $Res Function(_$PhotoUploadStateImpl) then) =
      __$$PhotoUploadStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isUploading,
      int progress,
      String? error,
      SitePhoto? uploadedPhoto});

  @override
  $SitePhotoCopyWith<$Res>? get uploadedPhoto;
}

/// @nodoc
class __$$PhotoUploadStateImplCopyWithImpl<$Res>
    extends _$PhotoUploadStateCopyWithImpl<$Res, _$PhotoUploadStateImpl>
    implements _$$PhotoUploadStateImplCopyWith<$Res> {
  __$$PhotoUploadStateImplCopyWithImpl(_$PhotoUploadStateImpl _value,
      $Res Function(_$PhotoUploadStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoUploadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUploading = null,
    Object? progress = null,
    Object? error = freezed,
    Object? uploadedPhoto = freezed,
  }) {
    return _then(_$PhotoUploadStateImpl(
      isUploading: null == isUploading
          ? _value.isUploading
          : isUploading // ignore: cast_nullable_to_non_nullable
              as bool,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedPhoto: freezed == uploadedPhoto
          ? _value.uploadedPhoto
          : uploadedPhoto // ignore: cast_nullable_to_non_nullable
              as SitePhoto?,
    ));
  }
}

/// @nodoc

class _$PhotoUploadStateImpl implements _PhotoUploadState {
  const _$PhotoUploadStateImpl(
      {this.isUploading = false,
      this.progress = 0,
      this.error,
      this.uploadedPhoto});

  @override
  @JsonKey()
  final bool isUploading;
  @override
  @JsonKey()
  final int progress;
  @override
  final String? error;
  @override
  final SitePhoto? uploadedPhoto;

  @override
  String toString() {
    return 'PhotoUploadState(isUploading: $isUploading, progress: $progress, error: $error, uploadedPhoto: $uploadedPhoto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoUploadStateImpl &&
            (identical(other.isUploading, isUploading) ||
                other.isUploading == isUploading) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.uploadedPhoto, uploadedPhoto) ||
                other.uploadedPhoto == uploadedPhoto));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isUploading, progress, error, uploadedPhoto);

  /// Create a copy of PhotoUploadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoUploadStateImplCopyWith<_$PhotoUploadStateImpl> get copyWith =>
      __$$PhotoUploadStateImplCopyWithImpl<_$PhotoUploadStateImpl>(
          this, _$identity);
}

abstract class _PhotoUploadState implements PhotoUploadState {
  const factory _PhotoUploadState(
      {final bool isUploading,
      final int progress,
      final String? error,
      final SitePhoto? uploadedPhoto}) = _$PhotoUploadStateImpl;

  @override
  bool get isUploading;
  @override
  int get progress;
  @override
  String? get error;
  @override
  SitePhoto? get uploadedPhoto;

  /// Create a copy of PhotoUploadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotoUploadStateImplCopyWith<_$PhotoUploadStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PhotoViewMode {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() grid,
    required TResult Function() timeline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? grid,
    TResult? Function()? timeline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? grid,
    TResult Function()? timeline,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhotoViewModeGrid value) grid,
    required TResult Function(PhotoViewModeTimeline value) timeline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PhotoViewModeGrid value)? grid,
    TResult? Function(PhotoViewModeTimeline value)? timeline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhotoViewModeGrid value)? grid,
    TResult Function(PhotoViewModeTimeline value)? timeline,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoViewModeCopyWith<$Res> {
  factory $PhotoViewModeCopyWith(
          PhotoViewMode value, $Res Function(PhotoViewMode) then) =
      _$PhotoViewModeCopyWithImpl<$Res, PhotoViewMode>;
}

/// @nodoc
class _$PhotoViewModeCopyWithImpl<$Res, $Val extends PhotoViewMode>
    implements $PhotoViewModeCopyWith<$Res> {
  _$PhotoViewModeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoViewMode
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PhotoViewModeGridImplCopyWith<$Res> {
  factory _$$PhotoViewModeGridImplCopyWith(_$PhotoViewModeGridImpl value,
          $Res Function(_$PhotoViewModeGridImpl) then) =
      __$$PhotoViewModeGridImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PhotoViewModeGridImplCopyWithImpl<$Res>
    extends _$PhotoViewModeCopyWithImpl<$Res, _$PhotoViewModeGridImpl>
    implements _$$PhotoViewModeGridImplCopyWith<$Res> {
  __$$PhotoViewModeGridImplCopyWithImpl(_$PhotoViewModeGridImpl _value,
      $Res Function(_$PhotoViewModeGridImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoViewMode
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PhotoViewModeGridImpl implements PhotoViewModeGrid {
  const _$PhotoViewModeGridImpl();

  @override
  String toString() {
    return 'PhotoViewMode.grid()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PhotoViewModeGridImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() grid,
    required TResult Function() timeline,
  }) {
    return grid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? grid,
    TResult? Function()? timeline,
  }) {
    return grid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? grid,
    TResult Function()? timeline,
    required TResult orElse(),
  }) {
    if (grid != null) {
      return grid();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhotoViewModeGrid value) grid,
    required TResult Function(PhotoViewModeTimeline value) timeline,
  }) {
    return grid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PhotoViewModeGrid value)? grid,
    TResult? Function(PhotoViewModeTimeline value)? timeline,
  }) {
    return grid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhotoViewModeGrid value)? grid,
    TResult Function(PhotoViewModeTimeline value)? timeline,
    required TResult orElse(),
  }) {
    if (grid != null) {
      return grid(this);
    }
    return orElse();
  }
}

abstract class PhotoViewModeGrid implements PhotoViewMode {
  const factory PhotoViewModeGrid() = _$PhotoViewModeGridImpl;
}

/// @nodoc
abstract class _$$PhotoViewModeTimelineImplCopyWith<$Res> {
  factory _$$PhotoViewModeTimelineImplCopyWith(
          _$PhotoViewModeTimelineImpl value,
          $Res Function(_$PhotoViewModeTimelineImpl) then) =
      __$$PhotoViewModeTimelineImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PhotoViewModeTimelineImplCopyWithImpl<$Res>
    extends _$PhotoViewModeCopyWithImpl<$Res, _$PhotoViewModeTimelineImpl>
    implements _$$PhotoViewModeTimelineImplCopyWith<$Res> {
  __$$PhotoViewModeTimelineImplCopyWithImpl(_$PhotoViewModeTimelineImpl _value,
      $Res Function(_$PhotoViewModeTimelineImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoViewMode
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PhotoViewModeTimelineImpl implements PhotoViewModeTimeline {
  const _$PhotoViewModeTimelineImpl();

  @override
  String toString() {
    return 'PhotoViewMode.timeline()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoViewModeTimelineImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() grid,
    required TResult Function() timeline,
  }) {
    return timeline();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? grid,
    TResult? Function()? timeline,
  }) {
    return timeline?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? grid,
    TResult Function()? timeline,
    required TResult orElse(),
  }) {
    if (timeline != null) {
      return timeline();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhotoViewModeGrid value) grid,
    required TResult Function(PhotoViewModeTimeline value) timeline,
  }) {
    return timeline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PhotoViewModeGrid value)? grid,
    TResult? Function(PhotoViewModeTimeline value)? timeline,
  }) {
    return timeline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhotoViewModeGrid value)? grid,
    TResult Function(PhotoViewModeTimeline value)? timeline,
    required TResult orElse(),
  }) {
    if (timeline != null) {
      return timeline(this);
    }
    return orElse();
  }
}

abstract class PhotoViewModeTimeline implements PhotoViewMode {
  const factory PhotoViewModeTimeline() = _$PhotoViewModeTimelineImpl;
}
