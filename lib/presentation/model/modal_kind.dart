import 'package:flutter/material.dart';
import 'package:memory_game/presentation/view/common/common_vertical_space.dart';
import 'package:memory_game/presentation/view/page/input_page.dart';
import 'package:memory_game/presentation/view/theme/font_style.dart';

enum ModalKind { finishModal, pauseModal, backToInputModal }

extension ModalContentWidget on ModalKind {
  Widget modalInner(void Function() callback, BuildContext context) {
    switch (this) {
      case ModalKind.finishModal:
        return Row(
          key: const ValueKey("finishedBtnRow"),
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: callback,
                child: const Text("もう1回！", style: FontStyle.smallText)),
            const CommonVerticalSpace(),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InputPage(),
                  ));
                },
                child: const Text("設定を変える", style: FontStyle.smallText))
          ],
        );
      case ModalKind.pauseModal:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("再開", style: FontStyle.smallText)),
            const CommonVerticalSpace(),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InputPage(),
                  ));
                },
                child: const Text("設定を変える", style: FontStyle.smallText))
          ],
        );
      case ModalKind.backToInputModal:
        return Row(
          children: [
            TextButton(
                onPressed: () {
                  callback;
                },
                child: const Text("リトライ", style: FontStyle.smallText)),
            const CommonVerticalSpace(),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InputPage(),
                  ));
                },
                child: const Text("戻る", style: FontStyle.smallText))
          ],
        );

      default:
        return const Text("エラーが発生しました", style: FontStyle.smallText);
    }
  }
}
