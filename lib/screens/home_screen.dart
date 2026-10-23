import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:birendra_portfolio/widgets/theme_mode_demo.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 640),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, I\'m',
                  style: textTheme.titleLarge?.copyWith(
                    color: AppColors.accent,
                  ),
                ),
                const SizedBox(height: 4),
                Text.rich(
                  TextSpan(
                    text: 'Birendra ',
                    children: [
                      TextSpan(
                        text: 'Kalauni',
                        style: TextStyle(color: AppColors.accent),
                      ),
                    ],
                  ),
                  style: textTheme.displayLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Flutter Developer',
                  style: textTheme.headlineMedium?.copyWith(
                    color: AppColors.accent,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'BSc CSIT student and aspiring Flutter developer who enjoys '
                  'building practical applications.',
                  style: textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    FilledButton(
                      onPressed: () {},
                      child: const Text('View Projects'),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Contact Me'),
                    ),
                  ], 
                ),
                const SizedBox(height: 32,),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sample card',
                      style: textTheme.titleLarge,),
                      const SizedBox(height: 4,),
                      Text('Cards use the card color, a subtle border, and rounded corners.',
                      style: textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),)
                    ],
                  ),
                ),
                const SizedBox(height: 24,),
                const ThemeModeDemo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
