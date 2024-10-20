import 'package:flutter/material.dart';
import 'package:mneme/presentation/model/modal_kind.dart';
import 'package:mneme/presentation/view/common/common_vertical_space.dart';
import 'package:mneme/presentation/view/theme/font_style.dart';

class CommonModal {
  void showRetryModal(BuildContext context, void Function() retryFunction) {
    showDialog(
        context: context,
        useSafeArea: false,
        builder: (builder) => Container(
              key: const ValueKey("modal"),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.grey.withOpacity(0.3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("失敗！！", style: FontStyle.modalTitleText),
                  const CommonVerticalSpace(),
                  ModalKind.finishModal.modalInner(retryFunction, context)
                ],
              ),
            ));
  }

  void showPauseModal(BuildContext context, void Function() retryFunction) {
    showDialog(
        context: context,
        useSafeArea: false,
        builder: (builder) => Container(
              key: const ValueKey("modal"),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.grey.withOpacity(0.3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("一時停止中…", style: FontStyle.modalTitleText),
                  const CommonVerticalSpace(),
                  ModalKind.pauseModal.modalInner(retryFunction, context)
                ],
              ),
            ));
  }

  void showSuccessModal(BuildContext context, void Function() retryFunction) {
    showDialog(
        context: context,
        useSafeArea: false,
        builder: (builder) => Container(
              key: const ValueKey("modal"),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.grey.withOpacity(0.3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("成功！！", style: FontStyle.modalTitleText),
                  const CommonVerticalSpace(),
                  ModalKind.finishModal.modalInner(retryFunction, context)
                ],
              ),
            ));
  }
}
