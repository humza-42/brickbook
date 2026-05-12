import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  final Dio _dio;
  final int maxRetries;
  final Duration retryDelay;

  RetryInterceptor({
    required Dio dio,
    this.maxRetries = 2,
    this.retryDelay = const Duration(seconds: 1),
  }) : _dio = dio;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final attempt = err.requestOptions.extra['retryCount'] as int? ?? 0;

    final shouldRetry = attempt < maxRetries &&
        (err.type == DioExceptionType.connectionTimeout ||
         err.type == DioExceptionType.receiveTimeout    ||
         err.type == DioExceptionType.connectionError);

    if (!shouldRetry) return handler.next(err);

    await Future.delayed(retryDelay * (attempt + 1));

    try {
      final options = err.requestOptions;
      options.extra['retryCount'] = attempt + 1;

      final response = await _dio.request(
        options.path,
        data: options.data,
        queryParameters: options.queryParameters,
        options: Options(
          method: options.method,
          headers: options.headers,
        ),
      );
      return handler.resolve(response);
    } on DioException catch (e) {
      return handler.next(e);
    }
  }
}
