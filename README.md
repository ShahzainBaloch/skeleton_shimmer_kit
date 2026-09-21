# skeleton_shimmer_kit

A comprehensive skeleton loading kit for Flutter with synchronized shimmer animations, pre-built layout presets, and custom bone primitives.

[![pub package](https://img.shields.io/pub/v/skeleton_shimmer_kit.svg)](https://pub.dev/packages/skeleton_shimmer_kit)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

---

## ✨ Features

- 🔄 **Synchronized Shimmering**: All skeleton bones across the screen shimmer in unison via a unified ambient controller.
- 📦 **Pre-built Presets**: Instantly render `SkeletonListTile`, `SkeletonCard`, `SkeletonAvatar`, and `SkeletonParagraph`.
- 🦴 **Primitive Bones**: Build any custom skeleton screen with flexible `SkeletonBone` boxes and circles.
- 🎨 **Theme & Dark Mode Ready**: Fully customize `baseColor`, `highlightColor`, and sweep durations.
- 🧹 **Zero External Dependencies**: Pure Flutter SDK implementation.

---

## 🚀 Getting Started

Add `skeleton_shimmer_kit` to your `pubspec.yaml`:

```yaml
dependencies:
  skeleton_shimmer_kit: ^1.0.0
```

Import the package:

```dart
import 'package:skeleton_shimmer_kit/skeleton_shimmer_kit.dart';
```

---

## 💡 Quick Example

### Using Pre-built Presets

```dart
SkeletonShimmer(
  child: ListView(
    children: const [
      SkeletonListTile(),
      SkeletonParagraph(lines: 3),
      SkeletonCard(),
    ],
  ),
)
```

### Custom Skeleton Bones

```dart
SkeletonShimmer(
  baseColor: Colors.grey.shade300,
  highlightColor: Colors.grey.shade100,
  child: Row(
    children: [
      SkeletonBone.circle(size: 48),
      const SizedBox(width: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SkeletonBone(width: 140, height: 16),
          SizedBox(height: 8),
          SkeletonBone(width: 200, height: 12),
        ],
      ),
    ],
  ),
)
```

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Author
Created by [Shahzain Baloch](https://github.com/ShahzainBaloch).
