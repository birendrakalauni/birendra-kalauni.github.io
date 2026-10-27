import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:birendra_portfolio/core/constants/breakpoints.dart';
import 'package:birendra_portfolio/widgets/responsive_container.dart';
import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.child,
    this.backgroundColor = AppColors.background,
  });

  final Widget child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final isMobile = Breakpoints.isMobile(MediaQuery.sizeOf(context).width);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: const Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: ResponsiveContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: isMobile ? 48 : 80),
          child: child,
        ),
      ),
    );
  }
}
