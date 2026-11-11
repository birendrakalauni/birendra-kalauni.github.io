import 'package:flutter/material.dart';

class CardGrid extends StatelessWidget {
  const CardGrid({
    super.key,
    required this.children,
    required this.columns,
    this.spacing = 16,
  });

  final List<Widget> children;
  final int columns;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];

    for (var i = 0; i < children.length; i += columns) {
      final rowItems = children.skip(i).take(columns).toList();

      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var j = 0; j < columns; j++) ...[
                if (j > 0) SizedBox(width: spacing),
                Expanded(
                  child: j < rowItems.length
                      ? rowItems[j]
                      : const SizedBox.shrink(),
                ),
              ],
            ],
          ),
        ),
      );

      if (i + columns < children.length) {
        rows.add(SizedBox(height: spacing));
      }
    }
    return Column(children: rows);
  }
}
