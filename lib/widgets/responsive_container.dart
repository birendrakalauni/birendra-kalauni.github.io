import 'package:birendra_portfolio/core/constants/breakpoints.dart';
import 'package:flutter/material.dart';

class ResponsiveContainer extends StatelessWidget {
  const ResponsiveContainer({super.key, required this.child});

  final Widget child;

  static const double maxContentWidth = 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final horizontalPadding = Breakpoints.isMobile(width)
            ? 16.0
            : Breakpoints.isTablet(width)
            ? 24.0
            : 48.0;

        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: maxContentWidth,
            minWidth: 0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
