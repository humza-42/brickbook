// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectAnalyticsHash() => r'711644a54f66e2068344367553caa40e6f55ca45';

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

/// See also [projectAnalytics].
@ProviderFor(projectAnalytics)
const projectAnalyticsProvider = ProjectAnalyticsFamily();

/// See also [projectAnalytics].
class ProjectAnalyticsFamily extends Family<AsyncValue<ProjectAnalytics>> {
  /// See also [projectAnalytics].
  const ProjectAnalyticsFamily();

  /// See also [projectAnalytics].
  ProjectAnalyticsProvider call(
    String projectId,
  ) {
    return ProjectAnalyticsProvider(
      projectId,
    );
  }

  @override
  ProjectAnalyticsProvider getProviderOverride(
    covariant ProjectAnalyticsProvider provider,
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
  String? get name => r'projectAnalyticsProvider';
}

/// See also [projectAnalytics].
class ProjectAnalyticsProvider
    extends AutoDisposeFutureProvider<ProjectAnalytics> {
  /// See also [projectAnalytics].
  ProjectAnalyticsProvider(
    String projectId,
  ) : this._internal(
          (ref) => projectAnalytics(
            ref as ProjectAnalyticsRef,
            projectId,
          ),
          from: projectAnalyticsProvider,
          name: r'projectAnalyticsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectAnalyticsHash,
          dependencies: ProjectAnalyticsFamily._dependencies,
          allTransitiveDependencies:
              ProjectAnalyticsFamily._allTransitiveDependencies,
          projectId: projectId,
        );

  ProjectAnalyticsProvider._internal(
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
    FutureOr<ProjectAnalytics> Function(ProjectAnalyticsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectAnalyticsProvider._internal(
        (ref) => create(ref as ProjectAnalyticsRef),
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
  AutoDisposeFutureProviderElement<ProjectAnalytics> createElement() {
    return _ProjectAnalyticsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectAnalyticsProvider && other.projectId == projectId;
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
mixin ProjectAnalyticsRef on AutoDisposeFutureProviderRef<ProjectAnalytics> {
  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _ProjectAnalyticsProviderElement
    extends AutoDisposeFutureProviderElement<ProjectAnalytics>
    with ProjectAnalyticsRef {
  _ProjectAnalyticsProviderElement(super.provider);

  @override
  String get projectId => (origin as ProjectAnalyticsProvider).projectId;
}

String _$vendorSpendHash() => r'e4ce270a9bc97ff64ad650e436832f07aa87259a';

/// See also [vendorSpend].
@ProviderFor(vendorSpend)
const vendorSpendProvider = VendorSpendFamily();

/// See also [vendorSpend].
class VendorSpendFamily extends Family<AsyncValue<List<VendorSpend>>> {
  /// See also [vendorSpend].
  const VendorSpendFamily();

  /// See also [vendorSpend].
  VendorSpendProvider call(
    String projectId,
  ) {
    return VendorSpendProvider(
      projectId,
    );
  }

  @override
  VendorSpendProvider getProviderOverride(
    covariant VendorSpendProvider provider,
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
  String? get name => r'vendorSpendProvider';
}

/// See also [vendorSpend].
class VendorSpendProvider extends AutoDisposeFutureProvider<List<VendorSpend>> {
  /// See also [vendorSpend].
  VendorSpendProvider(
    String projectId,
  ) : this._internal(
          (ref) => vendorSpend(
            ref as VendorSpendRef,
            projectId,
          ),
          from: vendorSpendProvider,
          name: r'vendorSpendProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vendorSpendHash,
          dependencies: VendorSpendFamily._dependencies,
          allTransitiveDependencies:
              VendorSpendFamily._allTransitiveDependencies,
          projectId: projectId,
        );

  VendorSpendProvider._internal(
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
    FutureOr<List<VendorSpend>> Function(VendorSpendRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VendorSpendProvider._internal(
        (ref) => create(ref as VendorSpendRef),
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
  AutoDisposeFutureProviderElement<List<VendorSpend>> createElement() {
    return _VendorSpendProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VendorSpendProvider && other.projectId == projectId;
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
mixin VendorSpendRef on AutoDisposeFutureProviderRef<List<VendorSpend>> {
  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _VendorSpendProviderElement
    extends AutoDisposeFutureProviderElement<List<VendorSpend>>
    with VendorSpendRef {
  _VendorSpendProviderElement(super.provider);

  @override
  String get projectId => (origin as VendorSpendProvider).projectId;
}

String _$analyticsTabHash() => r'ba5bfd55a6c10bc5f9e9b72f6e704f0f9c4f487d';

/// See also [AnalyticsTab].
@ProviderFor(AnalyticsTab)
final analyticsTabProvider =
    AutoDisposeNotifierProvider<AnalyticsTab, int>.internal(
  AnalyticsTab.new,
  name: r'analyticsTabProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$analyticsTabHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AnalyticsTab = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
