import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memory_game/presentation/view/common/common_vertical_space.dart';
import 'package:memory_game/presentation/view/page/game_page.dart';
import 'package:memory_game/presentation/view/page/top_page.dart';
import 'package:memory_game/presentation/view/theme/color.dart';
import 'package:memory_game/presentation/view/theme/font_style.dart';
import 'package:memory_game/presentation/view_model/counter.dart';
import 'package:memory_game/presentation/view_model/make_grid.dart';
import 'package:memory_game/presentation/view_model/target_circle.dart';

class InputPage extends ConsumerWidget {
  InputPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final counterTimeNumber = TextEditingController(text: "10");
  final cellNumberController = TextEditingController(text: "9");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ゲーム設定"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            key: const ValueKey("form"),
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("※何も入力しない場合は9マスで10回挑戦することになります。",
                  style: FontStyle.smallText),
              const CommonVerticalSpace(size: 8.0),
              const Text("マスの数", style: FontStyle.semiLargeText),
              DropdownMenu(
                key: const ValueKey("cell"),
                width: MediaQuery.of(context).size.width - 32,
                textStyle: FontStyle.primaryText,
                onSelected: (value) => {cellNumberController.text = value},
                inputDecorationTheme:
                    const InputDecorationTheme(fillColor: ColorTheme.textColor),
                initialSelection: cellNumberController.text,
                dropdownMenuEntries: const <DropdownMenuEntry>[
                  DropdownMenuEntry(value: "4", label: "4"),
                  DropdownMenuEntry(value: "9", label: "9"),
                  DropdownMenuEntry(value: "16", label: "16"),
                  DropdownMenuEntry(value: "25", label: "25"),
                  DropdownMenuEntry(value: "36", label: "36"),
                ],
              ),
              const CommonVerticalSpace(size: 24),
              const Text("挑戦する回数", style: FontStyle.semiLargeText),
              TextField(
                key: const ValueKey("challenge"),
                style: FontStyle.primaryText,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: counterTimeNumber,
              ),
              const CommonVerticalSpace(size: 48),
              Container(
                alignment: Alignment.center,
                child: TextButton(
                    key: const ValueKey("start"),
                    onPressed: () {
                      ref.read(counterProvider.notifier).reset();
                      ref.read(targetCircleProvider.notifier).reset();
                      final makeGrid = MakeGrid();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => GamePage(
                            cellNumber: int.parse(cellNumberController.text),
                            challengeNum: int.parse(counterTimeNumber.text),
                            gridArray: makeGrid.makeAnswerArray(
                                gridNumber:
                                    int.parse(cellNumberController.text),
                                challengeNumber:
                                    int.parse(counterTimeNumber.text)),
                          ),
                        ),
                      );
                    },
                    child: const Text("スタート！", style: FontStyle.largeText)),
              ),
              Container(
                alignment: Alignment.center,
                child: TextButton(
                    key: const ValueKey("toTop"),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TopPage(),
                        ),
                      );
                    },
                    child: const Text("TOPへ", style: FontStyle.largeText)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
