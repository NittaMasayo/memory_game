import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memory_game/presentation/view/page/game_page.dart';

class GameWidget {
  void main() {
    testWidgets('game page', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: GamePage(),
          ),
        ),
      ));

      final gridItemsFinder = find.byKey(const ValueKey("tapGrid"));
      expect(gridItemsFinder, findsOneWidget);

      final gestureNum = find.byType(GestureDetector);
      expect(gestureNum, findsAtLeastNWidgets(9));

      final circle = find.byKey(const ValueKey("tap_circle"));
      expect(circle, findsAtLeastNWidgets(1));
    });
  }
}
