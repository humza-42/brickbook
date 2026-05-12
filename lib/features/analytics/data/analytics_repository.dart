import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/api_error.dart';
import '../../../core/network/api_response.dart';
import 'models/analytics_models.dart';

part 'analytics_repository.g.dart';

@riverpod
AnalyticsRepository analyticsRepository(AnalyticsRepositoryRef ref) =>
    AnalyticsRepository(dio: ref.watch(apiClientProvider));

class AnalyticsRepository {
  final Dio _dio;
  AnalyticsRepository({required Dio dio}) : _dio = dio;

  Future<ProjectAnalytics> getProjectAnalytics(String projectId) async {
    return safeApiCall(() async {
      final r = await _dio.get(ApiEndpoints.analytics(projectId));
      return parseData(r.data['data'] as Map<String, dynamic>, ProjectAnalytics.fromJson);
    });
  }

  Future<List<VendorSpend>> getVendorSpend(String projectId) async {
    return safeApiCall(() async {
      final r = await _dio.get(ApiEndpoints.analyticsVendors(projectId));
      return parseList(r.data['data'] as List, VendorSpend.fromJson);
    });
  }
}
