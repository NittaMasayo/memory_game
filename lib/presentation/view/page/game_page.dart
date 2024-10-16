import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memory_game/presentation/view/common/tap_target_circle.dart';
import 'package:memory_game/presentation/view/theme/color.dart';
import 'package:memory_game/presentation/view_model/make_grid.dart';
import 'package:memory_game/presentation/view_model/target_circle.dart';

class GamePage extends ConsumerWidget {
  final int cellNumber;
  final int challengeNum;
  const GamePage({this.cellNumber = 9, this.challengeNum = 10, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final makeArray =
        MakeGrid(gridNumber: cellNumber, challengeNumber: challengeNum);
    final gridArray = makeArray.makeAnswerArray();
    final targetNum = ref.watch(targetCircleProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("ゲーム"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  key: const ValueKey("tapGrid"),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: makeArray.columnNumber(cellNumber),
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 0),
                  itemCount: cellNumber,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          if (targetNum - 1 == cellNumber) return;
                          ref.read(targetCircleProvider.notifier).increment();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorTheme.textColor)),
                          child: TapTargetCircle(
                            isVisible:
                                gridArray[targetNum - 1] == index ? 1.0 : 0.0,
                          ),
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
