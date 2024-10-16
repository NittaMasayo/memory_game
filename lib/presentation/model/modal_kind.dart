import 'package:flutter/material.dart';
import 'package:memory_game/presentation/view/common/common_vertical_space.dart';
import 'package:memory_game/presentation/view/theme/font_style.dart';

enum ModalKind { finishModal, pauseModal, backToInputModal }

extension ModalContentWidget on ModalKind {
  Widget modalInner(void Function() callback) {
    switch (this) {
      case ModalKind.finishModal:
        return Row(
          children: [
            TextButton(
                onPressed: () {
                  callback;
                },
                child: const Text("リトライ")),
            const CommonVerticalSpace(),
            TextButton(
                onPressed: () {
                  callback;
                },
                child: const Text("戻る"))
          ],
        );
      case ModalKind.pauseModal:
        return Row(
          children: [
            TextButton(
                onPressed: () {
                  callback;
                },
                child: const Text("再開", style: FontStyle.smallText)),
            const CommonVerticalSpace(),
            TextButton(
                onPressed: () {
                  callback;
                },
                child: const Text("リトライ", style: FontStyle.smallText)),
            const CommonVerticalSpace(),
            TextButton(
                onPressed: () {
                  callback;
                },
                child: const Text("戻る", style: FontStyle.smallText))
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
                  callback;
                },
                child: const Text("戻る", style: FontStyle.smallText))
          ],
        );

      default:
        return const Text("エラーが発生しました", style: FontStyle.smallText);
    }
  }
}
