import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mneme/presentation/view/common/common_vertical_space.dart';
import 'package:mneme/presentation/view/page/input_page.dart';
import 'package:mneme/presentation/view/page/score_list.dart';
import 'package:mneme/presentation/view/page/tutorial_page.dart';
import 'package:mneme/presentation/view/theme/font_style.dart';
import 'package:mneme/presentation/view_model/score_preference.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ref.watch(scorePreferenceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mneme",
          style: FontStyle.largeText,
        ),
        automaticallyImplyLeading: false,
      ),
      body: score.when(
          data: (data) => Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.fromLTRB(
                    16, MediaQuery.of(context).size.height / 4, 16, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Mneme(ムネメ)へようこそ！", style: FontStyle.largeText),
                    const CommonVerticalSpace(size: 8),
                    Text(
                        data.isNotEmpty
                            ? "最近のスコア:${data.last.cellNumber}マスで${data.last.challengeNumber}回挑戦"
                            : "初めての方は遊び方から確認しましょう！",
                        style: FontStyle.primaryText),
                    const CommonVerticalSpace(size: 32),
                    TextButton(
                        key: const ValueKey("gameStart"),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => InputPage(),
                              ),
                              (route) => false);
                        },
                        child: Text("始める", style: FontStyle.semiLargeText)),
                    const CommonVerticalSpace(),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => TutorialPage(),
                              ),
                              (route) => false);
                        },
                        child: Text("遊び方", style: FontStyle.semiLargeText)),
                    const CommonVerticalSpace(),
                    data.isNotEmpty
                        ? TextButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => ScoreListPage()),
                                  (route) => false);
                            },
                            child:
                                Text("スコア一覧", style: FontStyle.semiLargeText))
                        : const SizedBox.shrink()
                  ],
                ),
              ),
          error: (error, s) => const Center(
                child: Text("エラーが発生しました。お手数ですが開発者に報告してください。"),
              ),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
