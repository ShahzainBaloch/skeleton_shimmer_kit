import 'package:flutter/material.dart';
import 'skeleton_scope.dart';

/// Root container that coordinates synchronized shimmering gradient animation
/// across all descendant skeleton bones.
class SkeletonShimmer extends StatefulWidget {
  /// The widget tree containing skeleton placeholders.
  final Widget child;

  /// The dark/muted base background color of the skeleton bones.
  final Color baseColor;

  /// The lighter specular highlight color sweeping across the bones.
  final Color highlightColor;

  /// Duration of one complete shimmer sweep. Defaults to `1400ms`.
  final Duration duration;

  /// Whether the shimmer animation is actively sweeping. Defaults to `true`.
  final bool enabled;

  const SkeletonShimmer({
    super.key,
    required this.child,
    this.baseColor = const Color(0xFFE2E8F0),
    this.highlightColor = const Color(0xFFF8FAFC),
    this.duration = const Duration(milliseconds: 1400),
    this.enabled = true,
  });

  @override
  State<SkeletonShimmer> createState() => _SkeletonShimmerState();
}

class _SkeletonShimmerState extends State<SkeletonShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    if (widget.enabled) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant SkeletonShimmer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled != oldWidget.enabled) {
      if (widget.enabled) {
        _controller.repeat();
      } else {
        _controller.stop();
      }
    }
    if (widget.duration != oldWidget.duration) {
      _controller.duration = widget.duration;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SkeletonScope(
      animation: _controller,
      baseColor: widget.baseColor,
      highlightColor: widget.highlightColor,
      enabled: widget.enabled,
      child: widget.child,
    );
  }
}
