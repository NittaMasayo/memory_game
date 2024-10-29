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
  Future<List<ScoreModel>> _initScore() async {
    final pref = await SharedPreferences.getInstance();
    repository = SharedRepository(pref, scoreKeyName);
    if (repository != null) {
      return await repository!.getScore();
    }
    return [];
  }

  @override
  Future<List<ScoreModel>> build() {
    return _initScore();
  }

  Future<void> setNewScore(ScoreModel newScore) async {
    List<ScoreModel> scoreList = [newScore];
    if (state.hasValue) {
      scoreList = [...state.value!, newScore];
    }
    if (scoreList.length > 50) {
      scoreList.removeLast();
    }
    final pref = await SharedPreferences.getInstance();
    repository = SharedRepository(pref, scoreKeyName);
    if (repository != null) {
      repository!.setScore(scoreList);
      state = await AsyncValue.guard(() async {
        return await repository!.getScore();
      });
    }
  }
}
