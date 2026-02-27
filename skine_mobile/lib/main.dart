import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'core/theme/app_theme.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';
import 'features/ai/presentation/pages/ai_coming_soon_page.dart';
import 'features/recommendations/presentation/pages/recommendations_page.dart';

void main() {
  runApp(const ProviderScope(child: SkinEMobileApp()));
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardPage(),
    ),
    GoRoute(
      path: '/ai',
      builder: (context, state) => const AIComingSoonPage(),
    ),
    GoRoute(
      path: '/recommendations',
      builder: (context, state) => const RecommendationsPage(),
    ),
  ],
);

class SkinEMobileApp extends StatelessWidget {
  const SkinEMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SkinE Clinical Elite',
      routerConfig: _router,
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
