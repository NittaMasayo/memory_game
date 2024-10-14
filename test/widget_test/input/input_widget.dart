import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memory_game/presentation/view/page/input_page.dart';

class InputWidget {
  void main() {
    testWidgets('input page', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: InputPage(),
          ),
        ),
      ));
      expect(find.byKey(const ValueKey("form")), findsOneWidget);

      expect(find.text("※何も入力しない場合は9マスで10回挑戦することになります。"), findsOneWidget);
      expect(find.text("マスの数"), findsOneWidget);
      expect(find.text("挑戦する回数"), findsOneWidget);

      final cellBox = find.byKey(const ValueKey("cell"));
      await tester.tap(cellBox);
      await tester.pumpAndSettle();

      final dropdownItem = find.text("16").last;
      await tester.tap(dropdownItem);
      expect(find.text("16"), findsAtLeast(2));

      final timeTextBox = find.byKey(const ValueKey("challenge"));
      await tester.enterText(timeTextBox, "11");
      await tester.pumpAndSettle();
      expect(find.text("11"), findsOneWidget);

      final startButton = find.byKey(const ValueKey("start"));
      await tester.tap(startButton);

      await tester.pumpAndSettle();

      final gridItemsFinder = find.byKey(const ValueKey("tapGrid"));
      expect(gridItemsFinder, findsOneWidget);
    });
  }
}