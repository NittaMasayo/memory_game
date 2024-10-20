import 'package:mneme/business/repository/shared_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'score_preference.g.dart';

@riverpod
class ScorePreference extends _$ScorePreference {
  late SharedRepository repository;
  Future<int> _initScore() async {
    final pref = await SharedPreferences.getInstance();
    const scoreKeyName = "score";
    repository = SharedRepository(pref, scoreKeyName);
    return repository.getScore();
  }

  @override
  Future<void> build() {
    return _initScore();
  }

  Future<void> setNewScore(int newScore) {
    return repository.setScore(newScore);
  }
}
