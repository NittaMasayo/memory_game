import 'dart:math' as math;

class MakeGrid {
  List<int> makeAnswerArray({int challengeNumber = 10, int gridNumber = 9}) {
    List<int> answerArray = [];
    for (int i = 1; i <= challengeNumber; i++) {
      final randomNum = math.Random();
      int newInt = randomNum.nextInt(gridNumber);
      if (answerArray.isNotEmpty &&
          newInt == answerArray[answerArray.length - 1]) {
        newInt = randomNum.nextInt(gridNumber);
      }
      answerArray = [...answerArray, newInt];
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
