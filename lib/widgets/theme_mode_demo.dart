import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:birendra_portfolio/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeModeDemo extends StatelessWidget {
  const ThemeModeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeProvider>().themeMode;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Theme mode: ${themeMode.name}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(width: 12),
          OutlinedButton(
            onPressed: () => context.read<ThemeProvider>().toggleTheme(),
            child: const Text('Toggle'),
          ),
        ],
      ),
    );
  }
}
