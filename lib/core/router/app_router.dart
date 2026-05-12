import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'route_names.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';

// Import auth screens
import '../../features/auth/screens/splash_screen.dart';
import '../../features/auth/screens/onboarding_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/register_screen.dart';
import '../../features/auth/screens/otp_screen.dart';
import '../../features/auth/screens/role_selection_screen.dart';

// Import auth providers
import '../../features/auth/providers/auth_provider.dart';

// Import Step 3 screens (Dashboard + Projects)
import '../../features/dashboard/screens/dashboard_screen.dart';
import '../../features/projects/screens/projects_list_screen.dart';
import '../../features/projects/screens/create_project_screen.dart';
import '../../features/projects/screens/project_detail_screen.dart';

// Import placeholder screens for future steps (Step 4+)
import '../../features/vendors/screens/vendors_list_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../../features/settings/screens/language_screen.dart';
import '../../features/settings/screens/notifications_screen.dart';
import '../../features/expenses/screens/expense_list_screen.dart';
import '../../features/expenses/screens/add_expense_screen.dart';
import '../../features/expenses/screens/expense_detail_screen.dart';
import '../../features/analytics/screens/analytics_screen.dart';
import '../../features/share/screens/share_project_screen.dart';
import '../../features/profile/screens/profile_screen.dart';

part 'app_router.g.dart';

// Main Shell Widget
class MainShell extends StatelessWidget {
  final Widget child;
  const MainShell({super.key, required this.child});

  int _selectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith('/dashboard')) return 0;
    if (location.startsWith('/projects')) return 1;
    if (location.startsWith('/vendors')) return 2;
    if (location.startsWith('/settings')) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final index = _selectedIndex(context);
    return Scaffold(
      body: child,
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
                _NavItem(icon: Icons.dashboard_outlined, activeIcon: Icons.dashboard, label: 'Home', index: 0, current: index, route: Routes.dashboard),
                _NavItem(icon: Icons.construction_outlined, activeIcon: Icons.construction, label: 'Projects', index: 1, current: index, route: Routes.projects),
                _NavItem(icon: Icons.store_outlined, activeIcon: Icons.store, label: 'Vendors', index: 2, current: index, route: Routes.vendors),
                _NavItem(icon: Icons.person_outline, activeIcon: Icons.person, label: 'Settings', index: 3, current: index, route: Routes.settings),
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
  final int index, current;
  const _NavItem({required this.icon, required this.activeIcon, required this.label, required this.index, required this.current, required this.route});

  @override
  Widget build(BuildContext context) {
    final isActive = index == current;
    return Expanded(
      child: InkWell(
        onTap: () => context.go(route),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(isActive ? activeIcon : icon, color: isActive ? AppColors.primary : AppColors.textTertiary, size: 22),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(fontSize: 11, fontWeight: isActive ? FontWeight.w600 : FontWeight.w400, color: isActive ? AppColors.primary : AppColors.textTertiary)),
          ],
        ),
      ),
    );
  }
}

// App Router
@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: Routes.splash,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authState.isLoggedIn;
      final isAuthRoute = [
        Routes.splash, Routes.onboarding, Routes.login,
        Routes.register, Routes.otp, Routes.roleSelection,
      ].contains(state.matchedLocation);

      if (!isLoggedIn && !isAuthRoute) return Routes.login;
      if (isLoggedIn && isAuthRoute && state.matchedLocation != Routes.splash) {
        return Routes.dashboard;
      }
      return null;
    },
    routes: [
      // Auth Routes
      GoRoute(path: Routes.splash, builder: (_, __) => const SplashScreen()),
      GoRoute(path: Routes.onboarding, builder: (_, __) => const OnboardingScreen()),
      GoRoute(path: Routes.login, builder: (_, __) => const LoginScreen()),
      GoRoute(path: Routes.register, builder: (_, __) => const RegisterScreen()),
      GoRoute(path: Routes.otp, builder: (_, s) => OtpScreen(extra: s.extra)),
      GoRoute(path: Routes.roleSelection, builder: (_, __) => const RoleSelectionScreen()),

      // Main Shell
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(path: Routes.dashboard, builder: (_, __) => const DashboardScreen()),
          GoRoute(path: Routes.projects, builder: (_, __) => const ProjectsListScreen()),
          GoRoute(path: Routes.vendors, builder: (_, __) => const VendorsListScreen()),
          GoRoute(path: Routes.settings, builder: (_, __) => const SettingsScreen()),
          // Settings sub-routes
          GoRoute(path: Routes.profile, builder: (_, __) => const ProfileScreen()),
          GoRoute(path: Routes.language, builder: (_, __) => const LanguageScreen()),
          GoRoute(path: Routes.notifications, builder: (_, __) => const NotificationsScreen()),
        ],
      ),

      // Project Routes
      GoRoute(path: Routes.createProject, builder: (_, __) => const CreateProjectScreen()),
      GoRoute(path: Routes.projectDetail, builder: (_, s) => ProjectDetailScreen(id: s.pathParameters['id']!)),
      GoRoute(path: Routes.expenseList, builder: (_, s) => ExpenseListScreen(projectId: s.pathParameters['id']!)),
      GoRoute(path: Routes.addExpense, builder: (_, s) => AddExpenseScreen(projectId: s.pathParameters['id']!)),
      GoRoute(path: Routes.expenseDetail, builder: (_, s) => ExpenseDetailScreen(projectId: s.pathParameters['id']!, expenseId: s.pathParameters['expId']!)),
      GoRoute(path: Routes.analytics, builder: (_, s) => AnalyticsScreen(projectId: s.pathParameters['id']!)),
      GoRoute(path: Routes.shareProject, builder: (_, s) => ShareProjectScreen(projectId: s.pathParameters['id']!)),
     ],
    errorBuilder: (context, state) => Scaffold(body: Center(child: Text('Page not found: ${state.error}'))),
  );
}
