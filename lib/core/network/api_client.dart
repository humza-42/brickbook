import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../storage/secure_storage.dart';
import 'api_endpoints.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/retry_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'api_error.dart';
import 'api_response.dart';

part 'api_client.g.dart';

@riverpod
Dio apiClient(ApiClientRef ref) {
  final storage = ref.watch(secureStorageProvider);

  final dio = Dio(BaseOptions(
    baseUrl: ApiEndpoints.baseUrl,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    responseType: ResponseType.json,
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'X-App-Version': '1.0.0',
      'X-Platform': 'flutter',
    },
  ));

  dio.interceptors.addAll([
    AuthInterceptor(storage),
    RetryInterceptor(dio: dio, maxRetries: 2),
    LoggingInterceptor(),
  ]);

  return dio;
}

/// Safe API call wrapper — converts any error to ApiError
Future<T> safeApiCall<T>(Future<T> Function() call) async {
  try {
    return await call();
  } catch (e) {
    throw parseError(e);
  }
}
