import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memory_game/presentation/view_model/make_order.dart';

class GamePage extends ConsumerWidget {
  final int rowNum;
  final int columnNum;
  const GamePage({this.rowNum = 3, this.columnNum = 3, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final makeArray = MakeOrder(rowNum, columnNum);
    final gridArray = makeArray.makeAnswerArray();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ゲーム"),
      ),
      body: Center(
        child: GridView.builder(
            key: const ValueKey("tapGrid"),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: rowNum,
                childAspectRatio: 1.0,
                crossAxisSpacing: 0),
            itemCount: gridArray.length - 1,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Center(
                  child: Text(gridArray[index].toString()),
                ),
              );
            }),
      ),
    );
  }
}
