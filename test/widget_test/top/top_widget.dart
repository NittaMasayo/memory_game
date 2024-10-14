import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:memory_game/main.dart';

class TopWidget {
  void main() {
    testWidgets('top page', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MemoryApp());
      expect(find.text('チュートリアル'), findsOneWidget);

      // Verify that our counter starts at 0.
      expect(find.text('始める'), findsOneWidget);
      final startButton = find.text("始める");
      await tester.tap(startButton);

      await tester.pumpAndSettle();

      final gridItemsFinder = find.byKey(const ValueKey("tapGrid"));
      expect(gridItemsFinder, findsOneWidget);
    });
  }
}
