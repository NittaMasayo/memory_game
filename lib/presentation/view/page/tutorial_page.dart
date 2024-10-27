import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mneme/presentation/view/page/top_page.dart';
import 'package:mneme/presentation/view/theme/color.dart';
import 'package:mneme/presentation/view/theme/font_style.dart';

class TutorialPage extends ConsumerWidget {
  TutorialPage({super.key});

  final pages = [
    PageModel(
        color: ColorTheme.primaryColor,
        imageAssetPath: 'assets/image/select_hard.png',
        title: '難易度を決める',
        body: 'まずマスの数と\n挑戦する回数を選びます。',
        doAnimateImage: false),
    PageModel(
        color: ColorTheme.primaryColor,
        imageAssetPath: 'assets/image/game_page.png',
        title: '円が表示される',
        body: 'マスの中に\n円がランダムに表示されます。',
        doAnimateImage: false),
    PageModel(
        color: ColorTheme.primaryColor,
        imageAssetPath: 'assets/image/challenge.png',
        title: '順番通りにタップ',
        body: '円が表示された順番通りに\nマスをタップしていきましょう。',
        doAnimateImage: false),
    PageModel(
        color: ColorTheme.primaryColor,
        imageAssetPath: 'assets/image/success.png',
        title: 'これを繰り返す',
        body: '選択した回数まで繰り返し\n全て正解すればクリアです。',
        doAnimateImage: false)
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "遊び方",
          style: FontStyle.largeText,
        ),
        automaticallyImplyLeading: false,
      ),
      body: OverBoard(
        key: const ValueKey('tutorial'),
        pages: pages,
        showBullets: true,
        allowScroll: true,
        skipText: 'スキップ',
        nextText: '次へ',
        finishText: 'TOPへ',
        activeBulletColor: Colors.white,
        inactiveBulletColor: Colors.white.withOpacity(0.2),
        skipCallback: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const TopPage(),
          ));
        },
        finishCallback: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const TopPage(),
          ));
        },
      ),
    );
  }
}
