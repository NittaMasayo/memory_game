import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mneme/presentation/view/theme/font_style.dart';
import 'package:mneme/presentation/view_model/score_preference.dart';

class ScoreListPage extends ConsumerWidget {
  const ScoreListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ref.watch(scorePreferenceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("スコア一覧"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: score.when(
              data: (data) => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.white, width: 1.0))),
                      child: Text(
                        "${data[index].cellNumber}マスで${data[index].challengeNumber}回",
                        style: FontStyle.semiLargeText,
                      ),
                    );
                  }),
              error: (error, stack) =>
                  const Center(child: Text("エラーが発生しました。お手数ですが開発者に報告してください。")),
              loading: () => const Center(child: CircularProgressIndicator())),
        ),
      ),
    );
  }
}
