import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:birendra_portfolio/core/constants/app_info.dart';
import 'package:birendra_portfolio/core/constants/breakpoints.dart';
import 'package:birendra_portfolio/widgets/app_card.dart';
import 'package:birendra_portfolio/widgets/icon_tile.dart';
import 'package:birendra_portfolio/widgets/section_container.dart';
import 'package:birendra_portfolio/widgets/section_heading.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Breakpoints.isDesktop(MediaQuery.sizeOf(context).width);

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(title: 'About Me'),
          const SizedBox(height: 32),
          if (isDesktop)
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 6, child: _AboutText()),
                SizedBox(width: 48),
                Expanded(flex: 4, child: _EducationCard()),
              ],
            )
          else ...const [_AboutText(), SizedBox(height: 32), _EducationCard()],
        ],
      ),
    );
  }
}

class _AboutText extends StatelessWidget {
  const _AboutText();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bodyStyle = theme.textTheme.bodyLarge?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 720),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'I\'m a BSc CSIT student at Siddhanath Science Campus '
            '(Tribhuvan University), and an aspiring Flutter Developer. '
            'I enjoy building applications, learning new technologies, and '
            'improving through practical development work.',
            style: bodyStyle,
          ),
          const SizedBox(height: 16),
          Text(
            'My interests include mobile application development, responsive '
            'Ui design, and Firebase integration.',
            style: bodyStyle,
          ),
          const SizedBox(height: 24),
          const Wrap(
            spacing: 24,
            runSpacing: 12,
            children: [
              _InfoItem(
                icon: Icons.location_on_outlined,
                text: AppInfo.location,
              ),
              _InfoItem(icon: Icons.mail_outline, text: AppInfo.email),
              _InfoItem(icon: Icons.phone_outlined, text: AppInfo.phone)
              
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: AppColors.accent),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium
                ?.copyWith(color: AppColors.textPrimary),
          ),
        ),
      ],
    );
  }
}

class _EducationCard extends StatelessWidget {
  const _EducationCard();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const IconTile(icon: Icons.school_outlined),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('BSc CSIT', style: textTheme.titleLarge),
                const SizedBox(height: 6),
                Text('Tribhuvan University', style: textTheme.bodyMedium),
                Text(
                  'Siddhanath Science Campus, Mahendranagar',
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(height: 6),
                Text('December 2022 - Present', style: textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
