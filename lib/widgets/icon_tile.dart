import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class IconTile extends StatelessWidget {
  const IconTile({super.key, required this.icon, this.size = 48});

  final Widget icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.tealTint,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconTheme(data: IconThemeData(color: AppColors.accent, size: size * 0.5), child: icon),
    );
  }
}
