import 'package:flutter/material.dart';

/// Provides ambient shimmer animation progress and theme tokens to all descendant skeleton bones.
class SkeletonScope extends InheritedWidget {
  /// The synchronized animation driving all child bones.
  final Animation<double> animation;

  /// The dark/muted base color of the skeleton bones.
  final Color baseColor;

  /// The lighter specular highlight color sweeping across the bones.
  final Color highlightColor;

  /// Whether the shimmer animation is actively sweeping.
  final bool enabled;

  const SkeletonScope({
    super.key,
    required this.animation,
    required this.baseColor,
    required this.highlightColor,
    required this.enabled,
    required super.child,
  });

  static SkeletonScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SkeletonScope>();
  }

  static SkeletonScope of(BuildContext context) {
    final scope = maybeOf(context);
    assert(scope != null,
        'No SkeletonScope or SkeletonShimmer found in context. Wrap your widgets with SkeletonShimmer.');
    return scope!;
  }

  @override
  bool updateShouldNotify(covariant SkeletonScope oldWidget) {
    return oldWidget.animation != animation ||
        oldWidget.baseColor != baseColor ||
        oldWidget.highlightColor != highlightColor ||
        oldWidget.enabled != enabled;
  }
}
