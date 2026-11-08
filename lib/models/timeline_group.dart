import 'package:flutter/widgets.dart';

class TimelineEntry {
  final String title;
  final String subtitle;
  final String period;

  const TimelineEntry({
    required this.title,
    required this.subtitle,
    required this.period,
  });
}

class TimelineGroup {
  final String title;
  final IconData icon;
  final List<TimelineEntry> entries;

  const TimelineGroup({
    required this.title,
    required this.icon,
    required this.entries,
  });
}
