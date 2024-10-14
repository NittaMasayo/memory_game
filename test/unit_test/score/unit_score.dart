import 'package:flutter_test/flutter_test.dart';
import 'package:memory_game/business/repository/base_repository.dart';
import 'package:memory_game/business/repository/shared_repository.dart';
import 'package:memory_game/presentation/view_model/make_grid.dart';
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

  group("test answer array", () {
    test('マスの数だけ計算結果の数字を作る', () {
      final makeGrid = MakeGrid(gridNumber: 16, challengeNumber: 20);
      final result = makeGrid.makeAnswerArray();
      expect(result.contains(17), false);
      expect(result.length, 20);
    });
  });
}
