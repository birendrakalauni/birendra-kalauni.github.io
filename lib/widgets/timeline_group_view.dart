import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:birendra_portfolio/models/timeline_group.dart';
import 'package:flutter/material.dart';

class TimelineGroupView extends StatelessWidget {
  const TimelineGroupView({super.key, required this.group});

  final TimelineGroup group;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(group.icon, color: AppColors.accent),
            const SizedBox(width: 12),
            Expanded(
              child: Semantics(
                header: true,
                child: Text(group.title, style: textTheme.titleLarge),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        for (var i = 0; i < group.entries.length; i++)
          _TimelineRow(
            entry: group.entries[i],
            isLast: i == group.entries.length - 1,
          ),
      ],
    );
  }
}

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({required this.entry, required this.isLast});

  final TimelineEntry entry;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 16,
            child: Column(
              children: [
                const SizedBox(height: 6),

                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.accent,
                  ),
                ),
                if (!isLast)
                  Expanded(child: Container(width: 2, color: AppColors.border)),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.title,
                    style: textTheme.titleLarge?.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 4),

                  Text(entry.subtitle, style: textTheme.bodyMedium),

                  const SizedBox(height: 4),

                  Text(
                    entry.period,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.accent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
