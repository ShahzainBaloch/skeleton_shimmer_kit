import 'package:flutter/material.dart';
import 'skeleton_scope.dart';

/// An atomic rectangular or circular skeleton bone primitive that shines with synchronized shimmer.
class SkeletonBone extends StatelessWidget {
  /// Width of the bone placeholder. If null, expands to parent constraints.
  final double? width;

  /// Height of the bone placeholder. Defaults to `16.0`.
  final double? height;

  /// Corner radius of the bone. Defaults to `Radius.circular(8.0)`.
  final BorderRadius? borderRadius;

  /// Geometric shape of the bone. Defaults to [BoxShape.rectangle].
  final BoxShape shape;

  /// Optional override for the base color.
  final Color? baseColor;

  /// Optional override for the highlight color.
  final Color? highlightColor;

  const SkeletonBone({
    super.key,
    this.width,
    this.height = 16.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.shape = BoxShape.rectangle,
    this.baseColor,
    this.highlightColor,
  });

  /// Factory constructor for circular avatar bones.
  const SkeletonBone.circle({
    super.key,
    required double size,
    this.baseColor,
    this.highlightColor,
  })  : width = size,
        height = size,
        borderRadius = null,
        shape = BoxShape.circle;

  @override
  Widget build(BuildContext context) {
    final scope = SkeletonScope.maybeOf(context);

    final effectiveBase = baseColor ?? scope?.baseColor ?? const Color(0xFFE2E8F0);
    final effectiveHighlight =
        highlightColor ?? scope?.highlightColor ?? const Color(0xFFF8FAFC);

    if (scope == null || !scope.enabled) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: effectiveBase,
          shape: shape,
          borderRadius: shape == BoxShape.circle ? null : borderRadius,
        ),
      );
    }

    return AnimatedBuilder(
      animation: scope.animation,
      builder: (context, _) {
        final progress = scope.animation.value;
        final start = (progress * 2.0 - 1.0).clamp(-1.0, 1.0);
        final end = (start + 1.2).clamp(-1.0, 2.0);

        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: shape,
            borderRadius: shape == BoxShape.circle ? null : borderRadius,
            gradient: LinearGradient(
              begin: Alignment(start, 0),
              end: Alignment(end, 0),
              stops: const [0.0, 0.5, 1.0],
              colors: [
                effectiveBase,
                effectiveHighlight,
                effectiveBase,
              ],
            ),
          ),
        );
      },
    );
  }
}
