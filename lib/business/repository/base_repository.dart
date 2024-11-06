import 'package:mneme/business/model/score_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseRepository {
  final SharedPreferences preferences;
  final String keyName;
  BaseRepository(this.preferences, this.keyName);
  Future<List<ScoreModel>> getScore();
  Future<void> setScore(List<ScoreModel> newScoreList);
  Future<void> resetScore();
}
