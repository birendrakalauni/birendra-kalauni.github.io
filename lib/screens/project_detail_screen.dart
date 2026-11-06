import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:birendra_portfolio/core/constants/app_info.dart';
import 'package:birendra_portfolio/core/constants/breakpoints.dart';
import 'package:birendra_portfolio/core/utils/url_helper.dart';
import 'package:birendra_portfolio/models/project_model.dart';
import 'package:birendra_portfolio/widgets/project_image.dart';
import 'package:birendra_portfolio/widgets/responsive_container.dart';
import 'package:birendra_portfolio/widgets/status_chip.dart';
import 'package:birendra_portfolio/widgets/tech_tag.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.project});

  final ProjectModel project;

  void _goBack(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Breakpoints.isDesktop(MediaQuery.sizeOf(context).width);
    final info = _ProjectInfo(project: project);
    final semanticLabel = '${project.title} screenshot';

    return Title(
      title: '${project.title} | ${AppInfo.name}',
      color: AppColors.background,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            tooltip: 'Back',
            onPressed: () => _goBack(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text('Project details'),
        ),
        body: SingleChildScrollView(
          child: ResponsiveContainer(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: info),
                        const SizedBox(width: 48),
                        ProjectImage(
                          width: 240,
                          height: 440,
                          imageAsset: project.imageAsset,
                          semanticLabel: semanticLabel,
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        info,
                        const SizedBox(height: 32),
                        ProjectImage(
                          width: double.infinity,
                          height: 240,
                          imageAsset: project.imageAsset,
                          semanticLabel: semanticLabel,
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProjectInfo extends StatelessWidget {
  const _ProjectInfo({required this.project});
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final muted = theme.colorScheme.onSurfaceVariant;
    final status = project.status;
    final githubUrl = project.githubUrl;
    final liveUrl = project.liveUrl;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (status != null) ...[
          StatusChip(status: status),
          const SizedBox(height: 12),
        ],
        Semantics(
          header: true,
          child: Text(
            project.title,
            style: textTheme.displayLarge?.copyWith(fontSize: 40),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          project.tagline,
          style: textTheme.titleLarge?.copyWith(color: AppColors.accent),
        ),

        const SizedBox(height: 20),
        Text(
          project.overview,
          style: textTheme.bodyLarge?.copyWith(color: muted),
        ),

        const SizedBox(height: 32),
        Text('Key features', style: textTheme.titleLarge),
        const SizedBox(height: 12),
        for (final feature in project.features)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Icon(
                    Icons.check_circle_outline,
                    size: 18,
                    color: AppColors.accent,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    feature,
                    style: textTheme.bodyLarge?.copyWith(color: muted),
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 22),
        Text('Technologies', style: textTheme.titleLarge),
        const SizedBox(height: 12),
        TechTagList(tags: project.technologies),
        if (githubUrl != null || liveUrl != null) ...[
          const SizedBox(height: 32),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              if (githubUrl != null)
                FilledButton(
                  onPressed: () =>
                      openLinkWithFeedback(context, githubUrl, label: 'GitHub'),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(FontAwesomeIcons.github, size: 16),

                      SizedBox(width: 8),
                      Text('View on GitHub'),
                    ],
                  ),
                ),
              if (liveUrl != null)
                OutlinedButton(
                  onPressed: () => openLinkWithFeedback(
                    context,
                    liveUrl,
                    label: 'live demo',
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Live demo'),
                      SizedBox(width: 8,),
                      Icon(Icons.open_in_new, size: 16,)
                    ],
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
