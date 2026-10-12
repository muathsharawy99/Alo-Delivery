import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color/light_theme_color.dart';

class LightTheme {
  static ThemeData getTheme() {
    final colors = LightThemeColor();
    return ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: colors.primary,
      scaffoldBackgroundColor: colors.scaffoldColor,
      hintColor: colors.hintColor,
      colorScheme: ColorScheme.fromSeed(seedColor: colors.primary),
      textTheme: GoogleFonts.montserratTextTheme(),
    );
  }
}
