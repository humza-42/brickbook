import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('┌─────────────────────────────────────');
      debugPrint('│ [BrickBook API] → ${options.method} ${options.uri}');
      if (options.data != null) {
        debugPrint('│ Body: ${options.data}');
      }
      debugPrint('└─────────────────────────────────────');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('┌─────────────────────────────────────');
      debugPrint('│ [BrickBook API] ← ${response.statusCode} ${response.requestOptions.uri}');
      debugPrint('└─────────────────────────────────────');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('┌─────────────────────────────────────');
      debugPrint('│ [BrickBook API] ✗ ${err.response?.statusCode} ${err.requestOptions.uri}');
      debugPrint('│ Error: ${err.message}');
      if (err.response?.data != null) {
        debugPrint('│ Response: ${err.response?.data}');
      }
      debugPrint('└─────────────────────────────────────');
    }
    handler.next(err);
  }
}
