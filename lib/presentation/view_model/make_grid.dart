import 'dart:math' as math;

class MakeGrid {
  List<int> generateUniqueList(int length, int min, int max) {
    List<int> result = [];
    final randomNum = math.Random();

    for (int i = 0; i < length; i++) {
      int newValue;
      do {
        newValue = randomNum.nextInt(max - min) + min;
      } while (result.isNotEmpty && result.last == newValue);

      result = [...result, newValue];
    }

    return result;
  }

  List<int> makeAnswerArray({int challengeNumber = 10, int gridNumber = 9}) {
    final answerArray = generateUniqueList(challengeNumber, 0, gridNumber);
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
