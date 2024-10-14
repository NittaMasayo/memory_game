import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'target_circle.g.dart';

@riverpod
class TargetCircle extends _$TargetCircle {
  @override
  int build() {
    return 1;
  }

  void increment() {
    state = state + 1;
  }

  void reset() {
    state = 0;
  }
}
