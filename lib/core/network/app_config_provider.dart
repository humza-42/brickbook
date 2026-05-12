import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'api_client.dart';
import 'api_endpoints.dart';

part 'app_config_provider.freezed.dart';
part 'app_config_provider.g.dart';

@freezed
class AppConfig with _$AppConfig {
  const factory AppConfig({
    @Default(true)  bool  maintenanceMode,
    @Default('1.0') String minimumAppVersion,
    @Default([])    List<Map<String, dynamic>> announcements,
    @Default({})    Map<String, dynamic> settings,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
}

@riverpod
Future<AppConfig> appConfig(AppConfigRef ref) async {
  try {
    final dio = ref.watch(apiClientProvider);
    final r   = await dio.get(ApiEndpoints.config);
    return AppConfig.fromJson(r.data['data'] as Map<String, dynamic>);
  } catch (_) {
    return const AppConfig(maintenanceMode: false);
  }
}
