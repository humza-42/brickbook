import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import 'models/sharing_models.dart';

part 'sharing_repository.g.dart';

@riverpod
SharingRepository sharingRepository(SharingRepositoryRef ref) =>
    SharingRepository(dio: ref.watch(apiClientProvider));

class SharingRepository {
  final Dio _dio;
  SharingRepository({required Dio dio}) : _dio = dio;

  // Guest Links
  Future<List<GuestLink>> getGuestLinks(String projectId) async {
    final r = await _dio.get(ApiEndpoints.guestLinks(projectId));
    return (r.data['data'] as List).map((e) => GuestLink.fromJson(e)).toList();
  }

  Future<GuestLink> createGuestLink(
      String projectId, CreateGuestLinkRequest req) async {
    final r = await _dio.post(ApiEndpoints.guestLinks(projectId), data: {
      'access_level': req.accessLevel,
      'expires_at':   _resolveExpiry(req.expiresAt),
      if (req.password != null) 'password': req.password,
    });
    return GuestLink.fromJson(r.data['data']);
  }

  Future<void> revokeGuestLink(String projectId, String linkId) =>
      _dio.delete('${ApiEndpoints.guestLinks(projectId)}/$linkId');

  // PDF Export
  Future<File> exportPdf(String projectId) async {
    final r = await _dio.post(
      ApiEndpoints.exportPdf(projectId),
      options: Options(responseType: ResponseType.bytes),
    );
    final dir  = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/brickbook_report_$projectId.pdf');
    await file.writeAsBytes(r.data);
    return file;
  }

  // Excel Export
  Future<File> exportExcel(String projectId) async {
    final r = await _dio.post(
      ApiEndpoints.exportExcel(projectId),
      options: Options(responseType: ResponseType.bytes),
    );
    final dir  = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/brickbook_expenses_$projectId.xlsx');
    await file.writeAsBytes(r.data);
    return file;
  }

  // Email Report
  Future<void> sendEmailReport(
      String projectId, String email, String? message) async {
    await _dio.post(ApiEndpoints.shareEmail(projectId), data: {
      'email':   email,
      'message': message ?? '',
    });
  }

  // Helper
  String? _resolveExpiry(String? val) {
    if (val == null || val == 'never') return null;
    final now = DateTime.now();
    if (val == '24h') return now.add(const Duration(hours: 24)).toIso8601String();
    if (val == '7d')  return now.add(const Duration(days: 7)).toIso8601String();
    if (val == '30d') return now.add(const Duration(days: 30)).toIso8601String();
    return null;
  }
}
