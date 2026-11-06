import 'package:birendra_portfolio/data/projects.dart';
import 'package:birendra_portfolio/screens/home_screen.dart';
import 'package:birendra_portfolio/screens/not_found_screen.dart';
import 'package:birendra_portfolio/screens/project_detail_screen.dart';
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
        final project = projectBySlug(state.pathParameters['slug']!);
        if (project == null) return const NotFoundScreen();
        return ProjectDetailScreen(project: project);
      },
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
