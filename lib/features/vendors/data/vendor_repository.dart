import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import 'models/vendor_models.dart';

part 'vendor_repository.g.dart';

@riverpod
VendorRepository vendorRepository(VendorRepositoryRef ref) =>
    VendorRepository(dio: ref.watch(apiClientProvider));

class VendorRepository {
  final Dio _dio;
  VendorRepository({required Dio dio}) : _dio = dio;

  Future<List<VendorModel>> getVendors() async {
    final r = await _dio.get(ApiEndpoints.vendors);
    return (r.data['data'] as List).map((e) => VendorModel.fromJson(e)).toList();
  }

  Future<VendorSummary> getVendorSummary(String id) async {
    final r = await _dio.get(ApiEndpoints.vendorSummary(id));
    return VendorSummary.fromJson(r.data['data']);
  }

  Future<VendorModel> createVendor(Map<String, dynamic> data) async {
    final r = await _dio.post(ApiEndpoints.vendors, data: data);
    return VendorModel.fromJson(r.data['data']);
  }

  Future<VendorModel> updateVendor(String id, Map<String, dynamic> data) async {
    final r = await _dio.put(ApiEndpoints.vendorById(id), data: data);
    return VendorModel.fromJson(r.data['data']);
  }

  Future<void> deleteVendor(String id) =>
      _dio.delete(ApiEndpoints.vendorById(id));
}
