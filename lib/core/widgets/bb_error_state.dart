import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_dimensions.dart';
import '../network/api_error.dart';

class BBErrorState extends StatelessWidget {
  final Object? error;
  final VoidCallback? onRetry;
  final String? customMessage;

  const BBErrorState({
    super.key,
    this.error,
    this.onRetry,
    this.customMessage,
  });

  String get _message {
    if (customMessage != null) return customMessage!;
    if (error is ApiError) return (error as ApiError).userMessage;
    return 'Something went wrong. Please try again.';
  }

  ApiErrorType? get _errorType {
    if (error is ApiError) return (error as ApiError).type;
    return null;
  }

  String get _emoji {
    return switch (_errorType) {
      ApiErrorType.network      => '📡',
      ApiErrorType.timeout      => '⏱️',
      ApiErrorType.unauthorized => '🔒',
      ApiErrorType.notFound     => '🔍',
      ApiErrorType.server       => '⚙️',
      _                         => '⚠️',
    };
  }

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(AppDim.pageHPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_emoji, style: const TextStyle(fontSize: 52)),
          const SizedBox(height: AppDim.base),
          Text(
            _errorType == ApiErrorType.network
                ? 'No Connection'
                : 'Something went wrong',
            style: AppText.h3,
          ),
          const SizedBox(height: 8),
          Text(
            _message,
            textAlign: TextAlign.center,
            style: AppText.bodyMd.copyWith(color: AppColors.textSecondary),
          ),
          if (onRetry != null) ...[
            const SizedBox(height: AppDim.xl),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: const Text('Try Again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDim.radiusMd)),
              ),
            ),
          ],
        ],
      ),
    ),
  );
}

class BBErrorBanner extends StatelessWidget {
  final String message;
  final VoidCallback? onDismiss;

  const BBErrorBanner({super.key, required this.message, this.onDismiss});

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    margin: const EdgeInsets.fromLTRB(
        AppDim.pageHPadding, AppDim.sm, AppDim.pageHPadding, 0),
    padding: const EdgeInsets.symmetric(
        horizontal: AppDim.base, vertical: AppDim.sm),
    decoration: BoxDecoration(
      color: AppColors.errorLight,
      borderRadius: BorderRadius.circular(AppDim.radiusMd),
      border: Border.all(color: AppColors.error.withOpacity(0.3)),
    ),
    child: Row(children: [
      const Icon(Icons.error_outline_rounded,
          color: AppColors.error, size: 16),
      const SizedBox(width: AppDim.sm),
      Expanded(child: Text(message,
          style: AppText.bodySm.copyWith(color: AppColors.error))),
      if (onDismiss != null)
        GestureDetector(
          onTap: onDismiss,
          child: const Icon(Icons.close_rounded,
              color: AppColors.error, size: 16),
        ),
    ]),
  );
}
