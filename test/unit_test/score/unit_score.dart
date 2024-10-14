import 'package:flutter_test/flutter_test.dart';
import 'package:memory_game/business/repository/base_repository.dart';
import 'package:memory_game/business/repository/shared_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('PreferencesRepository Tests', () {
    late BaseRepository preferencesRepository;

    setUp(() async {
      await SharedPreferences.getInstance().then((pref) =>
          {preferencesRepository = SharedRepository(pref, "test_score")});
    });

    test('保存したデータが正しく取得できる', () async {
      await preferencesRepository.setScore(1);
      final result = await preferencesRepository.getScore();
      expect(result, 1);
    });

    test('データを削除する', () async {
      await preferencesRepository.resetScore();
      final result = await preferencesRepository.getScore();
      expect(result, 0);
    });
  });
}
