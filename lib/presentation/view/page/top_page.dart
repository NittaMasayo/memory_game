import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mneme/presentation/view/common/common_vertical_space.dart';
import 'package:mneme/presentation/view/page/input_page.dart';
import 'package:mneme/presentation/view/page/tutorial_page.dart';
import 'package:mneme/presentation/view/theme/font_style.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mneme",
          style: FontStyle.largeText,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(
            16, MediaQuery.of(context).size.height / 4, 16, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Mneme(ムネメ)へようこそ！", style: FontStyle.largeText),
            const CommonVerticalSpace(size: 32),
            TextButton(
                key: const ValueKey("gameStart"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => InputPage(),
                    ),
                  );
                },
                child: const Text("始める", style: FontStyle.semiLargeText)),
            const CommonVerticalSpace(),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TutorialPage(),
                  ));
                },
                child: const Text("遊び方", style: FontStyle.semiLargeText)),
          ],
        ),
      ),
    );
  }
}
