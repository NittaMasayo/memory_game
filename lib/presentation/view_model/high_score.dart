import 'package:mneme/business/model/score_model.dart';

class HighScore {
  String getHighScore(List<ScoreModel> list) {
    ScoreModel highScore = list.first;
    for (ScoreModel data in list) {
      if (data.cellNumber * data.challengeNumber >
          highScore.cellNumber * highScore.challengeNumber) {
        highScore = data;
      }
    }
    return "${highScore.cellNumber}マスで${highScore.challengeNumber}回";
  }
}
