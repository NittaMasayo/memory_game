import 'package:flutter/cupertino.dart';

class CommonVerticalSpace extends StatelessWidget {
  final double size;
  const CommonVerticalSpace({super.key, this.size = 16});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}
