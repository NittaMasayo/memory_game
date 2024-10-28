import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mneme/presentation/view/common/common_vertical_space.dart';
import 'package:mneme/presentation/view/page/game_page.dart';
import 'package:mneme/presentation/view/page/top_page.dart';
import 'package:mneme/presentation/view/theme/color.dart';
import 'package:mneme/presentation/view/theme/font_style.dart';
import 'package:mneme/presentation/view_model/counter.dart';
import 'package:mneme/presentation/view_model/make_grid.dart';
import 'package:mneme/presentation/view_model/target_circle.dart';

class InputPage extends ConsumerWidget {
  InputPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final counterTimeNumber = TextEditingController(text: "10");
  final cellNumberController = TextEditingController(text: "9");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ゲーム設定"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            16, MediaQuery.of(context).size.height / 6, 16, 0),
        child: Form(
          key: _formKey,
          child: Column(
            key: const ValueKey("form"),
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("※デフォルトでは9マスで10回挑戦します。", style: FontStyle.smallText),
              const CommonVerticalSpace(size: 8.0),
              Text("マスの数", style: FontStyle.semiLargeText),
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
              const CommonVerticalSpace(size: 32),
              Text("挑戦する回数", style: FontStyle.semiLargeText),
              DropdownMenu(
                key: const ValueKey("challenge"),
                width: MediaQuery.of(context).size.width - 32,
                textStyle: FontStyle.primaryText,
                onSelected: (value) => {counterTimeNumber.text = value},
                inputDecorationTheme:
                    const InputDecorationTheme(fillColor: ColorTheme.textColor),
                initialSelection: counterTimeNumber.text,
                dropdownMenuEntries: const <DropdownMenuEntry>[
                  DropdownMenuEntry(value: "5", label: "5"),
                  DropdownMenuEntry(value: "10", label: "10"),
                  DropdownMenuEntry(value: "15", label: "15"),
                  DropdownMenuEntry(value: "20", label: "20"),
                  DropdownMenuEntry(value: "25", label: "25"),
                  DropdownMenuEntry(value: "30", label: "30"),
                  DropdownMenuEntry(value: "35", label: "35"),
                  DropdownMenuEntry(value: "40", label: "40"),
                  DropdownMenuEntry(value: "45", label: "45"),
                  DropdownMenuEntry(value: "50", label: "50"),
                ],
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
                    child: Text("スタート！", style: FontStyle.largeText)),
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
                    child: Text("TOPへ", style: FontStyle.largeText)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
