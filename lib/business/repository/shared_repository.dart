import 'package:mneme/business/repository/base_repository.dart';

class SharedRepository extends BaseRepository {
  SharedRepository(super.preferences, super.keyName);

  @override
  Future<int> getScore() async {
    return preferences.getInt(keyName) ?? 0;
  }

  @override
  Future<void> setScore(int newScore) async {
    preferences.setInt(keyName, newScore);
  }

  @override
  Future<void> resetScore() async {
    preferences.remove(keyName);
  }
}
