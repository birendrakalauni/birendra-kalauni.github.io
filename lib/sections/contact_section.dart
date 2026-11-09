import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:birendra_portfolio/core/constants/app_info.dart';
import 'package:birendra_portfolio/core/constants/app_links.dart';
import 'package:birendra_portfolio/core/constants/breakpoints.dart';
import 'package:birendra_portfolio/core/utils/url_helper.dart';
import 'package:birendra_portfolio/widgets/app_card.dart';
import 'package:birendra_portfolio/widgets/contact_item.dart';
import 'package:birendra_portfolio/widgets/section_container.dart';
import 'package:birendra_portfolio/widgets/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Breakpoints.isDesktop(MediaQuery.sizeOf(context).width);

    return SectionContainer(
      child: isDesktop
          ? const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 6, child: _ContactDetails()),
                SizedBox(width: 48),
                Expanded(flex: 4, child: _LetsBuildPanel()),
              ],
            )
          : const _ContactDetails(),
    );
  }
}

class _ContactDetails extends StatelessWidget {
  const _ContactDetails();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 560),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(title: 'Get In Touch'),
          const SizedBox(height: 20),
          Text(
            'Feel free to reach out for collaborations, opportunities, or '
            'just to say hello!',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          const ContactItem(
            icon: Icon(Icons.mail_outline),
            label: 'Email',
            value: AppInfo.email,
            url: AppLinks.email,
          ),
          
          const ContactItem(
            icon: Icon(Icons.phone_outlined),
            label: 'Phone',
            value: AppInfo.phone,
            url: AppLinks.phone,
          ),

          const ContactItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'Location',
            value: AppInfo.location,
          ),
          ContactItem(
            icon: FaIcon(FontAwesomeIcons.linkedin),
            label: 'LinkedIn',
            value: 'linkedin.com/in/birendra-kalauni-297139261/',
            url: AppLinks.linkedin,
          ),
           ContactItem(
            icon: FaIcon(FontAwesomeIcons.github),
            label: 'GitHub',
            value: 'github.com/birendrakalauni',
            url: AppLinks.github,
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              FilledButton(
                onPressed: () => openLinkWithFeedback(
                  context,
                  AppLinks.email,
                  label: 'email app',
                ),
                child: const Text('Send an Email'),
              ),

              OutlinedButton(
                onPressed: () => openLinkWithFeedback(
                  context,
                  AppLinks.linkedin,
                  label: 'LinkedIn',
                ),
                child: const Text('Connect on LinkedIn'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LetsBuildPanel extends StatelessWidget {
  const _LetsBuildPanel();

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: AppCard(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.send_outlined, size: 44, color: AppColors.accent),
            const SizedBox(height: 20),
            Text(
              "Let's build something great together!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
