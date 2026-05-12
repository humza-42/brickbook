import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/connectivity_service.dart';
import '../offline/offline_queue.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_dimensions.dart';

class OfflineBanner extends ConsumerWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnline = ref.watch(connectivityNotifierProvider);
    final draftCount = ref.watch(offlineExpenseQueueProvider).length;

    if (isOnline && draftCount == 0) return const SizedBox.shrink();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isOnline ? 0 : null,
      child: isOnline
          ? _SyncingBanner(draftCount: draftCount)
          : Container(
              width: double.infinity,
              color: AppColors.error,
              padding: const EdgeInsets.symmetric(horizontal: AppDim.base, vertical: 8),
              child: SafeArea(
                bottom: false,
                child: Row(children: [
                  const Icon(Icons.wifi_off_rounded, color: Colors.white, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      draftCount > 0
                          ? 'Offline — $draftCount expense${draftCount > 1 ? 's' : ''} will sync when connected'
                          : 'You\'re offline. Changes will sync when connected.',
                      style: AppText.caption.copyWith(color: Colors.white),
                    ),
                  ),
                ]),
              ),
            ),
    );
  }
}

class _SyncingBanner extends StatefulWidget {
  final int draftCount;
  const _SyncingBanner({required this.draftCount});

  @override
  State<_SyncingBanner> createState() => _SyncingBannerState();
}

class _SyncingBannerState extends State<_SyncingBanner> {
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _visible = false);
    });
  }

  @override
  Widget build(BuildContext context) => AnimatedOpacity(
    opacity: _visible ? 1.0 : 0.0,
    duration: const Duration(milliseconds: 500),
    child: Container(
      width: double.infinity,
      color: AppColors.success,
      padding: const EdgeInsets.symmetric(horizontal: AppDim.base, vertical: 8),
      child: SafeArea(
        bottom: false,
        child: Row(children: [
          const SizedBox(
            width: 14, height: 14,
            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Text(
            'Back online — syncing ${widget.draftCount} draft${widget.draftCount > 1 ? 's' : ''}...',
            style: AppText.caption.copyWith(color: Colors.white),
          ),
        ]),
      ),
    ),
  );
}
