// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return _AppConfig.fromJson(json);
}

/// @nodoc
mixin _$AppConfig {
  bool get maintenanceMode => throw _privateConstructorUsedError;
  String get minimumAppVersion => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get announcements =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> get settings => throw _privateConstructorUsedError;

  /// Serializes this AppConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppConfigCopyWith<AppConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigCopyWith<$Res> {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) then) =
      _$AppConfigCopyWithImpl<$Res, AppConfig>;
  @useResult
  $Res call(
      {bool maintenanceMode,
      String minimumAppVersion,
      List<Map<String, dynamic>> announcements,
      Map<String, dynamic> settings});
}

/// @nodoc
class _$AppConfigCopyWithImpl<$Res, $Val extends AppConfig>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maintenanceMode = null,
    Object? minimumAppVersion = null,
    Object? announcements = null,
    Object? settings = null,
  }) {
    return _then(_value.copyWith(
      maintenanceMode: null == maintenanceMode
          ? _value.maintenanceMode
          : maintenanceMode // ignore: cast_nullable_to_non_nullable
              as bool,
      minimumAppVersion: null == minimumAppVersion
          ? _value.minimumAppVersion
          : minimumAppVersion // ignore: cast_nullable_to_non_nullable
              as String,
      announcements: null == announcements
          ? _value.announcements
          : announcements // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppConfigImplCopyWith<$Res>
    implements $AppConfigCopyWith<$Res> {
  factory _$$AppConfigImplCopyWith(
          _$AppConfigImpl value, $Res Function(_$AppConfigImpl) then) =
      __$$AppConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool maintenanceMode,
      String minimumAppVersion,
      List<Map<String, dynamic>> announcements,
      Map<String, dynamic> settings});
}

/// @nodoc
class __$$AppConfigImplCopyWithImpl<$Res>
    extends _$AppConfigCopyWithImpl<$Res, _$AppConfigImpl>
    implements _$$AppConfigImplCopyWith<$Res> {
  __$$AppConfigImplCopyWithImpl(
      _$AppConfigImpl _value, $Res Function(_$AppConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maintenanceMode = null,
    Object? minimumAppVersion = null,
    Object? announcements = null,
    Object? settings = null,
  }) {
    return _then(_$AppConfigImpl(
      maintenanceMode: null == maintenanceMode
          ? _value.maintenanceMode
          : maintenanceMode // ignore: cast_nullable_to_non_nullable
              as bool,
      minimumAppVersion: null == minimumAppVersion
          ? _value.minimumAppVersion
          : minimumAppVersion // ignore: cast_nullable_to_non_nullable
              as String,
      announcements: null == announcements
          ? _value._announcements
          : announcements // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      settings: null == settings
          ? _value._settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppConfigImpl implements _AppConfig {
  const _$AppConfigImpl(
      {this.maintenanceMode = true,
      this.minimumAppVersion = '1.0',
      final List<Map<String, dynamic>> announcements = const [],
      final Map<String, dynamic> settings = const {}})
      : _announcements = announcements,
        _settings = settings;

  factory _$AppConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppConfigImplFromJson(json);

  @override
  @JsonKey()
  final bool maintenanceMode;
  @override
  @JsonKey()
  final String minimumAppVersion;
  final List<Map<String, dynamic>> _announcements;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get announcements {
    if (_announcements is EqualUnmodifiableListView) return _announcements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_announcements);
  }

  final Map<String, dynamic> _settings;
  @override
  @JsonKey()
  Map<String, dynamic> get settings {
    if (_settings is EqualUnmodifiableMapView) return _settings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_settings);
  }

  @override
  String toString() {
    return 'AppConfig(maintenanceMode: $maintenanceMode, minimumAppVersion: $minimumAppVersion, announcements: $announcements, settings: $settings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigImpl &&
            (identical(other.maintenanceMode, maintenanceMode) ||
                other.maintenanceMode == maintenanceMode) &&
            (identical(other.minimumAppVersion, minimumAppVersion) ||
                other.minimumAppVersion == minimumAppVersion) &&
            const DeepCollectionEquality()
                .equals(other._announcements, _announcements) &&
            const DeepCollectionEquality().equals(other._settings, _settings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      maintenanceMode,
      minimumAppVersion,
      const DeepCollectionEquality().hash(_announcements),
      const DeepCollectionEquality().hash(_settings));

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      __$$AppConfigImplCopyWithImpl<_$AppConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigImplToJson(
      this,
    );
  }
}

abstract class _AppConfig implements AppConfig {
  const factory _AppConfig(
      {final bool maintenanceMode,
      final String minimumAppVersion,
      final List<Map<String, dynamic>> announcements,
      final Map<String, dynamic> settings}) = _$AppConfigImpl;

  factory _AppConfig.fromJson(Map<String, dynamic> json) =
      _$AppConfigImpl.fromJson;

  @override
  bool get maintenanceMode;
  @override
  String get minimumAppVersion;
  @override
  List<Map<String, dynamic>> get announcements;
  @override
  Map<String, dynamic> get settings;

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
