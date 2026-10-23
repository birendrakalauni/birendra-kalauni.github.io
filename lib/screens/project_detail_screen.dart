import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Back to home',
          onPressed: () => context.go('/'),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text('Project:  $slug'),
      ),
      body: const Center(
        child: Text('Project detail page (placeholder)'),
      ),
    );
  }
}
