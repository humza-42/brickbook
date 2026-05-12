import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';

/// Unified API error that all repositories throw
@freezed
class ApiError with _$ApiError implements Exception {
  const factory ApiError({
    required String message,
    required ApiErrorType type,
    int? statusCode,
    Map<String, dynamic>? validationErrors,
    Object? originalError,
  }) = _ApiError;

  const ApiError._();

  /// Human-readable message for the UI
  String get userMessage => switch (type) {
    ApiErrorType.network      => 'No internet connection. Please check your network.',
    ApiErrorType.timeout      => 'Request timed out. Please try again.',
    ApiErrorType.unauthorized => 'Your session has expired. Please log in again.',
    ApiErrorType.forbidden    => 'You do not have permission to perform this action.',
    ApiErrorType.notFound     => 'The requested resource was not found.',
    ApiErrorType.validation   => _formatValidationErrors(),
    ApiErrorType.server       => 'Server error. Please try again later.',
    ApiErrorType.cancelled    => 'Request was cancelled.',
    ApiErrorType.unknown      => message,
  };

  String _formatValidationErrors() {
    if (validationErrors == null) return message;
    return validationErrors!.entries
        .map((e) => (e.value as List).join(', '))
        .join('\n');
  }
}

enum ApiErrorType {
  network,
  timeout,
  unauthorized,
  forbidden,
  notFound,
  validation,
  server,
  cancelled,
  unknown,
}

/// Parse a DioException into a typed ApiError
ApiError parseError(Object error) {
  if (error is ApiError) return error;

  if (error is DioException) {
    return switch (error.type) {
      DioExceptionType.connectionError  =>
        ApiError(message: 'No internet connection', type: ApiErrorType.network, originalError: error),
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout      ||
      DioExceptionType.receiveTimeout   =>
        ApiError(message: 'Request timed out', type: ApiErrorType.timeout, originalError: error),
      DioExceptionType.cancel           =>
        ApiError(message: 'Request cancelled', type: ApiErrorType.cancelled, originalError: error),
      DioExceptionType.badResponse      => _parseResponse(error),
      _                                 =>
        ApiError(message: error.message ?? 'Unknown error', type: ApiErrorType.unknown, originalError: error),
    };
  }

  return ApiError(message: error.toString(), type: ApiErrorType.unknown, originalError: error);
}

ApiError _parseResponse(DioException error) {
  final status = error.response?.statusCode;
  final data   = error.response?.data;

  String message = 'Something went wrong';
  if (data is Map) {
    message = data['message'] as String? ?? message;
  }

  return switch (status) {
    401 => ApiError(message: message, type: ApiErrorType.unauthorized, statusCode: status),
    403 => ApiError(message: message, type: ApiErrorType.forbidden, statusCode: status),
    404 => ApiError(message: message, type: ApiErrorType.notFound, statusCode: status),
    422 => ApiError(
        message: message,
        type: ApiErrorType.validation,
        statusCode: status,
        validationErrors: data is Map ? data['errors'] as Map<String, dynamic>? : null,
      ),
    500 || 502 || 503 => ApiError(message: message, type: ApiErrorType.server, statusCode: status),
    _ => ApiError(message: message, type: ApiErrorType.unknown, statusCode: status),
  };
}
