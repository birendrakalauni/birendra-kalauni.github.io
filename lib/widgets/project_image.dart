// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ProjectImage extends StatelessWidget {
  const ProjectImage({
    super.key,
    required this.height,
    this.width,
    this.imageAsset,
    this.semanticLabel,
  });
  final double height;
  final double? width;
  final String? imageAsset;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    const placeholder = _ImagePlaceholder();
    final asset = imageAsset?.trim();
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: width,
        height: height,
        color: AppColors.surface,
        child: asset == null || asset.isEmpty
            ? placeholder
            : Image.asset(
                asset,
                fit: BoxFit.contain,
                semanticLabel: semanticLabel,
                errorBuilder: (context, error, stackTrace) => placeholder,
              ),
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.image_outlined, color: AppColors.textSecondary),
          const SizedBox(height: 6),
          Text(
            'Screenshot',
            style: Theme.of(context).textTheme.bodyMedium
                ?.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
