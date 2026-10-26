import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:birendra_portfolio/core/utils/url_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLink extends StatelessWidget {
  const SocialLink({
    super.key,
    required this.icon,
    required this.label,
    required this.url,
  });

  final FaIconData icon;
  final String label;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Open $label in a new tab',
      child: TextButton.icon(
        onPressed: () async {
          final opened = await openExternalUrl(url);

          if (!opened && context.mounted) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Could not open $label')));
          }
        },
        icon: FaIcon(icon, size: 18),
        label: Text(label),
        style: TextButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          textStyle: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
