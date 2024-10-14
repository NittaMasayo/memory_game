import 'package:flutter/material.dart';
import 'package:memory_game/presentation/view/theme/color.dart';

class TapTargetCircle extends StatelessWidget {
  final double isVisible;
  const TapTargetCircle({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      key: const ValueKey("tap_circle"),
      opacity: isVisible,
      duration: const Duration(milliseconds: 300),
      child: const DecoratedBox(
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: ColorTheme.circleColor)),
    );
  }
}
