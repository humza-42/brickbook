import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_models.freezed.dart';
part 'photo_models.g.dart';

@freezed
class SitePhoto with _$SitePhoto {
  const factory SitePhoto({
    required String id,
    required String url,
    required String thumbnailUrl,
    String? caption,
    String? category, // 'progress', 'safety', 'material', 'team', 'site'
    String? projectId,
    String? projectName,
    String? uploadedBy,
    required DateTime takenAt,
    required DateTime uploadedAt,
    double? latitude,
    double? longitude,
    String? locationNotes,
  }) = _SitePhoto;

  factory SitePhoto.fromJson(Map<String, dynamic> json) =>
      _$SitePhotoFromJson(json);
}

@freezed
class PhotoUploadState with _$PhotoUploadState {
  const factory PhotoUploadState({
    @Default(false) bool isUploading,
    @Default(0) int progress,
    String? error,
    SitePhoto? uploadedPhoto,
  }) = _PhotoUploadState;
}

@freezed
class PhotoViewMode with _$PhotoViewMode {
  const factory PhotoViewMode.grid() = PhotoViewModeGrid;
  const factory PhotoViewMode.timeline() = PhotoViewModeTimeline;
}
