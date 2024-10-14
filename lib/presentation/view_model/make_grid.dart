import 'dart:math' as math;

class MakeGrid {
  final int challengeNumber;
  final int gridNumber;
  MakeGrid({this.challengeNumber = 10, this.gridNumber = 9});

  List<int> makeAnswerArray() {
    List<int> answerArray = [];
    for (int i = 1; i <= challengeNumber; i++) {
      final randomNum = math.Random();
      answerArray = [...answerArray, randomNum.nextInt(gridNumber)];
    }
    return answerArray;
  }

  int columnNumber(int rowNumber) {
    switch (rowNumber) {
      case 4:
        return 2;

      case 9:
        return 3;

      case 16:
        return 4;

      case 25:
        return 5;

      case 36:
        return 6;

      default:
        return 3;
    }
  }
}
