import 'dart:convert';

import 'package:mneme/business/model/score_model.dart';
import 'package:mneme/business/repository/base_repository.dart';

class SharedRepository extends BaseRepository {
  SharedRepository(super.preferences, super.keyName);

  @override
  Future<List<ScoreModel>> getScore() async {
    final list = preferences.getStringList(keyName);
    if (list != null) {
      return list.map((item) => ScoreModel.fromJson(jsonDecode(item))).toList();
    }
    return [];
  }

  @override
  Future<void> resetScore() async {
    preferences.remove(keyName);
  }

  @override
  Future<void> setScore(List<ScoreModel> newScoreList) async {
    List<String> saveScoreData =
        newScoreList.map((score) => jsonEncode(score.toJson())).toList();
    await preferences.setStringList(keyName, saveScoreData);
  }

  // @override
  // Future<int> getScore() async {
  //   return preferences.getInt(keyName) ?? 0;
  // }

  // @override
  // Future<void> setScore(int newScore) async {
  //   preferences.setInt(keyName, newScore);
  // }

  // @override
  // Future<void> resetScore() async {
  //   preferences.remove(keyName);
  // }
}
