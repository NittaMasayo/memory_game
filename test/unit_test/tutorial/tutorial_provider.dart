import 'package:flutter_test/flutter_test.dart';
import 'package:mneme/presentation/view_model/tutorial.dart';

import '../common/container.dart';

void main() {
  test('tutorial test', () {
    final container = createContainer();

    expect(
      container.read(tutorialProvider),
      equals(0),
    );
  });
}
