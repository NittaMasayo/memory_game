import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mneme/presentation/view/page/top_page.dart';
import 'package:mneme/presentation/view/theme/color.dart';
import 'package:mneme/presentation/view/theme/font_style.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const ProviderScope(child: MemoryApp()));
}

class MemoryApp extends StatelessWidget {
  const MemoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mneme',
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
