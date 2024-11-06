import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mneme/presentation/view/page/input_page.dart';

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

      expect(find.text("※デフォルトでは9マスで10回挑戦します。"), findsOneWidget);
      expect(find.text("マスの数"), findsOneWidget);
      expect(find.text("挑戦する回数"), findsOneWidget);

      final cellBox = find.byKey(const ValueKey("cell"));
      await tester.tap(cellBox);
      await tester.pumpAndSettle();

      final dropdownItem = find.text("16").last;
      await tester.tap(dropdownItem, warnIfMissed: false);
      expect(find.text("16"), findsAtLeast(2));

      await tester.tap(find.text("16").first, warnIfMissed: false);
      await tester.pumpAndSettle();

      final timeTextBox = find.byKey(const ValueKey("challenge"));
      await tester.tap(timeTextBox, warnIfMissed: false);
      expect(find.text("10"), findsAtLeast(2));

      await tester.tap(find.text("10").first, warnIfMissed: false);
      await tester.pumpAndSettle();

      final startButton = find.byKey(const ValueKey("start"));
      await tester.tap(startButton);

      await tester.pumpAndSettle();

      final gridItemsFinder = find.byKey(const ValueKey("tapGrid"));
      expect(gridItemsFinder, findsOneWidget);
    });
  }
}
