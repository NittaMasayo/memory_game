import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mneme/presentation/view/theme/font_style.dart';

class TutorialPage extends ConsumerWidget {
  TutorialPage({super.key});

  final pages = [
    PageModel(
        color: const Color(0xFF0097A7),
        imageAssetPath: 'assets/image/icon.png',
        title: 'Screen 1',
        body: 'Share your ideas with the team',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF536DFE),
        imageAssetPath: 'assets/image/icon.png',
        title: 'Screen 2',
        body: 'See the increase in productivity & output',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF9B90BC),
        imageAssetPath: 'assets/image/icon.png',
        title: 'Screen 3',
        body: 'Connect with the people from different places',
        doAnimateImage: true),
    PageModel.withChild(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child:
              Image.asset('assets/image/icon.png', width: 300.0, height: 300.0),
        ),
        color: const Color(0xFF5886d6),
        doAnimateChild: true)
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
        inactiveBulletColor: Colors.blue,
        skipCallback: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Skip clicked"),
          ));
        },
        finishCallback: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Finish clicked"),
          ));
        },
      ),
    );
  }
}
