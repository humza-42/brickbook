// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vendorsListHash() => r'400fc6e37c93e7e053a2dc230c6c51fb9e341a8d';

/// See also [vendorsList].
@ProviderFor(vendorsList)
final vendorsListProvider =
    AutoDisposeFutureProvider<List<VendorModel>>.internal(
  vendorsList,
  name: r'vendorsListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$vendorsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef VendorsListRef = AutoDisposeFutureProviderRef<List<VendorModel>>;
String _$vendorSummaryHash() => r'c5ff1b87b4c4912fc573d1aeb0742e94f9e0341f';

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

/// See also [vendorSummary].
@ProviderFor(vendorSummary)
const vendorSummaryProvider = VendorSummaryFamily();

/// See also [vendorSummary].
class VendorSummaryFamily extends Family<AsyncValue<VendorSummary>> {
  /// See also [vendorSummary].
  const VendorSummaryFamily();

  /// See also [vendorSummary].
  VendorSummaryProvider call(
    String id,
  ) {
    return VendorSummaryProvider(
      id,
    );
  }

  @override
  VendorSummaryProvider getProviderOverride(
    covariant VendorSummaryProvider provider,
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
  String? get name => r'vendorSummaryProvider';
}

/// See also [vendorSummary].
class VendorSummaryProvider extends AutoDisposeFutureProvider<VendorSummary> {
  /// See also [vendorSummary].
  VendorSummaryProvider(
    String id,
  ) : this._internal(
          (ref) => vendorSummary(
            ref as VendorSummaryRef,
            id,
          ),
          from: vendorSummaryProvider,
          name: r'vendorSummaryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vendorSummaryHash,
          dependencies: VendorSummaryFamily._dependencies,
          allTransitiveDependencies:
              VendorSummaryFamily._allTransitiveDependencies,
          id: id,
        );

  VendorSummaryProvider._internal(
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
    FutureOr<VendorSummary> Function(VendorSummaryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VendorSummaryProvider._internal(
        (ref) => create(ref as VendorSummaryRef),
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
  AutoDisposeFutureProviderElement<VendorSummary> createElement() {
    return _VendorSummaryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VendorSummaryProvider && other.id == id;
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
mixin VendorSummaryRef on AutoDisposeFutureProviderRef<VendorSummary> {
  /// The parameter `id` of this provider.
  String get id;
}

class _VendorSummaryProviderElement
    extends AutoDisposeFutureProviderElement<VendorSummary>
    with VendorSummaryRef {
  _VendorSummaryProviderElement(super.provider);

  @override
  String get id => (origin as VendorSummaryProvider).id;
}

String _$vendorSearchHash() => r'f3b45b67556799cae1961e55ff859be8c030b0dc';

/// See also [VendorSearch].
@ProviderFor(VendorSearch)
final vendorSearchProvider =
    AutoDisposeNotifierProvider<VendorSearch, String>.internal(
  VendorSearch.new,
  name: r'vendorSearchProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$vendorSearchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VendorSearch = AutoDisposeNotifier<String>;
String _$vendorFormNotifierHash() =>
    r'0a595a11ff25b3e6d25cede89890264aa2f25ea9';

/// See also [VendorFormNotifier].
@ProviderFor(VendorFormNotifier)
final vendorFormNotifierProvider =
    AutoDisposeNotifierProvider<VendorFormNotifier, VendorFormState>.internal(
  VendorFormNotifier.new,
  name: r'vendorFormNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vendorFormNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VendorFormNotifier = AutoDisposeNotifier<VendorFormState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
