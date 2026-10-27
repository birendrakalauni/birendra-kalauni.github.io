import 'package:birendra_portfolio/models/skill_category.dart';
import 'package:birendra_portfolio/widgets/app_card.dart';
import 'package:birendra_portfolio/widgets/icon_tile.dart';
import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({super.key, required this.category});

  final SkillCategory category;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppCard(
      child: Row(
        children: [
          IconTile(icon: category.icon),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.title,
                  style: textTheme.titleLarge?.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(category.skills.join(', '), style: textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
