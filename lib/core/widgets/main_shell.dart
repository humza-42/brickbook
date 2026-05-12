import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import '../router/route_names.dart';
import 'offline_banner.dart';

class MainShell extends StatelessWidget {
  final Widget child;
  const MainShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const OfflineBanner(),
          Expanded(child: child),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(top: BorderSide(color: AppColors.border, width: 1)),
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: AppDim.bottomNavHeight,
            child: Row(
              children: [
                _NavItem(icon: Icons.dashboard_outlined, activeIcon: Icons.dashboard, label: 'Home', index: 0, route: Routes.dashboard),
                _NavItem(icon: Icons.construction_outlined, activeIcon: Icons.construction, label: 'Projects', index: 1, route: Routes.projects),
                _NavItem(icon: Icons.store_outlined, activeIcon: Icons.store, label: 'Vendors', index: 2, route: Routes.vendors),
                _NavItem(icon: Icons.person_outline, activeIcon: Icons.person, label: 'Settings', index: 3, route: Routes.settings),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class _NavItem extends StatelessWidget {
  final IconData icon, activeIcon;
  final String label, route;
  final int index;
  const _NavItem({required this.icon, required this.activeIcon, required this.label, required this.index, required this.route});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final isActive = location.startsWith(route);

    return Expanded(
      child: InkWell(
        onTap: () => context.go(route),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(isActive ? activeIcon : icon, color: isActive ? AppColors.primary : AppColors.textTertiary, size: 22),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(fontSize: 11, fontWeight: isActive ? FontWeight.w600 : FontWeight.w400, color: isActive ? AppColors.primary : AppColors.textTertiary, fontFamily: 'Sora')),
          ],
        ),
      ),
    );
  }
}
