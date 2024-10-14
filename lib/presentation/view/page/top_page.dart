import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memory_game/presentation/view/common/common_vertical_space.dart';
import 'package:memory_game/presentation/view/page/game_page.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ようこそ！"),
        leading: const Icon(Icons.settings, color: Colors.white),
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
                      builder: (context) => const GamePage(),
                    ),
                  );
                },
                child: const Text("始める")),
            const CommonVerticalSpace(),
            TextButton(onPressed: () {}, child: const Text("チュートリアル")),
          ],
        ),
      ),
    );
  }
}
