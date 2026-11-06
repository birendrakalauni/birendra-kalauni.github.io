import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:birendra_portfolio/core/constants/breakpoints.dart';
import 'package:birendra_portfolio/data/skills.dart';
import 'package:birendra_portfolio/widgets/card_grid.dart';
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
          CardGrid(
            columns: columns,
            children: [
              for (final category in skillCategories)
                SkillCard(category: category),
            ],
          ),
        ],
      ),
    );
  }
}
