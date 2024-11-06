import 'package:flutter/material.dart';
import 'package:mneme/presentation/view/theme/color.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyle {
  static final primaryText = GoogleFonts.notoSansJp(
      textStyle: const TextStyle(
          color: ColorTheme.textColor,
          fontSize: 14.0,
          decoration: TextDecoration.none));
  static final semiLargeText = GoogleFonts.notoSansJp(
      textStyle: const TextStyle(
          color: ColorTheme.textColor,
          fontSize: 18.0,
          decoration: TextDecoration.none));
  static final largeText = GoogleFonts.notoSansJp(
      textStyle: const TextStyle(
          color: ColorTheme.textColor,
          fontSize: 24.0,
          decoration: TextDecoration.none));
  static final modalTitleText = GoogleFonts.notoSansJp(
      textStyle: const TextStyle(
          color: ColorTheme.textColor,
          fontSize: 36.0,
          decoration: TextDecoration.none));
  static final smallText = GoogleFonts.notoSansJp(
      textStyle: const TextStyle(
          color: ColorTheme.textColor,
          fontSize: 12.0,
          decoration: TextDecoration.none));
  static final dropMenuText = GoogleFonts.notoSansJp(
      textStyle: const TextStyle(
          color: ColorTheme.primaryColor,
          fontSize: 14.0,
          decoration: TextDecoration.none));
}
