import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/theme/color/light_theme_color.dart';

extension ContextExtensions on BuildContext {
  /// Route arguments passed with `push(..., arg: {...})`.
  Map<dynamic, dynamic> get arg =>
      (ModalRoute.of(this)?.settings.arguments ?? {}) as Map<dynamic, dynamic>;

  bool get isArabic => locale == const Locale('ar');

  // --- Named styles (Montserrat; default color = defaultTextColor) ---
  TextStyle _style(FontWeight weight) =>
      GoogleFonts.montserrat(fontWeight: weight, color: defaultTextColor);

  TextStyle get regular => _style(FontWeight.w400);
  TextStyle get medium => _style(FontWeight.w500);
  TextStyle get semiBold => _style(FontWeight.w600);
  TextStyle get bold => _style(FontWeight.w700);

  // --- Colors ---
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get primaryDark => LightThemeColor().primaryDark;
  Color get primaryLight => LightThemeColor().primaryLight;
  Color get onPrimary => LightThemeColor().onPrimary;
  Color get surfaceColor => LightThemeColor().surface;
  Color get fieldFillColor => LightThemeColor().fieldFill;
  Color get indicatorTrackColor => LightThemeColor().indicatorTrack;
  Color get outlinedButtonColor => LightThemeColor().outlinedButton;
  Color get defaultTextColor => LightThemeColor().defaultTextColor;
  Color get hintColor => LightThemeColor().hintColor;
  Color get shadowColor => LightThemeColor().shadowColor;
  Color get activeIconColor => LightThemeColor().activeIcon;
  Color get errorColor => LightThemeColor().errorColor;
  Color get successColor => LightThemeColor().successColor;
}
