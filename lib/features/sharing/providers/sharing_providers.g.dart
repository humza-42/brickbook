// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sharing_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$guestLinksHash() => r'89e833a3c18e394d22f24bbc2bb70015b386e569';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [guestLinks].
@ProviderFor(guestLinks)
const guestLinksProvider = GuestLinksFamily();

/// See also [guestLinks].
class GuestLinksFamily extends Family<AsyncValue<List<GuestLink>>> {
  /// See also [guestLinks].
  const GuestLinksFamily();

  /// See also [guestLinks].
  GuestLinksProvider call(
    String projectId,
  ) {
    return GuestLinksProvider(
      projectId,
    );
  }

  @override
  GuestLinksProvider getProviderOverride(
    covariant GuestLinksProvider provider,
  ) {
    return call(
      provider.projectId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'guestLinksProvider';
}

/// See also [guestLinks].
class GuestLinksProvider extends AutoDisposeFutureProvider<List<GuestLink>> {
  /// See also [guestLinks].
  GuestLinksProvider(
    String projectId,
  ) : this._internal(
          (ref) => guestLinks(
            ref as GuestLinksRef,
            projectId,
          ),
          from: guestLinksProvider,
          name: r'guestLinksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$guestLinksHash,
          dependencies: GuestLinksFamily._dependencies,
          allTransitiveDependencies:
              GuestLinksFamily._allTransitiveDependencies,
          projectId: projectId,
        );

  GuestLinksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
  }) : super.internal();

  final String projectId;

  @override
  Override overrideWith(
    FutureOr<List<GuestLink>> Function(GuestLinksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GuestLinksProvider._internal(
        (ref) => create(ref as GuestLinksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<GuestLink>> createElement() {
    return _GuestLinksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GuestLinksProvider && other.projectId == projectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GuestLinksRef on AutoDisposeFutureProviderRef<List<GuestLink>> {
  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _GuestLinksProviderElement
    extends AutoDisposeFutureProviderElement<List<GuestLink>>
    with GuestLinksRef {
  _GuestLinksProviderElement(super.provider);

  @override
  String get projectId => (origin as GuestLinksProvider).projectId;
}

String _$createLinkNotifierHash() =>
    r'ae1dc24f2c50ee9cd45b4da7c0155b39a3149b27';

/// See also [CreateLinkNotifier].
@ProviderFor(CreateLinkNotifier)
final createLinkNotifierProvider =
    AutoDisposeNotifierProvider<CreateLinkNotifier, CreateLinkState>.internal(
  CreateLinkNotifier.new,
  name: r'createLinkNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$createLinkNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CreateLinkNotifier = AutoDisposeNotifier<CreateLinkState>;
String _$exportNotifierHash() => r'dad6458f2887fd3928f251cb1610686eade9947a';

/// See also [ExportNotifier].
@ProviderFor(ExportNotifier)
final exportNotifierProvider =
    AutoDisposeNotifierProvider<ExportNotifier, ExportState>.internal(
  ExportNotifier.new,
  name: r'exportNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$exportNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ExportNotifier = AutoDisposeNotifier<ExportState>;
String _$emailReportNotifierHash() =>
    r'fdb0dd3b06c7bc4169cc90695f9baadd7d635d75';

/// See also [EmailReportNotifier].
@ProviderFor(EmailReportNotifier)
final emailReportNotifierProvider =
    AutoDisposeNotifierProvider<EmailReportNotifier, EmailReportState>.internal(
  EmailReportNotifier.new,
  name: r'emailReportNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$emailReportNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EmailReportNotifier = AutoDisposeNotifier<EmailReportState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
