// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:birendra_portfolio/core/utils/url_helper.dart';
import 'package:birendra_portfolio/widgets/icon_tile.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.url,
  });

  final Widget icon;
  final String label;
  final String value;
  final String? url;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final link = url;

    final content = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Row(
        children: [
          IconTile(icon: icon, size: 44),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: textTheme.bodyMedium),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    if (link == null) return content;

    return Tooltip(
      message: 'Open $label',
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => openLinkWithFeedback(context, link, label: label),
          child: content,
        ),
      ),
    );
  }
}
