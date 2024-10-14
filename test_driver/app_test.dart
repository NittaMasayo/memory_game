import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('My App Integration Test', () {
    FlutterDriver? driver;

    // テストの前にドライバを初期化します
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // テストの後にドライバを閉じます
    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    test('Game Start', () async {
      if (driver != null) {
        final buttonFinder = find.byValueKey('gameStart');
        await driver!.tap(buttonFinder);

        final gridFinder = find.byValueKey('tapGrid');
        expect(gridFinder, true);
      }
    });
  });
}
