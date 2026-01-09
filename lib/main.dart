// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/providers/portfolio_state.dart';
import 'package:portfolio/theme/theme.dart';

import 'features/admin/dashboard.dart';
import 'features/admin/login_page.dart';
import 'features/public/home_page.dart';
import 'providers/auth_provider.dart'; // Import Auth Provider
import 'providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: AryaPortfolioApp()));
}

// 2. Wrap the Router in a Provider to listen to Auth Changes
final routerProvider = Provider<GoRouter>((ref) {
  ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/',
    refreshListenable: _ValueNotifierFromStream(ref),
    // Triggers rebuild on auth change
    redirect: (context, state) {
      final isLoggedIn = ref.read(authProvider);
      final isGoingToAdmin = state.matchedLocation.startsWith(
        '/admin/dashboard',
      );

      // If trying to access admin dashboard and NOT logged in -> Redirect to Login
      if (isGoingToAdmin && !isLoggedIn) {
        return '/admin';
      }

      // If already logged in and trying to access login page -> Redirect to Dashboard
      if (state.matchedLocation == '/admin' && isLoggedIn) {
        return '/admin/dashboard';
      }

      return null; // No redirect
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(
        path: '/admin',
        builder: (context, state) => const AdminLoginPage(),
      ),
      GoRoute(
        path: '/admin/dashboard',
        builder: (context, state) => const AdminDashboardPage(),
      ),
    ],
  );
});

// Helper to make Riverpod work with GoRouter refreshListenable
class _ValueNotifierFromStream extends ValueNotifier<void> {
  _ValueNotifierFromStream(Ref ref) : super(null) {
    ref.listen<bool>(authProvider, (_, __) => notifyListeners());
  }
}

class AryaPortfolioApp extends ConsumerWidget {
  const AryaPortfolioApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final data = ref.watch(portfolioProvider);
    final router = ref.watch(routerProvider); // Use the new provider

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Arya Mehta',
      theme: AppTheme.lightTheme(data.themeConfig.primaryColor),
      darkTheme: AppTheme.darkTheme(data.themeConfig.primaryColor),
      themeMode: themeMode,
      themeAnimationDuration: const Duration(milliseconds: 700),
      themeAnimationCurve: Curves.easeInOutCubic,
    );
  }
}
