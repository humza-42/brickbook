// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sharing_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GuestLink _$GuestLinkFromJson(Map<String, dynamic> json) {
  return _GuestLink.fromJson(json);
}

/// @nodoc
mixin _$GuestLink {
  String get id => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get accessLevel =>
      throw _privateConstructorUsedError; // full | summary
  String get url => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String? get passwordHash => throw _privateConstructorUsedError;
  String? get expiresAt => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this GuestLink to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestLinkCopyWith<GuestLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestLinkCopyWith<$Res> {
  factory $GuestLinkCopyWith(GuestLink value, $Res Function(GuestLink) then) =
      _$GuestLinkCopyWithImpl<$Res, GuestLink>;
  @useResult
  $Res call(
      {String id,
      String projectId,
      String token,
      String accessLevel,
      String url,
      int viewCount,
      bool isActive,
      String? passwordHash,
      String? expiresAt,
      String? createdAt});
}

/// @nodoc
class _$GuestLinkCopyWithImpl<$Res, $Val extends GuestLink>
    implements $GuestLinkCopyWith<$Res> {
  _$GuestLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? token = null,
    Object? accessLevel = null,
    Object? url = null,
    Object? viewCount = null,
    Object? isActive = null,
    Object? passwordHash = freezed,
    Object? expiresAt = freezed,
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
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      accessLevel: null == accessLevel
          ? _value.accessLevel
          : accessLevel // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordHash: freezed == passwordHash
          ? _value.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuestLinkImplCopyWith<$Res>
    implements $GuestLinkCopyWith<$Res> {
  factory _$$GuestLinkImplCopyWith(
          _$GuestLinkImpl value, $Res Function(_$GuestLinkImpl) then) =
      __$$GuestLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String projectId,
      String token,
      String accessLevel,
      String url,
      int viewCount,
      bool isActive,
      String? passwordHash,
      String? expiresAt,
      String? createdAt});
}

/// @nodoc
class __$$GuestLinkImplCopyWithImpl<$Res>
    extends _$GuestLinkCopyWithImpl<$Res, _$GuestLinkImpl>
    implements _$$GuestLinkImplCopyWith<$Res> {
  __$$GuestLinkImplCopyWithImpl(
      _$GuestLinkImpl _value, $Res Function(_$GuestLinkImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? token = null,
    Object? accessLevel = null,
    Object? url = null,
    Object? viewCount = null,
    Object? isActive = null,
    Object? passwordHash = freezed,
    Object? expiresAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$GuestLinkImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      accessLevel: null == accessLevel
          ? _value.accessLevel
          : accessLevel // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordHash: freezed == passwordHash
          ? _value.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestLinkImpl implements _GuestLink {
  const _$GuestLinkImpl(
      {required this.id,
      required this.projectId,
      required this.token,
      required this.accessLevel,
      required this.url,
      this.viewCount = 0,
      this.isActive = true,
      this.passwordHash,
      this.expiresAt,
      this.createdAt});

  factory _$GuestLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestLinkImplFromJson(json);

  @override
  final String id;
  @override
  final String projectId;
  @override
  final String token;
  @override
  final String accessLevel;
// full | summary
  @override
  final String url;
  @override
  @JsonKey()
  final int viewCount;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final String? passwordHash;
  @override
  final String? expiresAt;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'GuestLink(id: $id, projectId: $projectId, token: $token, accessLevel: $accessLevel, url: $url, viewCount: $viewCount, isActive: $isActive, passwordHash: $passwordHash, expiresAt: $expiresAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestLinkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.accessLevel, accessLevel) ||
                other.accessLevel == accessLevel) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.passwordHash, passwordHash) ||
                other.passwordHash == passwordHash) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      projectId,
      token,
      accessLevel,
      url,
      viewCount,
      isActive,
      passwordHash,
      expiresAt,
      createdAt);

  /// Create a copy of GuestLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestLinkImplCopyWith<_$GuestLinkImpl> get copyWith =>
      __$$GuestLinkImplCopyWithImpl<_$GuestLinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestLinkImplToJson(
      this,
    );
  }
}

