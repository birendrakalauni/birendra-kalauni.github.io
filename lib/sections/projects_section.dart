import 'package:birendra_portfolio/core/constants/app_links.dart';
import 'package:birendra_portfolio/core/constants/breakpoints.dart';
import 'package:birendra_portfolio/core/utils/url_helper.dart';
import 'package:birendra_portfolio/providers/project_provider.dart';
import 'package:birendra_portfolio/widgets/card_grid.dart';
import 'package:birendra_portfolio/widgets/project_card.dart';
import 'package:birendra_portfolio/widgets/project_filter_chips.dart';
import 'package:birendra_portfolio/widgets/section_container.dart';
import 'package:birendra_portfolio/widgets/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = Breakpoints.isMobile(width);
    final isWide = Breakpoints.isWide(width);

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Expanded(child: SectionHeading(title: 'Featured Projects')),
              if (!isMobile)
                TextButton(
                  onPressed: () => openLinkWithFeedback(
                    context,
                    AppLinks.github,
                    label: 'GitHub',
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('More on GitHub'),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 24),
          const ProjectFilterChips(),
          const SizedBox(height: 24),
          _ProjectGrid(
            columns: isWide ? 3 : (isMobile ? 1 : 2),
            compact: !isWide,
          ),
        ],
      ),
    );
  }
}

class _ProjectGrid extends StatelessWidget {
  const _ProjectGrid({required this.columns, required this.compact});

  final int columns;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final projects = context.watch<ProjectProvider>().filteredProjects;

    if (projects.isEmpty) {
      return Text(
        'No projects match this filter.',
        style: Theme.of(context).textTheme.bodyMedium,
      );
    }
    return CardGrid(
      columns: columns,
      children: [
        for (final project in projects)
          ProjectCard(
            key: ValueKey(project.slug),
            project: project,
            compact: compact,
          ),
      ],
    );
  }
}
