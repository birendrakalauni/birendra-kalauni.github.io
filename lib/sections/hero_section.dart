import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:birendra_portfolio/core/constants/app_links.dart';
import 'package:birendra_portfolio/core/constants/breakpoints.dart';
import 'package:birendra_portfolio/widgets/hero_visual.dart';
import 'package:birendra_portfolio/widgets/responsive_container.dart';
import 'package:birendra_portfolio/widgets/social_link.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onViewProjects,
    required this.onContactMe,
  });

  final VoidCallback onViewProjects;
  final VoidCallback onContactMe;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = Breakpoints.isMobile(width);
        final isTablet = Breakpoints.isTablet(width);

        final text = _HeroText(
          nameSize: isMobile ? 34 : (isTablet ? 46 : 56),
          roleSize: isMobile ? 22 : 28,
          onViewProjects: onViewProjects,
          onContactMe: onContactMe,
        );

        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0.75, -0.2),
              radius: 0.9,
              colors: [AppColors.tealGlow, AppColors.background],
            ),
            border: Border(bottom: BorderSide(color: AppColors.border)),
          ),
          child: ResponsiveContainer(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: isMobile ? 48 : 80),
              child: width < 1100
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text,
                        const SizedBox(height: 40),
                        Center(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 320),
                            child: HeroVisual(),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 6, child: text),
                        const SizedBox(width: 32),
                        Expanded(
                          flex: 5,
                          child: Center(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 440),
                              child: HeroVisual(),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}

class _HeroText extends StatelessWidget {
  const _HeroText({
    required this.nameSize,
    required this.roleSize,
    required this.onViewProjects,
    required this.onContactMe,
  });

  final double nameSize;
  final double roleSize;
  final VoidCallback onViewProjects;
  final VoidCallback onContactMe;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello, I'm",
          style: textTheme.titleLarge?.copyWith(
            color: AppColors.accent,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
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
            style: textTheme.displayLarge?.copyWith(fontSize: nameSize),
            softWrap: true,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Flutter Developer',
          style: textTheme.headlineMedium?.copyWith(
            color: AppColors.accent,
            fontSize: roleSize,
          ),
        ),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 540),
          child: Text(
            'BSc CSIT student and aspiring Flutter developer building mobile '
            'apps with Flutter, Dart, Firebase, GetX, Provider and BLoC. I enjoy '
            'turning ideas into practical applications and learning through '
            'real projects.',
            style: textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton(
              onPressed: onViewProjects,
              child: const _ButtonLabel(
                text: 'View Projects',
                icon: Icons.arrow_forward_ios,
              ),
            ),
            OutlinedButton(
              onPressed: onContactMe,
              child: const _ButtonLabel(
                text: 'Contact Me',
                icon: Icons.mail_outline,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Wrap(
          spacing: 8,
          runSpacing: 4,
          children: [
            SocialLink(
              icon: FontAwesomeIcons.github,
              label: 'GitHub',
              url: AppLinks.github,
            ),
            SocialLink(
              icon: FontAwesomeIcons.linkedin,
              label: 'LinkedIn',
              url: AppLinks.linkedin,
            ),
          ],
        ),
      ],
    );
  }
}

class _ButtonLabel extends StatelessWidget {
  const _ButtonLabel({required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [Text(text), const SizedBox(width: 8), Icon(icon, size: 18)],
    );
  }
}
