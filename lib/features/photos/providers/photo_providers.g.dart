// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$photosListHash() => r'2455f42e8a4c3c2224080afa6e88d1e1ee9b8a65';

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

/// See also [photosList].
@ProviderFor(photosList)
const photosListProvider = PhotosListFamily();

/// See also [photosList].
class PhotosListFamily extends Family<AsyncValue<List<SitePhoto>>> {
  /// See also [photosList].
  const PhotosListFamily();

  /// See also [photosList].
  PhotosListProvider call({
    String? projectId,
    String? category,
  }) {
    return PhotosListProvider(
      projectId: projectId,
      category: category,
    );
  }

  @override
  PhotosListProvider getProviderOverride(
    covariant PhotosListProvider provider,
  ) {
    return call(
      projectId: provider.projectId,
      category: provider.category,
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
  String? get name => r'photosListProvider';
}

/// See also [photosList].
class PhotosListProvider extends AutoDisposeFutureProvider<List<SitePhoto>> {
  /// See also [photosList].
  PhotosListProvider({
    String? projectId,
    String? category,
  }) : this._internal(
          (ref) => photosList(
            ref as PhotosListRef,
            projectId: projectId,
            category: category,
          ),
          from: photosListProvider,
          name: r'photosListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$photosListHash,
          dependencies: PhotosListFamily._dependencies,
          allTransitiveDependencies:
              PhotosListFamily._allTransitiveDependencies,
          projectId: projectId,
          category: category,
        );

  PhotosListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
    required this.category,
  }) : super.internal();

  final String? projectId;
  final String? category;

  @override
  Override overrideWith(
    FutureOr<List<SitePhoto>> Function(PhotosListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PhotosListProvider._internal(
        (ref) => create(ref as PhotosListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SitePhoto>> createElement() {
    return _PhotosListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PhotosListProvider &&
        other.projectId == projectId &&
        other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PhotosListRef on AutoDisposeFutureProviderRef<List<SitePhoto>> {
  /// The parameter `projectId` of this provider.
  String? get projectId;

  /// The parameter `category` of this provider.
  String? get category;
}

class _PhotosListProviderElement
    extends AutoDisposeFutureProviderElement<List<SitePhoto>>
    with PhotosListRef {
  _PhotosListProviderElement(super.provider);

  @override
  String? get projectId => (origin as PhotosListProvider).projectId;
  @override
  String? get category => (origin as PhotosListProvider).category;
}

String _$selectedPhotoHash() => r'd57070ebb718bb5f10d4b58d97bae69d55b166d8';

/// See also [SelectedPhoto].
@ProviderFor(SelectedPhoto)
final selectedPhotoProvider =
    AutoDisposeNotifierProvider<SelectedPhoto, SitePhoto?>.internal(
  SelectedPhoto.new,
  name: r'selectedPhotoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedPhotoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedPhoto = AutoDisposeNotifier<SitePhoto?>;
String _$photoViewModeNotifierHash() =>
    r'9c63dc8dbd6194af7a5b6f2731ba68d241544873';

/// See also [PhotoViewModeNotifier].
@ProviderFor(PhotoViewModeNotifier)
final photoViewModeNotifierProvider =
    AutoDisposeNotifierProvider<PhotoViewModeNotifier, PhotoViewMode>.internal(
  PhotoViewModeNotifier.new,
  name: r'photoViewModeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$photoViewModeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PhotoViewModeNotifier = AutoDisposeNotifier<PhotoViewMode>;
String _$photoUploadNotifierHash() =>
    r'a0c703d7eab595040da8eb55e365cbecce6e42bf';

/// See also [PhotoUploadNotifier].
@ProviderFor(PhotoUploadNotifier)
final photoUploadNotifierProvider =
    AutoDisposeNotifierProvider<PhotoUploadNotifier, PhotoUploadState>.internal(
  PhotoUploadNotifier.new,
  name: r'photoUploadNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$photoUploadNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PhotoUploadNotifier = AutoDisposeNotifier<PhotoUploadState>;
String _$photoFilterHash() => r'03f48db8d61fd9e388ef2596cc7f7f0fee73edd6';

/// See also [PhotoFilter].
@ProviderFor(PhotoFilter)
final photoFilterProvider =
    AutoDisposeNotifierProvider<PhotoFilter, String?>.internal(
  PhotoFilter.new,
  name: r'photoFilterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$photoFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PhotoFilter = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
