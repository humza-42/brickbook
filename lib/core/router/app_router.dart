import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/providers/auth_provider.dart';
import '../../features/auth/screens/splash_screen.dart';
import '../../features/auth/screens/onboarding_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/register_screen.dart';
import '../../features/auth/screens/otp_screen.dart';
import '../../features/auth/screens/role_selection_screen.dart';
import '../../features/dashboard/screens/dashboard_screen.dart';
import '../../features/projects/screens/projects_list_screen.dart';
import '../../features/projects/screens/create_project_screen.dart';
import '../../features/projects/screens/project_detail_screen.dart';
import '../../features/expenses/screens/expense_list_screen.dart';
import '../../features/expenses/screens/add_expense_screen.dart';
import '../../features/expenses/screens/expense_detail_screen.dart';
import '../../features/analytics/screens/analytics_screen.dart';
import '../../features/sharing/screens/share_project_screen.dart';
import '../../features/sharing/screens/guest_link_screen.dart';
import '../../features/vendors/screens/vendors_list_screen.dart';
import '../../features/vendors/screens/vendor_detail_screen.dart';
import '../../features/vendors/screens/add_vendor_screen.dart';
import '../../features/photos/screens/site_photos_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../../features/settings/screens/profile_screen.dart';
import '../../features/settings/screens/language_screen.dart';
import '../../features/settings/screens/notifications_screen.dart';
import '../widgets/main_shell.dart';
import '../widgets/offline_banner.dart';
import '../widgets/bb_error_state.dart';
import 'route_names.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: Routes.splash,
    debugLogDiagnostics: true,

    redirect: (context, state) {
      final isLoggedIn = authState.isLoggedIn;
      final isAuthRoute = {
        Routes.splash, Routes.onboarding,
        Routes.login, Routes.register,
        Routes.otp, Routes.roleSelection,
      }.contains(state.matchedLocation);

      if (!isLoggedIn && !isAuthRoute) return Routes.login;
      if (isLoggedIn && isAuthRoute &&
          state.matchedLocation != Routes.splash) {
        return Routes.dashboard;
      }
      return null;
    },

    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: BBErrorState(
        customMessage: 'The page you are looking for does not exist.',
        onRetry: () => context.go(Routes.dashboard),
      ),
    ),

    routes: [
      // ── Auth ───────────────────────────────────────
      GoRoute(path: Routes.splash, builder: (_, __) => const SplashScreen()),
      GoRoute(path: Routes.onboarding, builder: (_, __) => const OnboardingScreen()),
      GoRoute(path: Routes.login, builder: (_, __) => const LoginScreen()),
      GoRoute(path: Routes.register, builder: (_, __) => const RegisterScreen()),
      GoRoute(path: Routes.otp, builder: (_, s) => OtpScreen(extra: s.extra)),
      GoRoute(path: Routes.roleSelection, builder: (_, __) => const RoleSelectionScreen()),

      // ── Main Shell ─────────────────────────────────
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(path: Routes.dashboard, builder: (_, __) => const DashboardScreen()),
          GoRoute(path: Routes.projects, builder: (_, __) => const ProjectsListScreen()),
          GoRoute(path: Routes.vendors, builder: (_, __) => const VendorsListScreen()),
          GoRoute(path: Routes.settings, builder: (_, __) => const SettingsScreen()),
        ],
      ),

      // ── Projects ────────────────────────────────────
      GoRoute(path: Routes.createProject, builder: (_, __) => const CreateProjectScreen()),
      GoRoute(path: Routes.projectDetail, builder: (_, s) =>
          ProjectDetailScreen(id: s.pathParameters['id']!)),

      // ── Expenses ────────────────────────────────────
      GoRoute(path: Routes.expenseList, builder: (_, s) =>
          ExpenseListScreen(projectId: s.pathParameters['id']!)),
      GoRoute(path: Routes.addExpense, builder: (_, s) =>
          AddExpenseScreen(projectId: s.pathParameters['id']!, editExpense: s.extra as dynamic)),
      GoRoute(path: Routes.expenseDetail, builder: (_, s) =>
          ExpenseDetailScreen(
              projectId: s.pathParameters['id']!,
              expenseId: s.pathParameters['expId']!)),

      // ── Analytics ────────────────────────────────────
      GoRoute(path: Routes.analytics, builder: (_, s) =>
          AnalyticsScreen(projectId: s.pathParameters['id']!)),

      // ── Sharing ─────────────────────────────────────
      GoRoute(path: Routes.shareProject, builder: (_, s) =>
          ShareProjectScreen(projectId: s.pathParameters['id']!)),
      GoRoute(path: Routes.guestLinks, builder: (_, s) =>
          GuestLinkScreen(projectId: s.pathParameters['id']!)),

      // ── Vendors ─────────────────────────────────────
      GoRoute(path: Routes.vendorDetail, builder: (_, s) =>
          VendorDetailScreen(vendorId: s.pathParameters['id']!)),
      GoRoute(path: Routes.addVendor, builder: (_, s) =>
          AddVendorScreen(editVendor: s.extra as dynamic)),

      // ── Photos ───────────────────────────────────────
      GoRoute(path: Routes.sitePhotos, builder: (_, s) =>
          SitePhotosScreen(projectId: s.pathParameters['id']!)),

      // ── Settings ─────────────────────────────────────
      GoRoute(path: Routes.profile, builder: (_, __) => const ProfileScreen()),
      GoRoute(path: Routes.language, builder: (_, __) => const LanguageScreen()),
      GoRoute(path: Routes.notifications, builder: (_, __) => const NotificationsScreen()),
    ],
  );
}
