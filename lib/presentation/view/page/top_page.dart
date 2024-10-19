import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memory_game/presentation/view/common/common_vertical_space.dart';
import 'package:memory_game/presentation/view/page/input_page.dart';
import 'package:memory_game/presentation/view/theme/font_style.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ようこそ！",
          style: FontStyle.largeText,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                onPressed: () {},
                child: const Text("遊び方", style: FontStyle.semiLargeText)),
          ],
        ),
      ),
    );
  }
}
