import 'package:birendra_portfolio/core/utils/url_helper.dart';
import 'package:birendra_portfolio/models/project_model.dart';
import 'package:birendra_portfolio/widgets/app_card.dart';
import 'package:birendra_portfolio/widgets/hover_builder.dart';
import 'package:birendra_portfolio/widgets/project_image.dart';
import 'package:birendra_portfolio/widgets/status_chip.dart';
import 'package:birendra_portfolio/widgets/tech_tag.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project, required this.compact});

  final ProjectModel project;
  final bool compact;

  void _open(BuildContext context) => context.push('/projects/${project.slug}');

  @override
  Widget build(BuildContext context) {
    final details = _CardDetails(
      project: project,
      onOpen: () => _open(context),
    );
    final semanticLabel = '${project.title} screenshot';

    return HoverBuilder(
      builder: (context, hovering) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => _open(context),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              transform: Matrix4.translationValues(0, hovering ? -4 : 0, 0),
              child: AppCard(
                highlighted: hovering,
                child: compact
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProjectImage(
                            height: 180,
                            width: double.infinity,
                            imageAsset: project.imageAsset,
                            semanticLabel: semanticLabel,
                          ),
                          const SizedBox(height: 16),
                          Expanded(child: details),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProjectImage(
                            height: 176,
                            width: 96,
                            imageAsset: project.imageAsset,
                            semanticLabel: semanticLabel,
                          ),
                          const SizedBox(width: 16),
                          Expanded(child: details),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CardDetails extends StatelessWidget {
  const _CardDetails({required this.project, required this.onOpen});

  final ProjectModel project;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final status = project.status;
    final githubUrl = project.githubUrl;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (status != null) ...[
          StatusChip(status: status),
          const SizedBox(height: 8),
        ],
        Text(project.title, style: textTheme.titleLarge),
        const SizedBox(height: 6),
        Text(project.summary, style: textTheme.bodyMedium),
        const SizedBox(height: 12),
        TechTagList(tags: project.technologies),
        const Spacer(),
        const SizedBox(height: 16),
        Row(
          children: [
            if (githubUrl != null)
              OutlinedButton(
                onPressed: () =>
                    openLinkWithFeedback(context, githubUrl, label: 'GitHub'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  minimumSize: const Size(0, 36),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(FontAwesomeIcons.github, size: 14),
                    SizedBox(width: 8),
                    Text('GitHub'),
                  ],
                ),
              ),
            const Spacer(),
            IconButton(
              tooltip: 'View ${project.title} details',
              onPressed: onOpen,
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ],
    );
  }
}
