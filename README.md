# skeleton_shimmer_kit 💀✨

A comprehensive skeleton loading kit for Flutter featuring synchronized shimmer animations, atomic bone primitives, and pre-built layout presets for instant, fluid placeholder states.

Designed to replace harsh loading spinners with content-informed, Facebook/LinkedIn-style skeleton screens.

[![pub package](https://img.shields.io/pub/v/skeleton_shimmer_kit.svg)](https://pub.dev/packages/skeleton_shimmer_kit)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

---

## ✨ Features

- 🌊 **Synchronized Shimmering Gradient:** Single coordinated controller sweeps specular highlights seamlessly across all child bones in unison.
- 🧱 **Atomic Bone Primitives:** Build arbitrary complex skeleton layouts using `SkeletonBone` and `SkeletonBone.circle`.
- 📦 **Ready-to-Use Layout Presets:** Instant placeholders for avatars, multi-line paragraphs, list tiles, and e-commerce cards.
- 🎨 **Deep Theming Support:** Configure base skeleton tones, highlight bloom colors, cycle duration, and corner radiuses.
- 🌓 **Dark Mode Ready:** Easily switch between light paper palettes and sleek dark mode charcoal gradients.
- ⚡ **Zero External Dependencies:** Built strictly using Flutter core rendering primitives for lightweight performance.

---

## 📦 Installation

Add `skeleton_shimmer_kit` to your `pubspec.yaml`:

```yaml
dependencies:
  skeleton_shimmer_kit: ^1.0.1
```

Or install it via terminal:

```bash
flutter pub add skeleton_shimmer_kit
```

Import the package in your Dart code:

```dart
import 'package:skeleton_shimmer_kit/skeleton_shimmer_kit.dart';
```

---

## 🚀 Usage Examples

### 1. Social Feed List Loading State

```dart
SkeletonShimmer(
  baseColor: const Color(0xFFE2E8F0),
  highlightColor: const Color(0xFFF8FAFC),
  child: ListView.separated(
    itemCount: 5,
    separatorBuilder: (_, __) => const Divider(height: 1),
    itemBuilder: (context, index) {
      return const SkeletonListTile(
        leadingSize: 52,
        hasLeading: true,
        hasTrailing: true,
      );
    },
  ),
)
```

---

### 2. E-Commerce Product Card Placeholder

```dart
SkeletonShimmer(
  baseColor: const Color(0xFFF1F5F9),
  highlightColor: Colors.white,
  duration: const Duration(milliseconds: 1200),
  child: GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.72,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    itemCount: 4,
    itemBuilder: (context, index) {
      return const SkeletonCard(
        imageHeight: 160,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      );
    },
  ),
)
```

---

### 3. Custom Profile Header with Atomic Bones

```dart
SkeletonShimmer(
  baseColor: const Color(0xFF1E293B), // Sleek Dark Mode
  highlightColor: const Color(0xFF334155),
  child: Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        const SkeletonBone.circle(size: 68),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SkeletonBone(width: 150, height: 20),
              SizedBox(height: 10),
              SkeletonParagraph(
                lines: 2,
                spacing: 6,
                lineHeight: 12,
                lineFractions: [0.95, 0.65],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
)
```

---

## 🛠️ API Reference

### `SkeletonShimmer`

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `child` | `Widget` | **Required** | The widget subtree containing skeleton bones and presets. |
| `baseColor` | `Color` | `Color(0xFFE2E8F0)` | Base muted background tone for all bones in scope. |
| `highlightColor` | `Color` | `Color(0xFFF8FAFC)` | Specular highlight band passing through the shimmer. |
| `duration` | `Duration` | `1400ms` | Duration of one full sweep cycle across the subtree. |
| `enabled` | `bool` | `true` | Whether the shimmer animation is sweeping or static. |

### `SkeletonBone`

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `width` | `double?` | `null` | Bone width (fills available width if null). |
| `height` | `double?` | `16.0` | Bone height. |
| `borderRadius` | `BorderRadius?` | `circular(8.0)` | Corner rounding of rectangular bone. |
| `shape` | `BoxShape` | `BoxShape.rectangle` | Shape (`rectangle` or `circle`). |
| `baseColor` | `Color?` | `null` | Optional local override for scope's base color. |
| `highlightColor` | `Color?` | `null` | Optional local override for scope's highlight color. |

### Layout Presets

| Component | Key Properties | Description |
| :--- | :--- | :--- |
| `SkeletonAvatar` | `size`, `isCircle`, `borderRadius` | Avatar bone placeholder with circular or rounded corners. |
| `SkeletonParagraph` | `lines`, `spacing`, `lineHeight`, `lineFractions` | Multi-line text block with organic staggered line widths. |
| `SkeletonListTile` | `leadingSize`, `hasLeading`, `hasTrailing` | Classic list row with avatar, title bar, and subtitle bar. |
| `SkeletonCard` | `imageHeight`, `padding`, `borderRadius` | Elevated media/product card placeholder with image & text. |

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Author
Created by [Shahzain Baloch](https://github.com/ShahzainBaloch).
