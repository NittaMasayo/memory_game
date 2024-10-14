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

    test('Counter increments', () async {
      if (driver != null) {
        final buttonFinder = find.byValueKey('increment');
        await driver!.tap(buttonFinder);

        // カウンターの値を取得して確認する
        final counterTextFinder = find.byValueKey('counter');
        expect(await driver!.getText(counterTextFinder), "1");
      }
    });
  });
}
