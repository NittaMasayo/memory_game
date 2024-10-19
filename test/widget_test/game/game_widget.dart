import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memory_game/presentation/view/page/game_page.dart';

class GameWidget {
  void modalWidget() {
    testWidgets('game page modal', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: GamePage(gridArray: const [0, 1, 2, 3]),
          ),
        ),
      ));

      final pauseBtn = find.byKey(const ValueKey("pause"));
      await tester.tap(pauseBtn);
      await tester.pumpAndSettle();

      final modal = find.byKey(const ValueKey("modal"));
      expect(modal, findsAtLeastNWidgets(1));
    });
  }

  void main() {
    testWidgets('game page', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: GamePage(gridArray: const [0, 1, 2, 3]),
          ),
        ),
      ));

      final gridItemsFinder = find.byKey(const ValueKey("tapGrid"));
      expect(gridItemsFinder, findsOneWidget);

      final gestureNum = find.byType(GestureDetector);
      expect(gestureNum, findsAtLeastNWidgets(4));

      final circle = find.byKey(const ValueKey("tap_circle"));
      expect(circle, findsAtLeastNWidgets(1));
    });

    modalWidget();
  }
}
