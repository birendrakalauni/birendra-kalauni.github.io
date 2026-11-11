import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:birendra_portfolio/models/project_model.dart';
import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.status});

  final ProjectStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.tealTint,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        status.label,
        style: Theme.of(context).textTheme.labelLarge
            ?.copyWith(fontSize: 12, color: AppColors.accent),
      ),
    );
  }
}
