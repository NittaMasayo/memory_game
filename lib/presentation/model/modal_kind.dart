import 'package:flutter/material.dart';
import 'package:mneme/presentation/view/common/common_vertical_space.dart';
import 'package:mneme/presentation/view/page/input_page.dart';
import 'package:mneme/presentation/view/theme/font_style.dart';

enum ModalKind { finishModal, pauseModal }

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
                child: Text("もう1回！", style: FontStyle.primaryText)),
            const CommonVerticalSpace(),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => InputPage(),
                      ),
                      (route) => false);
                },
                child: Text("設定を変える", style: FontStyle.primaryText))
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
                child: Text("再開", style: FontStyle.primaryText)),
            const CommonVerticalSpace(),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => InputPage(),
                      ),
                      (route) => false);
                },
                child: Text("設定を変える", style: FontStyle.primaryText))
          ],
        );

      default:
        return Text("エラーが発生しました", style: FontStyle.primaryText);
    }
  }
}
