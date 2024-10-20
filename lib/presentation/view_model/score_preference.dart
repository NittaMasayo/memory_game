import 'package:mneme/business/repository/base_repository.dart';
import 'package:mneme/business/repository/shared_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'score_preference.g.dart';

@riverpod
class ScorePreference extends _$ScorePreference {
  BaseRepository? repository;
  Future<int> _initScore() async {
    final pref = await SharedPreferences.getInstance();
    const scoreKeyName = "score";
    repository = SharedRepository(pref, scoreKeyName);
    if (repository != null) {
      return repository!.getScore();
    }
    return 0;
  }

  @override
  Future<int> build() {
    return _initScore();
  }

  Future<void> setNewScore(int newScore) async {
    if (repository != null) {
      repository!.setScore(newScore);
    }
  }
}
