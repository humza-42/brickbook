// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectsListHash() => r'8f8bbb3a772d3e30c9934ad21f507af6f04dc772';

/// See also [projectsList].
@ProviderFor(projectsList)
final projectsListProvider =
    AutoDisposeFutureProvider<List<ProjectModel>>.internal(
  projectsList,
  name: r'projectsListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$projectsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProjectsListRef = AutoDisposeFutureProviderRef<List<ProjectModel>>;
String _$projectDetailHash() => r'2a5ea4f3fe913efea55cf6b71ae072645d01c851';

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

/// See also [projectDetail].
@ProviderFor(projectDetail)
const projectDetailProvider = ProjectDetailFamily();

/// See also [projectDetail].
class ProjectDetailFamily extends Family<AsyncValue<ProjectModel>> {
  /// See also [projectDetail].
  const ProjectDetailFamily();

  /// See also [projectDetail].
  ProjectDetailProvider call(
    String id,
  ) {
    return ProjectDetailProvider(
      id,
    );
  }

  @override
  ProjectDetailProvider getProviderOverride(
    covariant ProjectDetailProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'projectDetailProvider';
}

/// See also [projectDetail].
class ProjectDetailProvider extends AutoDisposeFutureProvider<ProjectModel> {
  /// See also [projectDetail].
  ProjectDetailProvider(
    String id,
  ) : this._internal(
          (ref) => projectDetail(
            ref as ProjectDetailRef,
            id,
          ),
          from: projectDetailProvider,
          name: r'projectDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectDetailHash,
          dependencies: ProjectDetailFamily._dependencies,
          allTransitiveDependencies:
              ProjectDetailFamily._allTransitiveDependencies,
          id: id,
        );

  ProjectDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<ProjectModel> Function(ProjectDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectDetailProvider._internal(
        (ref) => create(ref as ProjectDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ProjectModel> createElement() {
    return _ProjectDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProjectDetailRef on AutoDisposeFutureProviderRef<ProjectModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ProjectDetailProviderElement
    extends AutoDisposeFutureProviderElement<ProjectModel>
    with ProjectDetailRef {
  _ProjectDetailProviderElement(super.provider);

  @override
  String get id => (origin as ProjectDetailProvider).id;
}

String _$dashboardSummaryHash() => r'929fd675f03a42efcb1f53a551315374ec8259c9';

/// See also [dashboardSummary].
@ProviderFor(dashboardSummary)
final dashboardSummaryProvider =
    AutoDisposeFutureProvider<DashboardSummary>.internal(
  dashboardSummary,
  name: r'dashboardSummaryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dashboardSummaryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DashboardSummaryRef = AutoDisposeFutureProviderRef<DashboardSummary>;
String _$createProjectNotifierHash() =>
    r'a91bb48832766d9b358f84567b07947b77be7c61';

/// See also [CreateProjectNotifier].
@ProviderFor(CreateProjectNotifier)
final createProjectNotifierProvider = AutoDisposeNotifierProvider<
    CreateProjectNotifier, CreateProjectState>.internal(
  CreateProjectNotifier.new,
  name: r'createProjectNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$createProjectNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CreateProjectNotifier = AutoDisposeNotifier<CreateProjectState>;
String _$projectFilterHash() => r'3f81e5cbed459d7e71ccf6a962450b6630169c83';

/// See also [ProjectFilter].
@ProviderFor(ProjectFilter)
final projectFilterProvider =
    AutoDisposeNotifierProvider<ProjectFilter, String>.internal(
  ProjectFilter.new,
  name: r'projectFilterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProjectFilter = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
