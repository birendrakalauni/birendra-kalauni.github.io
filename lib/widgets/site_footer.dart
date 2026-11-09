import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:birendra_portfolio/core/constants/app_info.dart';
import 'package:birendra_portfolio/core/constants/app_links.dart';
import 'package:birendra_portfolio/core/constants/breakpoints.dart';
import 'package:birendra_portfolio/core/utils/url_helper.dart';
import 'package:birendra_portfolio/widgets/responsive_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key, required this.onBackToTop});

  final VoidCallback onBackToTop;

  @override
  Widget build(BuildContext context) {
    final isMobile = Breakpoints.isMobile(MediaQuery.sizeOf(context).width);
    final textTheme = Theme.of(context).textTheme;

    final brand = Text.rich(
      const TextSpan(
        text: 'Birendra ',
        children: [
          TextSpan(
            text: 'Kalauni',
            style: TextStyle(color: AppColors.accent),
          ),
        ],
      ),
      style: textTheme.titleLarge,
    );

    final copyright = Text(
      '© ${DateTime.now().year} ${AppInfo.name}. All rights reserved.',
      textAlign: TextAlign.center,
      style: textTheme.bodyMedium,
    );

    final actions = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          tooltip: 'GitHub',
          onPressed: () =>
              openLinkWithFeedback(context, AppLinks.github, label: 'GitHub'),
          icon: const FaIcon(FontAwesomeIcons.github, size: 20),
        ),

        IconButton(
          tooltip: 'LinkedIn',
          onPressed: () => openLinkWithFeedback(
            context,
            AppLinks.linkedin,
            label: 'LinkedIn',
          ),
          icon: const FaIcon(FontAwesomeIcons.linkedin, size: 20),
        ),

        IconButton(
          tooltip: 'Back to top',
          onPressed: onBackToTop,
          icon: const Icon(Icons.arrow_upward),
        ),
      ],
    );

    return Container(
      width: double.infinity,
      color: AppColors.surface,
      child: ResponsiveContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: isMobile
              ? Column(
                  children: [
                    brand,
                    const SizedBox(height: 12),
                    copyright,
                    const SizedBox(height: 8),
                    actions,
                  ],
                )
              : Row(
                  children: [
                    brand,
                    Expanded(child: Center(child: copyright)),
                    actions,
                  ],
                ),
        ),
      ),
    );
  }
}
