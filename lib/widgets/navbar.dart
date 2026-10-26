import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:birendra_portfolio/core/constants/portfolio_section.dart';
import 'package:birendra_portfolio/widgets/responsive_container.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key, required this.onItemSelected});

  final ValueChanged<PortfolioSection> onItemSelected;

  static const double height = 72;
  static const double fullNavigationMinWidth = 1200;

  @override
  Size get preferredSize => const Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final showFullNavigation =
            constraints.maxWidth >= fullNavigationMinWidth;

        return Container(
          height: height,
          decoration: const BoxDecoration(
            color: AppColors.background,
            border: Border(
              bottom: BorderSide(color: AppColors.border),
            ),
          ),
          child: ResponsiveContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: _Logo(
                    onTap: () => onItemSelected(PortfolioSection.home),
                  ),
                ),
                
                if (showFullNavigation)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (final section in PortfolioSection.values)
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: TextButton(
                            onPressed: () => onItemSelected(section),
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.textSecondary,
                              textStyle: textTheme.labelLarge,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                            ),
                            child: Text(section.label),
                          ),
                        ),
                    ],
                  )
                else
                  Builder(
                    builder: (scaffoldContext) => IconButton(
                      tooltip: 'Open menu',
                      onPressed: () {
                        Scaffold.of(scaffoldContext).openEndDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 8,
        ),
        child: Text.rich(
          const TextSpan(
            text: 'Birendra ',
            children: [
              TextSpan(
                text: 'Kalauni',
                style: TextStyle(color: AppColors.accent),
              ),
            ],
          ),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
