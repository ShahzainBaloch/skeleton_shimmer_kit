import 'package:flutter/material.dart';
import 'skeleton_bone.dart';

/// Pre-built skeleton avatar placeholder.
class SkeletonAvatar extends StatelessWidget {
  final double size;
  final bool isCircle;
  final BorderRadius? borderRadius;

  const SkeletonAvatar({
    super.key,
    this.size = 48.0,
    this.isCircle = true,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    if (isCircle) {
      return SkeletonBone.circle(size: size);
    }
    return SkeletonBone(
      width: size,
      height: size,
      borderRadius: borderRadius ?? BorderRadius.circular(12),
    );
  }
}

/// Pre-built multi-line text paragraph skeleton with organic line lengths.
class SkeletonParagraph extends StatelessWidget {
  /// Number of text lines. Defaults to `3`.
  final int lines;

  /// Vertical spacing between lines. Defaults to `8.0`.
  final double spacing;

  /// Height of each line bone. Defaults to `14.0`.
  final double lineHeight;

  /// Custom fractional width factors for each line (e.g. `[1.0, 0.9, 0.6]`).
  final List<double>? lineFractions;

  const SkeletonParagraph({
    super.key,
    this.lines = 3,
    this.spacing = 8.0,
    this.lineHeight = 14.0,
    this.lineFractions,
  });

  @override
  Widget build(BuildContext context) {
    final fractions = lineFractions ??
        List.generate(lines, (i) {
          if (i == lines - 1) return 0.55;
          if (i.isOdd) return 0.88;
          return 1.0;
        });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(lines, (index) {
        final fraction =
            index < fractions.length ? fractions[index] : 1.0;

        return Padding(
          padding: EdgeInsets.only(bottom: index == lines - 1 ? 0 : spacing),
          child: FractionallySizedBox(
            widthFactor: fraction,
            alignment: Alignment.centerLeft,
            child: SkeletonBone(height: lineHeight),
          ),
        );
      }),
    );
  }
}

/// Pre-built list tile skeleton with leading avatar, title, and subtitle.
class SkeletonListTile extends StatelessWidget {
  final double leadingSize;
  final bool hasLeading;
  final bool hasTrailing;

  const SkeletonListTile({
    super.key,
    this.leadingSize = 48.0,
    this.hasLeading = true,
    this.hasTrailing = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          if (hasLeading) ...[
            SkeletonAvatar(size: leadingSize),
            const SizedBox(width: 14),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                SkeletonBone(height: 16, width: 160),
                SizedBox(height: 8),
                SkeletonBone(height: 12, width: 220),
              ],
            ),
          ),
          if (hasTrailing) ...[
            const SizedBox(width: 12),
            const SkeletonBone(width: 28, height: 28),
          ],
        ],
      ),
    );
  }
}

/// Pre-built card skeleton representing a social post or e-commerce item.
class SkeletonCard extends StatelessWidget {
  final double imageHeight;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;

  const SkeletonCard({
    super.key,
    this.imageHeight = 180.0,
    this.padding = const EdgeInsets.all(16.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(16.0)),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SkeletonBone(
            width: double.infinity,
            height: imageHeight,
            borderRadius: BorderRadius.zero,
          ),
          Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SkeletonBone(width: 140, height: 18),
                SizedBox(height: 10),
                SkeletonParagraph(lines: 2, lineHeight: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
