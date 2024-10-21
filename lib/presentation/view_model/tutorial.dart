import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tutorial.g.dart';

@riverpod
class Tutorial extends _$Tutorial {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state = state + 1;
  }

  void reset() {
    state = 1;
  }
}
