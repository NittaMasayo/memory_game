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
      final makeGrid = MakeGrid();
      final result =
          makeGrid.makeAnswerArray(gridNumber: 16, challengeNumber: 20);
      expect(result.contains(17), false);
      expect(result.length, 20);
    });
  });

  group("test answer array same int", () {
    test('前後で同じ数字がないかチェック', () {
      final makeGrid = MakeGrid();
      final result =
          makeGrid.makeAnswerArray(gridNumber: 4, challengeNumber: 10);
      expect(result[result.length - 1], isNot(result[result.length - 2]));
    });
  });
}
