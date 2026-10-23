import 'package:birendra_portfolio/screens/home_screen.dart';
import 'package:birendra_portfolio/screens/project_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/projects/:slug',
      name: 'project-detail',
      builder: (context, state) {
        final slug = state.pathParameters['slug']!;
        return ProjectDetailScreen(slug: slug);
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Page not found',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () => context.go('/'),
            child: const Text('Back to home'),
          ),
        ],
      ),
    ),
  ),
);
