import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memory_game/presentation/view/page/top_page.dart';
import 'package:memory_game/presentation/view/theme/color.dart';
import 'package:memory_game/presentation/view/theme/font_style.dart';

void main() {
  runApp(const ProviderScope(child: MemoryApp()));
}

class MemoryApp extends StatelessWidget {
  const MemoryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '記憶力ゲーム',
      theme: ThemeData(
        primaryColor: ColorTheme.primaryColor,
        scaffoldBackgroundColor: ColorTheme.primaryColor,
        appBarTheme: const AppBarTheme(
            titleTextStyle: FontStyle.largeText,
            titleSpacing: 8.0,
            backgroundColor: ColorTheme.primaryColor,
            centerTitle: true),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorTheme.buttonColor)),
        useMaterial3: true,
      ),
      home: const TopPage(),
    );
  }
}
