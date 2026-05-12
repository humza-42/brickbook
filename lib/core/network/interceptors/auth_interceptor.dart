import 'package:dio/dio.dart';
import '../../storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorageService _storage;

  AuthInterceptor(this._storage);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['Accept']       = 'application/json';
    options.headers['Content-Type'] = 'application/json';

    final lang = await _storage.getLanguage();
    options.headers['Accept-Language'] = lang;

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      _storage.clearAll();
    }
    return handler.next(err);
  }
}
