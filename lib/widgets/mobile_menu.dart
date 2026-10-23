import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:birendra_portfolio/core/constants/portfolio_section.dart';
import 'package:flutter/material.dart';

class MobileMenu extends StatelessWidget {
  const MobileMenu({super.key, required this.onItemSelected});

  final ValueChanged<PortfolioSection> onItemSelected;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Text(
                'Menu',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const Divider(),
            for (final section in PortfolioSection.values)
              ListTile(
                title: Text(section.label),
                onTap: () {
                  Scaffold.of(context).closeEndDrawer();
                  onItemSelected(section);
                },
              ),
          ],
        ),
      ),
    );
  }
}
