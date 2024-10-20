import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    return 1;
  }

  void increment() {
    state = state + 1;
  }

  void reset() {
    state = 1;
  }
}
