import 'widget_test/game/game_widget.dart';
import 'widget_test/input/input_widget.dart';
import 'widget_test/top/top_widget.dart';

void main() {
  final topPage = TopWidget();
  topPage.main();

  final inputPage = InputWidget();
  inputPage.main();

  final gamePage = GameWidget();
  gamePage.main();
}