abstract class _GuestLink implements GuestLink {
  const factory _GuestLink(
      {required final String id,
      required final String projectId,
      required final String token,
      required final String accessLevel,
      required final String url,
      final int viewCount,
      final bool isActive,
      final String? passwordHash,
      final String? expiresAt,
      final String? createdAt}) = _$GuestLinkImpl;

  factory _GuestLink.fromJson(Map<String, dynamic> json) =
      _$GuestLinkImpl.fromJson;

  @override
  String get id;
  @override
  String get projectId;
  @override
  String get token;
  @override
  String get accessLevel; // full | summary
  @override
  String get url;
  @override
  int get viewCount;
  @override
  bool get isActive;
  @override
  String? get passwordHash;
  @override
  String? get expiresAt;
  @override
  String? get createdAt;

  /// Create a copy of GuestLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestLinkImplCopyWith<_$GuestLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateGuestLinkRequest _$CreateGuestLinkRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateGuestLinkRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateGuestLinkRequest {
  String get accessLevel => throw _privateConstructorUsedError;
  String? get expiresAt => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  /// Serializes this CreateGuestLinkRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateGuestLinkRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateGuestLinkRequestCopyWith<CreateGuestLinkRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateGuestLinkRequestCopyWith<$Res> {
  factory $CreateGuestLinkRequestCopyWith(CreateGuestLinkRequest value,
          $Res Function(CreateGuestLinkRequest) then) =
      _$CreateGuestLinkRequestCopyWithImpl<$Res, CreateGuestLinkRequest>;
  @useResult
  $Res call({String accessLevel, String? expiresAt, String? password});
}

/// @nodoc
class _$CreateGuestLinkRequestCopyWithImpl<$Res,
        $Val extends CreateGuestLinkRequest>
    implements $CreateGuestLinkRequestCopyWith<$Res> {
  _$CreateGuestLinkRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateGuestLinkRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessLevel = null,
    Object? expiresAt = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      accessLevel: null == accessLevel
          ? _value.accessLevel
          : accessLevel // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateGuestLinkRequestImplCopyWith<$Res>
    implements $CreateGuestLinkRequestCopyWith<$Res> {
  factory _$$CreateGuestLinkRequestImplCopyWith(
          _$CreateGuestLinkRequestImpl value,
          $Res Function(_$CreateGuestLinkRequestImpl) then) =
      __$$CreateGuestLinkRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessLevel, String? expiresAt, String? password});
}

