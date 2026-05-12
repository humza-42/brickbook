import 'package:freezed_annotation/freezed_annotation.dart';
import 'api_error.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

/// Standard Laravel API response shape:
/// { "success": true, "message": "...", "data": {...}, "meta": {...} }
@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required bool success,
    required String message,
    T? data,
    PaginationMeta? meta,
  }) = _ApiResponse<T>;
}

@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    required int currentPage,
    required int lastPage,
    required int perPage,
    required int total,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

/// Safely parse a raw map into T using a fromJson factory
T parseData<T>(
  Map<String, dynamic> json,
  T Function(Map<String, dynamic>) fromJson,
) {
  try {
    return fromJson(json);
  } catch (e) {
    throw ApiError(
      message: 'Failed to parse response: ${e.toString()}',
      type: ApiErrorType.unknown,
      originalError: e,
    );
  }
}

/// Safely parse a list
List<T> parseList<T>(
  List<dynamic> json,
  T Function(Map<String, dynamic>) fromJson,
) {
  return json
      .map((e) => parseData(e as Map<String, dynamic>, fromJson))
      .toList();
}
