import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import 'models/expense_models.dart';

part 'expense_repository.g.dart';

@riverpod
ExpenseRepository expenseRepository(ExpenseRepositoryRef ref) =>
    ExpenseRepository(dio: ref.watch(apiClientProvider));

class ExpenseRepository {
  final Dio _dio;
  ExpenseRepository({required Dio dio}) : _dio = dio;

  Future<List<ExpenseModel>> getExpenses(String projectId, ExpenseFilter filter) async {
    final params = <String, dynamic>{};
    if (filter.categoryId    != null) params['category_id']     = filter.categoryId;
    if (filter.paymentMethod != null) params['payment_method']  = filter.paymentMethod;
    if (filter.paymentStatus != null) params['payment_status']  = filter.paymentStatus;
    if (filter.phaseId       != null) params['phase_id']        = filter.phaseId;
    if (filter.dateFrom      != null) params['date_from']       = filter.dateFrom;
    if (filter.dateTo        != null) params['date_to']         = filter.dateTo;
    if (filter.search        != null) params['search']          = filter.search;
    params['sort']                                               = filter.sortBy;

    final r = await _dio.get(ApiEndpoints.expenses(projectId), queryParameters: params);
    return (r.data['data'] as List).map((e) => ExpenseModel.fromJson(e)).toList();
  }

  Future<ExpenseModel> getExpense(String projectId, String expenseId) async {
    final r = await _dio.get(ApiEndpoints.expenseById(projectId, expenseId));
    return ExpenseModel.fromJson(r.data['data']);
  }

  Future<ExpenseModel> createExpense(String projectId, Map<String, dynamic> data) async {
    final r = await _dio.post(ApiEndpoints.expenses(projectId), data: data);
    return ExpenseModel.fromJson(r.data['data']);
  }

  Future<ExpenseModel> updateExpense(String projectId, String expenseId, Map<String, dynamic> data) async {
    final r = await _dio.put(ApiEndpoints.expenseById(projectId, expenseId), data: data);
    return ExpenseModel.fromJson(r.data['data']);
  }

  Future<void> deleteExpense(String projectId, String expenseId) =>
      _dio.delete(ApiEndpoints.expenseById(projectId, expenseId));

  Future<void> uploadAttachment(String projectId, String expenseId, String filePath) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath),
      'file_type': 'image',
    });
    await _dio.post(ApiEndpoints.expenseAttachments(projectId, expenseId), data: formData);
  }

  Future<void> deleteAttachment(String attachmentId) =>
      _dio.delete('/expenses/attachments/$attachmentId');

  Future<List<ExpenseCategory>> getCategories() async {
    try {
      final r = await _dio.get(ApiEndpoints.expenseCategories);
      return (r.data['data'] as List).map((e) => ExpenseCategory.fromJson(e)).toList();
    } catch (_) {
      // Fallback to local defaults if API fails
      return kDefaultCategories.map((c) => ExpenseCategory(
        id: c['id']!,
        nameEn: c['nameEn']!,
        nameUr: c['nameUr']!,
        icon: c['icon']!,
        colorHex: c['color'],
      )).toList();
    }
  }
}
