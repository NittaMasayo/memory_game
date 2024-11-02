import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/web.dart';
import 'package:mneme/business/model/score_model.dart';
import 'package:mneme/presentation/view/common/common_vertical_space.dart';
import 'package:mneme/presentation/view/common/modal.dart';
import 'package:mneme/presentation/view/common/tap_target_circle.dart';
import 'package:mneme/presentation/view/theme/color.dart';
import 'package:mneme/presentation/view/theme/font_style.dart';
import 'package:mneme/presentation/view_model/counter.dart';
import 'package:mneme/presentation/view_model/make_grid.dart';
import 'package:mneme/presentation/view_model/score_preference.dart';
import 'package:mneme/presentation/view_model/target_circle.dart';

class GamePage extends ConsumerWidget {
  final int cellNumber;
  final int challengeNum;
  final List<int> gridArray;
  GamePage(
      {this.cellNumber = 9,
      this.challengeNum = 10,
      required this.gridArray,
      super.key});
  final logger = Logger(filter: null, printer: PrettyPrinter(), output: null);
  final maleGrid = MakeGrid();
  static List<int> answerList = [];
  final modal = CommonModal();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final targetNum = ref.watch(targetCircleProvider);

    void resetBtnFunc() {
      ref.read(counterProvider.notifier).reset();
      ref.read(targetCircleProvider.notifier).reset();
      Navigator.pop(context);
    }

    void showCircleFunc() {
      Timer.periodic(const Duration(milliseconds: 500), (timer) {
        final nowTargetNum = ref.watch(targetCircleProvider);
        if (nowTargetNum >= counter) {
          timer.cancel();
        } else {
          ref.read(targetCircleProvider.notifier).increment();
        }
      });
    }

    void successModal() {
      answerList = [];
      ref.read(scorePreferenceProvider.notifier).setNewScore(
          ScoreModel(cellNumber: cellNumber, challengeNumber: challengeNum));
      modal.showSuccessModal(context, () {
        resetBtnFunc();
      });
    }

    void tapCircleFunc(index) {
      answerList = [...answerList, index];
      bool isFailed = false;
      for (int i = 0; i < answerList.length; i++) {
        if (gridArray[i] != answerList[i]) {
          isFailed = true;
          answerList = [];
          modal.showRetryModal(context, resetBtnFunc);
          break;
        }
      }
      if (isFailed) return;
      if (answerList.length == counter) {
        if (counter >= challengeNum) {
          successModal();
          return;
        }
        answerList = [];
        ref.read(counterProvider.notifier).increment();
        ref.read(targetCircleProvider.notifier).reset();
        showCircleFunc();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("ゲーム"),
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3.0),
          child: Container(
            color: Colors.white.withOpacity(0.2),
            height: 1.0,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.fromLTRB(
            8, MediaQuery.of(context).size.height / 10, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$counter回目",
                  style: FontStyle.primaryText,
                ),
                TextButton(
                    key: const ValueKey("pause"),
                    onPressed: () {
                      modal.showPauseModal(context, resetBtnFunc);
                    },
                    child: Text("一時停止", style: FontStyle.primaryText))
              ],
            ),
            const CommonVerticalSpace(),
            Expanded(
                child: GridView.builder(
                    key: const ValueKey("tapGrid"),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: maleGrid.columnNumber(cellNumber),
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 0),
                    itemCount: cellNumber,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          highlightColor: Colors.white12.withOpacity(0.2),
                          onTap: () {
                            tapCircleFunc(index);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: ColorTheme.textColor)),
                            child: TapTargetCircle(
                                isVisible:
                                    gridArray[targetNum] == index ? 1.0 : 0.0),
                          ));
                    })),
          ],
        ),
      ),
    );
  }
}
