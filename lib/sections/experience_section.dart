import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:birendra_portfolio/core/constants/breakpoints.dart';
import 'package:birendra_portfolio/data/experience.dart';
import 'package:birendra_portfolio/widgets/section_container.dart';
import 'package:birendra_portfolio/widgets/timeline_group_view.dart';
import 'package:flutter/widgets.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Breakpoints.isDesktop(MediaQuery.sizeOf(context).width);
    final groups = [
      for (final group in experienceGroups) TimelineGroupView(group: group),
    ];

    return SectionContainer(
      backgroundColor: AppColors.surface,
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < groups.length; i++) ...[
                  if (i > 0) const SizedBox(width: 40),
                  Expanded(child: groups[i]),
                ],
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < groups.length; i++) ...[
                  if (i > 0) const SizedBox(height: 40),
                  groups[i],
                ],
              ],
            ),
    );
  }
}
