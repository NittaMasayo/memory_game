import 'package:mneme/business/model/score_model.dart';
import 'package:mneme/business/repository/base_repository.dart';
import 'package:mneme/business/repository/shared_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'score_preference.g.dart';

@riverpod
class ScorePreference extends _$ScorePreference {
  BaseRepository? repository;
  final scoreKeyName = "score";
  Future<List<ScoreModel>> _fetchScore() async {
    final pref = await SharedPreferences.getInstance();
    repository = SharedRepository(pref, scoreKeyName);
    if (repository != null) {
      return await repository!.getScore();
    }
    return [];
  }

  @override
  Future<List<ScoreModel>> build() {
    return _fetchScore();
  }

  Future<void> setNewScore(ScoreModel newScore) async {
    state = await AsyncValue.guard(() async {
      final newData = await _fetchScore();
      if (repository == null) {
        final pref = await SharedPreferences.getInstance();
        repository = SharedRepository(pref, scoreKeyName);
      }
      repository!.setScore([...newData, newScore]);
      return _fetchScore();
    });
  }
}
