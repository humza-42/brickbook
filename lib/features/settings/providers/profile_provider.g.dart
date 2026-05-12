// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentUserHash() => r'1b923c0e58d4b5b71414724f7af0df6573396ea4';

/// See also [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = AutoDisposeFutureProvider<UserModel>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserRef = AutoDisposeFutureProviderRef<UserModel>;
String _$profileEditNotifierHash() =>
    r'897ef64de0254aae0da7835e0cd63c0caf5562cf';

/// See also [ProfileEditNotifier].
@ProviderFor(ProfileEditNotifier)
final profileEditNotifierProvider =
    AutoDisposeNotifierProvider<ProfileEditNotifier, ProfileEditState>.internal(
  ProfileEditNotifier.new,
  name: r'profileEditNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profileEditNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProfileEditNotifier = AutoDisposeNotifier<ProfileEditState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
