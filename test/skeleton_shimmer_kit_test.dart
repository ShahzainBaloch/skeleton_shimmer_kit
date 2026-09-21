import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skeleton_shimmer_kit/skeleton_shimmer_kit.dart';

void main() {
  testWidgets('SkeletonShimmer renders presets cleanly', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SkeletonShimmer(
            child: Column(
              children: [
                SkeletonAvatar(size: 60),
                SkeletonListTile(),
                SkeletonParagraph(lines: 3),
                SkeletonCard(),
              ],
            ),
          ),
        ),
      ),
    );

    expect(find.byType(SkeletonAvatar), findsNWidgets(2)); // Avatar + ListTile's avatar
    expect(find.byType(SkeletonListTile), findsOneWidget);
    expect(find.byType(SkeletonParagraph), findsNWidgets(2)); // Standalone + Card's paragraph
    expect(find.byType(SkeletonCard), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 200));
  });

  testWidgets('SkeletonBone works standalone without SkeletonShimmer scope',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SkeletonBone(width: 100, height: 20),
        ),
      ),
    );

    expect(find.byType(SkeletonBone), findsOneWidget);
  });
}
