import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mneme/presentation/view/page/tutorial_page.dart';

class TutorialWidget {
  void main() {
    testWidgets('tutorial', (WidgetTester tester) async {
      await tester.pumpWidget(ProviderScope(
          child: MaterialApp(
              home: Scaffold(
        body: TutorialPage(),
      ))));

      expect(find.byKey(const ValueKey('tutorial')), findsAtLeast(1));
    });
  }
}
