import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import 'models/photo_models.dart';
import 'package:image_picker/image_picker.dart';

part 'photo_repository.g.dart';

@riverpod
PhotoRepository photoRepository(PhotoRepositoryRef ref) =>
    PhotoRepository(dio: ref.watch(apiClientProvider));

class PhotoRepository {
  final Dio _dio;
  final ImagePicker _picker = ImagePicker();

  PhotoRepository({required Dio dio}) : _dio = dio;

  Future<List<SitePhoto>> getPhotos({String? projectId, String? category}) async {
    final queryParameters = <String, dynamic>{};
    if (projectId != null) queryParameters['project_id'] = projectId;
    if (category != null) queryParameters['category'] = category;

    final r = await _dio.get(
      ApiEndpoints.photos,
      queryParameters: queryParameters.isNotEmpty ? queryParameters : null,
    );
    return (r.data['data'] as List)
        .map((e) => SitePhoto.fromJson(e))
        .toList();
  }

  Future<SitePhoto> getPhoto(String id) async {
    final r = await _dio.get('${ApiEndpoints.photos}/$id');
    return SitePhoto.fromJson(r.data['data']);
  }

  Future<SitePhoto> uploadPhoto({
    required XFile image,
    String? caption,
    String? category,
    String? projectId,
    double? latitude,
    double? longitude,
    String? locationNotes,
  }) async {
    final formData = FormData.fromMap({
      'photo': await MultipartFile.fromFile(image.path,
          filename: 'photo_${DateTime.now().millisecondsSinceEpoch}.jpg'),
      if (caption != null) 'caption': caption,
      if (category != null) 'category': category,
      if (projectId != null) 'project_id': projectId,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (locationNotes != null) 'location_notes': locationNotes,
    });

    final r = await _dio.post(
      ApiEndpoints.photos,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );
    return SitePhoto.fromJson(r.data['data']);
  }

  Future<void> deletePhoto(String id) async {
    await _dio.delete('${ApiEndpoints.photos}/$id');
  }

  Future<XFile?> pickImage({required ImageSource source}) async {
    final picked = await _picker.pickImage(
      source: source,
      imageQuality: 85,
      maxWidth: 1920,
      maxHeight: 1080,
    );
    return picked;
  }
}
