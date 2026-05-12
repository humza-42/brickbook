import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/api_error.dart';
import '../../../core/network/api_response.dart';
import 'models/vendor_models.dart';

part 'vendor_repository.g.dart';

@riverpod
VendorRepository vendorRepository(VendorRepositoryRef ref) =>
    VendorRepository(dio: ref.watch(apiClientProvider));

class VendorRepository {
  final Dio _dio;
  VendorRepository({required Dio dio}) : _dio = dio;

  Future<List<VendorModel>> getVendors() async {
    return safeApiCall(() async {
      final r = await _dio.get(ApiEndpoints.vendors);
      return parseList(r.data['data'] as List, VendorModel.fromJson);
    });
  }

  Future<VendorSummary> getVendorSummary(String id) async {
    return safeApiCall(() async {
      final r = await _dio.get(ApiEndpoints.vendorSummary(id));
      return parseData(r.data['data'] as Map<String, dynamic>, VendorSummary.fromJson);
    });
  }

  Future<VendorModel> createVendor(Map<String, dynamic> data) async {
    return safeApiCall(() async {
      final r = await _dio.post(ApiEndpoints.vendors, data: data);
      return parseData(r.data['data'] as Map<String, dynamic>, VendorModel.fromJson);
    });
  }

  Future<VendorModel> updateVendor(String id, Map<String, dynamic> data) async {
    return safeApiCall(() async {
      final r = await _dio.put(ApiEndpoints.vendorById(id), data: data);
      return parseData(r.data['data'] as Map<String, dynamic>, VendorModel.fromJson);
    });
  }

  Future<void> deleteVendor(String id) async {
    return safeApiCall(() async {
      await _dio.delete(ApiEndpoints.vendorById(id));
    });
  }
}
