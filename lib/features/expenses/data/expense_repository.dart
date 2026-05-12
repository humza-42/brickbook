import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/api_error.dart';
import '../../../core/network/api_response.dart';
import 'models/expense_models.dart';

part 'expense_repository.g.dart';

@riverpod
ExpenseRepository expenseRepository(ExpenseRepositoryRef ref) =>
    ExpenseRepository(dio: ref.watch(apiClientProvider));

class ExpenseRepository {
  final Dio _dio;
  ExpenseRepository({required Dio dio}) : _dio = dio;

  Future<List<ExpenseModel>> getExpenses(String projectId, ExpenseFilter filter) async {
    return safeApiCall(() async {
      final params = <String, dynamic>{
        if (filter.categoryId != null) 'category_id': filter.categoryId,
        if (filter.paymentMethod != null) 'payment_method': filter.paymentMethod,
        if (filter.paymentStatus != null) 'payment_status': filter.paymentStatus,
        if (filter.phaseId != null) 'phase_id': filter.phaseId,
        if (filter.dateFrom != null) 'date_from': filter.dateFrom,
        if (filter.dateTo != null) 'date_to': filter.dateTo,
        if (filter.search != null) 'search': filter.search,
        'sort': filter.sortBy,
      };
      final r = await _dio.get(ApiEndpoints.expenses(projectId), queryParameters: params);
      return parseList(r.data['data'] as List, ExpenseModel.fromJson);
    });
  }

  Future<ExpenseModel> getExpense(String projectId, String expenseId) async {
    return safeApiCall(() async {
      final r = await _dio.get(ApiEndpoints.expenseById(projectId, expenseId));
      return parseData(r.data['data'] as Map<String, dynamic>, ExpenseModel.fromJson);
    });
  }

  Future<ExpenseModel> createExpense(String projectId, Map<String, dynamic> data) async {
    return safeApiCall(() async {
      final r = await _dio.post(ApiEndpoints.expenses(projectId), data: data);
      return parseData(r.data['data'] as Map<String, dynamic>, ExpenseModel.fromJson);
    });
  }

  Future<ExpenseModel> updateExpense(String projectId, String expenseId, Map<String, dynamic> data) async {
    return safeApiCall(() async {
      final r = await _dio.put(ApiEndpoints.expenseById(projectId, expenseId), data: data);
      return parseData(r.data['data'] as Map<String, dynamic>, ExpenseModel.fromJson);
    });
  }

  Future<void> deleteExpense(String projectId, String expenseId) async {
    return safeApiCall(() async {
      await _dio.delete(ApiEndpoints.expenseById(projectId, expenseId));
    });
  }

  Future<void> uploadAttachment(String projectId, String expenseId, String filePath) async {
    return safeApiCall(() async {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath),
        'file_type': 'image',
      });
      await _dio.post(ApiEndpoints.expenseAttachments(projectId, expenseId), data: formData);
    });
  }

  Future<void> deleteAttachment(String attachmentId) async {
    return safeApiCall(() async {
      await _dio.delete('/expenses/attachments/$attachmentId');
    });
  }

  Future<List<ExpenseCategory>> getCategories() async {
    return safeApiCall(() async {
      try {
        final r = await _dio.get(ApiEndpoints.expenseCategories);
        return parseList(r.data['data'] as List, ExpenseCategory.fromJson);
      } catch (_) {
        return kDefaultCategories.map((c) => ExpenseCategory(
          id: c['id']!,
          nameEn: c['nameEn']!,
          nameUr: c['nameUr']!,
          icon: c['icon']!,
          colorHex: c['color'],
        )).toList();
      }
    });
  }
}

