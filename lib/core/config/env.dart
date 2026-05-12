import 'package:flutter/foundation.dart';

enum Environment { development, staging, production }

class Env {
  static const _env = String.fromEnvironment(
    'ENV',
    defaultValue: 'development',
  );

  static Environment get current => switch (_env) {
    'production' => Environment.production,
    'staging'    => Environment.staging,
    _            => Environment.development,
  };

  static bool get isDev  => current == Environment.development;
  static bool get isStag => current == Environment.staging;
  static bool get isProd => current == Environment.production;

  static String get apiBaseUrl => switch (current) {
    Environment.production  => 'https://api.brickbook.app/api',
    Environment.staging     => 'https://staging.api.brickbook.app/api',
    Environment.development => 'http://10.0.2.2:8000/api',
  };

  static bool get enableLogging => isDev || kDebugMode;

  static String get sentryDsn =>
      const String.fromEnvironment('SENTRY_DSN', defaultValue: '');
}
