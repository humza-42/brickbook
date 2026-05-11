import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';

class BBShimmer extends StatelessWidget {
  final double? width;
  final double? height;
  final double radius;

  const BBShimmer({
    super.key,
    this.width,
    this.height,
    this.radius = AppDim.radiusMd,
  });

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: AppColors.surfaceVariant,
    highlightColor: AppColors.borderLight,
    child: Container(
      width: width,
      height: height ?? 60,
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
  );
}

// Multi-line shimmer for text blocks
class BBTextShimmer extends StatelessWidget {
  final int lines;
  const BBTextShimmer({super.key, this.lines = 3});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: List.generate(lines, (i) => Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: BBShimmer(
        width: i == lines - 1
            ? MediaQuery.of(context).size.width * 0.6
            : double.infinity,
        height: 14,
        radius: 4,
      ),
    )),
  );
}
