// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isConnectedHash() => r'8f3658384145985f0fd81805690128009bb2b524';

/// See also [isConnected].
@ProviderFor(isConnected)
final isConnectedProvider = AutoDisposeStreamProvider<bool>.internal(
  isConnected,
  name: r'isConnectedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isConnectedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsConnectedRef = AutoDisposeStreamProviderRef<bool>;
String _$connectivityNotifierHash() =>
    r'e42b64325b0938d77bd833587be71e2450b4f436';

/// See also [ConnectivityNotifier].
@ProviderFor(ConnectivityNotifier)
final connectivityNotifierProvider =
    AutoDisposeNotifierProvider<ConnectivityNotifier, bool>.internal(
  ConnectivityNotifier.new,
  name: r'connectivityNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectivityNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConnectivityNotifier = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
