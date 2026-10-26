import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class HeroVisual extends StatelessWidget {
  const HeroVisual({super.key});

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: AspectRatio(
        aspectRatio: 1,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final size = constraints.maxWidth;

            return SizedBox(
              width: size,
              height: size,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: size * 0.86,
                    height: size * 0.86,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.primary,
                          AppColors.primaryDark,
                          AppColors.card,
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(size * 0.40),
                        topRight: Radius.circular(size * 0.20),
                        bottomLeft: Radius.circular(size * 0.22),
                        bottomRight: Radius.circular(size * 0.40),
                      ),
                    ),
                  ),
                  //Profile photo placeholder
                  Container(
                    width: size * 0.56,
                    height: size * 0.56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.card,
                      border: Border.all(color: AppColors.primary, width: 2),
                    ),
                    // child: Icon(
                    //   Icons.person_outline,
                    //   size: size * 0.28,
                    //   color: AppColors.textSecondary,
                    // ),
                    child: ClipOval(
                      child: SizedBox.expand(
                        child: Image.asset(
                          'assets/images/hero_imagee.png',
                          fit: BoxFit.cover,
                          alignment: const Alignment(0, -0.15),
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(
                                Icons.person,
                                size: 64,
                                color: AppColors.textSecondary,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  // Floating badges
                  Positioned(
                    top: size * 0.04,
                    left: size * 0.08,
                    child: _Badge(
                      size: size * 0.20,
                      child: FlutterLogo(size: size * 0.11),
                    ),
                  ),
                  Positioned(
                    bottom: size * 0.06,
                    right: size * 0.06,
                    child: _Badge(
                      size: size * 0.18,
                      child: Icon(
                        Icons.code,
                        size: size * 0.10,
                        color: AppColors.accent,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.size, required this.child});

  final double size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.card,
        border: Border.all(color: AppColors.primary),
      ),
      child: child,
    );
  }
}
