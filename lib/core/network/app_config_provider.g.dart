// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppConfigImpl _$$AppConfigImplFromJson(Map<String, dynamic> json) =>
    _$AppConfigImpl(
      maintenanceMode: json['maintenanceMode'] as bool? ?? true,
      minimumAppVersion: json['minimumAppVersion'] as String? ?? '1.0',
      announcements: (json['announcements'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      settings: json['settings'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$AppConfigImplToJson(_$AppConfigImpl instance) =>
    <String, dynamic>{
      'maintenanceMode': instance.maintenanceMode,
      'minimumAppVersion': instance.minimumAppVersion,
      'announcements': instance.announcements,
      'settings': instance.settings,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appConfigHash() => r'2a5b52997fa1e9e6b54f5e86b2ed18d4eca2934e';

/// See also [appConfig].
@ProviderFor(appConfig)
final appConfigProvider = AutoDisposeFutureProvider<AppConfig>.internal(
  appConfig,
  name: r'appConfigProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppConfigRef = AutoDisposeFutureProviderRef<AppConfig>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
