import 'dart:async';

class CircleTimer {
  void managerCircle(void Function() callback) {
    Timer(const Duration(milliseconds: 300), () {
      callback;
    });
  }
}
