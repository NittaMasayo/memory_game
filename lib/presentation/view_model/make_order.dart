import 'dart:math' as math;

class MakeOrder {
  final int rowNumber;
  final int columnNumber;
  MakeOrder(this.rowNumber, this.columnNumber);

  List<int> makeAnswerArray() {
    final result = rowNumber * columnNumber;
    List<int> answerArray = [];
    for (int i = 1; i <= result; i++) {
      final randomNum = math.Random();
      answerArray = [...answerArray, randomNum.nextInt(result)];
    }
    return answerArray;
  }
}
