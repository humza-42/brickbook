import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:image_picker/image_picker.dart';
import '../data/photo_repository.dart';
import '../data/models/photo_models.dart';

part 'photo_providers.g.dart';

@riverpod
Future<List<SitePhoto>> photosList(PhotosListRef ref,
    {String? projectId, String? category}) async {
  final repo = ref.watch(photoRepositoryProvider);
  return repo.getPhotos(projectId: projectId, category: category);
}

@riverpod
class SelectedPhoto extends _$SelectedPhoto {
  @override
  SitePhoto? build() => null;
  void set(SitePhoto? photo) => state = photo;
  void clear() => state = null;
}

@riverpod
class PhotoViewModeNotifier extends _$PhotoViewModeNotifier {
  @override
  PhotoViewMode build() => const PhotoViewMode.grid();
  void setGrid() => state = const PhotoViewMode.grid();
  void setTimeline() => state = const PhotoViewMode.timeline();
}

@riverpod
class PhotoUploadNotifier extends _$PhotoUploadNotifier {
  @override
  PhotoUploadState build() => const PhotoUploadState();

  Future<void> uploadPhoto({
    required XFile imageFile,
    String? caption,
    String? category,
    String? projectId,
    double? latitude,
    double? longitude,
    String? locationNotes,
  }) async {
    state = state.copyWith(isUploading: true, error: null, progress: 0);
    try {
      final repo = ref.read(photoRepositoryProvider);
      final photo = await repo.uploadPhoto(
        image: imageFile,
        caption: caption,
        category: category,
        projectId: projectId,
        latitude: latitude,
        longitude: longitude,
        locationNotes: locationNotes,
      );
      ref.invalidate(photosListProvider);
      state = state.copyWith(isUploading: false, uploadedPhoto: photo);
    } catch (e) {
      state = state.copyWith(
          isUploading: false, error: e.toString(), progress: 0);
    }
  }

  void reset() => state = const PhotoUploadState();
}

@riverpod
class PhotoFilter extends _$PhotoFilter {
  @override
  String? build() => null;
  void set(String? category) => state = category;
  void clear() => state = null;
}
