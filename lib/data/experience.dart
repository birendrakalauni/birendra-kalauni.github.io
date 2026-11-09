import 'package:birendra_portfolio/models/timeline_group.dart';
import 'package:flutter/material.dart';

const List<TimelineGroup> experienceGroups = [
  TimelineGroup(
    title: 'Education',
    icon: Icons.school_outlined,
    entries: [
      TimelineEntry(
        title:
            'Bachelor of Science in Computer Science and Information '
            'Technology (BSc CSIT)',
        subtitle: 'Siddhanath Science Campus, Tribhuvan University',
        period: 'December 2022 - Present',
      ),
    ],
  ),

  TimelineGroup(
    title: 'Leadership Experience',
    icon: Icons.groups_outlined,
    entries: [
      TimelineEntry(
        title: 'Social Media Lead',
        subtitle: 'SNSC IT Club - Siddhanath Science Campus',
        period: '2023 - 2024',
      ),
      TimelineEntry(
        title: 'Technical Lead',
        subtitle: 'SNSC IT Club',
        period: '2024 - 2026',
      ),
      TimelineEntry(
        title: 'Executive Member',
        subtitle: 'Code For Change Farwest',
        period: '2024 - 2025',
      ),
    ],
  ),
  TimelineGroup(
    title: 'Training',
    icon: Icons.workspace_premium_outlined,
    entries: [
      TimelineEntry(
        title: 'Flutter Framework Training',
        subtitle: 'Broadway Infosys Pvt. Ltd.',
        period: 'July 2026 - Oct 2026',
      ),
    ],
  ),
];
