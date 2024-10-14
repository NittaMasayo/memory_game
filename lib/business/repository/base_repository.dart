import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseRepository {
  final SharedPreferences preferences;
  final String keyName;
  BaseRepository(this.preferences, this.keyName);
  Future<int> getScore();
  Future<void> setScore(int newScore);
  Future<void> resetScore();
}