/// @nodoc
class __$$CreateGuestLinkRequestImplCopyWithImpl<$Res>
    extends _$CreateGuestLinkRequestCopyWithImpl<$Res,
        _$CreateGuestLinkRequestImpl>
    implements _$$CreateGuestLinkRequestImplCopyWith<$Res> {
  __$$CreateGuestLinkRequestImplCopyWithImpl(
      _$CreateGuestLinkRequestImpl _value,
      $Res Function(_$CreateGuestLinkRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateGuestLinkRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessLevel = null,
    Object? expiresAt = freezed,
    Object? password = freezed,
  }) {
    return _then(_$CreateGuestLinkRequestImpl(
      accessLevel: null == accessLevel
          ? _value.accessLevel
          : accessLevel // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateGuestLinkRequestImpl implements _CreateGuestLinkRequest {
  const _$CreateGuestLinkRequestImpl(
      {this.accessLevel = 'full', this.expiresAt, this.password});

  factory _$CreateGuestLinkRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateGuestLinkRequestImplFromJson(json);

  @override
  @JsonKey()
  final String accessLevel;
  @override
  final String? expiresAt;
  @override
  final String? password;

  @override
  String toString() {
    return 'CreateGuestLinkRequest(accessLevel: $accessLevel, expiresAt: $expiresAt, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateGuestLinkRequestImpl &&
            (identical(other.accessLevel, accessLevel) ||
                other.accessLevel == accessLevel) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessLevel, expiresAt, password);

  /// Create a copy of CreateGuestLinkRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateGuestLinkRequestImplCopyWith<_$CreateGuestLinkRequestImpl>
      get copyWith => __$$CreateGuestLinkRequestImplCopyWithImpl<
          _$CreateGuestLinkRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateGuestLinkRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateGuestLinkRequest implements CreateGuestLinkRequest {
  const factory _CreateGuestLinkRequest(
      {final String accessLevel,
      final String? expiresAt,
      final String? password}) = _$CreateGuestLinkRequestImpl;

  factory _CreateGuestLinkRequest.fromJson(Map<String, dynamic> json) =
      _$CreateGuestLinkRequestImpl.fromJson;

  @override
  String get accessLevel;
  @override
  String? get expiresAt;
  @override
  String? get password;

  /// Create a copy of CreateGuestLinkRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateGuestLinkRequestImplCopyWith<_$CreateGuestLinkRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ShareLog _$ShareLogFromJson(Map<String, dynamic> json) {
  return _ShareLog.fromJson(json);
}

/// @nodoc
mixin _$ShareLog {
  String get id => throw _privateConstructorUsedError;
  String get shareType => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get recipient => throw _privateConstructorUsedError;

  /// Serializes this ShareLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShareLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShareLogCopyWith<ShareLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareLogCopyWith<$Res> {
  factory $ShareLogCopyWith(ShareLog value, $Res Function(ShareLog) then) =
      _$ShareLogCopyWithImpl<$Res, ShareLog>;
  @useResult
  $Res call({String id, String shareType, String createdAt, String? recipient});
}

/// @nodoc
class _$ShareLogCopyWithImpl<$Res, $Val extends ShareLog>
    implements $ShareLogCopyWith<$Res> {
  _$ShareLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShareLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shareType = null,
    Object? createdAt = null,
    Object? recipient = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shareType: null == shareType
          ? _value.shareType
          : shareType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: freezed == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShareLogImplCopyWith<$Res>
    implements $ShareLogCopyWith<$Res> {
  factory _$$ShareLogImplCopyWith(
          _$ShareLogImpl value, $Res Function(_$ShareLogImpl) then) =
      __$$ShareLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String shareType, String createdAt, String? recipient});
}

/// @nodoc
class __$$ShareLogImplCopyWithImpl<$Res>
    extends _$ShareLogCopyWithImpl<$Res, _$ShareLogImpl>
    implements _$$ShareLogImplCopyWith<$Res> {
  __$$ShareLogImplCopyWithImpl(
      _$ShareLogImpl _value, $Res Function(_$ShareLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShareLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shareType = null,
    Object? createdAt = null,
    Object? recipient = freezed,
  }) {
    return _then(_$ShareLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shareType: null == shareType
          ? _value.shareType
          : shareType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: freezed == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShareLogImpl implements _ShareLog {
  const _$ShareLogImpl(
      {required this.id,
      required this.shareType,
      required this.createdAt,
      this.recipient});

  factory _$ShareLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShareLogImplFromJson(json);

  @override
  final String id;
  @override
  final String shareType;
  @override
  final String createdAt;
  @override
  final String? recipient;

  @override
  String toString() {
    return 'ShareLog(id: $id, shareType: $shareType, createdAt: $createdAt, recipient: $recipient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShareLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shareType, shareType) ||
                other.shareType == shareType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, shareType, createdAt, recipient);

  /// Create a copy of ShareLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShareLogImplCopyWith<_$ShareLogImpl> get copyWith =>
      __$$ShareLogImplCopyWithImpl<_$ShareLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShareLogImplToJson(
      this,
    );
  }
}

abstract class _ShareLog implements ShareLog {
  const factory _ShareLog(
      {required final String id,
      required final String shareType,
      required final String createdAt,
      final String? recipient}) = _$ShareLogImpl;

  factory _ShareLog.fromJson(Map<String, dynamic> json) =
      _$ShareLogImpl.fromJson;

  @override
  String get id;
  @override
  String get shareType;
  @override
  String get createdAt;
  @override
  String? get recipient;

  /// Create a copy of ShareLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShareLogImplCopyWith<_$ShareLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
