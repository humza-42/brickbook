import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';

class OfflineBanner extends StatefulWidget {
  final Widget? child;
  const OfflineBanner({super.key, this.child});

  @override
  State<OfflineBanner> createState() => _OfflineBannerState();
}

class _OfflineBannerState extends State<OfflineBanner> {
  bool _isOffline = false;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    setState(() => _isOffline = result.every((c) => c == ConnectivityResult.none));
  }

  @override
  Widget build(BuildContext context) {
    if (!_isOffline) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: AppDim.base, vertical: 8),
      color: AppColors.error,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.wifi_off_rounded, color: Colors.white, size: 16),
          const SizedBox(width: 6),
          const Text('You are offline', style: TextStyle(color: Colors.white, fontSize: 12, fontFamily: 'Sora')),
        ],
      ),
    );
  }
}
