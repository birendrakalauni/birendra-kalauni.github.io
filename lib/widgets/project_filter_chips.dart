import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:birendra_portfolio/providers/project_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectFilterChips extends StatelessWidget {
  const ProjectFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectProvider>(
      builder: (context, provider, child) {
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _FilterChip(
              label: 'All',
              selected: provider.selectedFilter == null,
              onSelected: () =>
                  context.read<ProjectProvider>().selectFilter(null),
            ),

            for (final filter in ProjectProvider.filters)
              _FilterChip(
                label: filter,
                selected: provider.selectedFilter == filter,
                onSelected: () =>
                    context.read<ProjectProvider>().selectFilter(filter),
              ),
          ],
        );
      },
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onSelected(),
      showCheckmark: false,
      backgroundColor: AppColors.card,
      selectedColor: AppColors.primary,
      side: BorderSide(color: selected ? AppColors.primary : AppColors.border),
      shape: const StadiumBorder(),
      labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: selected ? AppColors.onPrimary : AppColors.textPrimary,
      ),
    );
  }
}
