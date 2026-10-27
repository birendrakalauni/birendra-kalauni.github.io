import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:birendra_portfolio/core/constants/breakpoints.dart';
import 'package:birendra_portfolio/data/skills.dart';
import 'package:birendra_portfolio/models/skill_category.dart';
import 'package:birendra_portfolio/widgets/section_container.dart';
import 'package:birendra_portfolio/widgets/section_heading.dart';
import 'package:birendra_portfolio/widgets/skill_card.dart';
import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final columns = Breakpoints.isDesktop(width)
        ? 3
        : Breakpoints.isTablet(width)
        ? 2
        : 1;

    return SectionContainer(
      backgroundColor: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(title: 'Technical Skills'),
          const SizedBox(height: 32),
          _SkillGrid(categories: skillCategories, columns: columns),
        ],
      ),
    );
  }
}

class _SkillGrid extends StatelessWidget {
  const _SkillGrid({required this.categories, required this.columns});

  final List<SkillCategory> categories;
  final int columns;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];

    for (var i = 0; i < categories.length; i += columns) {
      final rowItems = categories.skip(i).take(columns).toList();

      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var j = 0; j < columns; j++) ...[
                if (j > 0) const SizedBox(width: 16),
                Expanded(
                  child: j < rowItems.length
                      ? SkillCard(category: rowItems[j])
                      : const SizedBox.shrink(),
                ),
              ],
            ],
          ),
        ),
      );
      if (i + columns < categories.length) {
        rows.add(const SizedBox(height: 16));
      }
    }
    return Column(children: rows,);
  }
}
