import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mneme/presentation/view/common/common_vertical_space.dart';
import 'package:mneme/presentation/view/page/top_page.dart';
import 'package:mneme/presentation/view/theme/font_style.dart';
import 'package:mneme/presentation/view_model/high_score.dart';
import 'package:mneme/presentation/view_model/score_preference.dart';

class ScoreListPage extends ConsumerWidget {
  ScoreListPage({super.key});
  final _highScore = HighScore();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ref.watch(scorePreferenceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("スコア一覧"),
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3.0),
          child: Container(
            color: Colors.white.withOpacity(0.2),
            height: 1.0,
          ),
        ),
        leading: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const TopPage()));
            },
            child: Text("戻る", style: FontStyle.smallText)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: score.when(
              data: (data) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CommonVerticalSpace(),
                      Text("最高スコア:${_highScore.getHighScore(data)}",
                          style: FontStyle.semiLargeText),
                      const CommonVerticalSpace(),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 20.0),
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.white, width: 1.0))),
                              child: Text(
                                "${data[index].cellNumber}マスで${data[index].challengeNumber}回",
                                style: FontStyle.semiLargeText,
                              ),
                            );
                          })
                    ],
                  ),
              error: (error, stack) =>
                  const Center(child: Text("エラーが発生しました。お手数ですが開発者に報告してください。")),
              loading: () => const Center(child: CircularProgressIndicator())),
        ),
      ),
    );
  }
}
