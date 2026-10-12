import 'package:flutter/material.dart';

import 'base_color.dart';

/// Alo Delivery palette (purple #55348B).
class LightThemeColor extends BaseColor {
  // ── Brand
  @override
  Color get primary => const Color(0xFF55348B);
  @override
  Color get primaryDark => const Color(0xFF1E232C);
  @override
  Color get primaryLight => const Color(0xFFB8B7F0);
  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  // ── Surfaces
  @override
  Color get scaffoldColor => const Color(0xFFFFFFFF);
  @override
  Color get surface => const Color(0xFFFFFFFF);
  @override
  Color get fieldFill => const Color(0xFFF7F8F9);
  @override
  Color get indicatorTrack => const Color(0xFFEBEBEB);
  @override
  Color get outlinedButton => const Color(0xB3FFFFFF);

  // ── Text & icons
  @override
  Color get defaultTextColor => const Color(0xFF000000);
  @override
  Color get hintColor => const Color(0xFF9E9E9E);
  @override
  Color get shadowColor => const Color(0xFF9E9E9E);
  @override
  Color get activeIcon => const Color(0xFF2196F3);

  // ── Status
  @override
  Color get errorColor => const Color(0xFFF44336);
  @override
  Color get successColor => const Color(0xFF4CAF50);

  // ── Toast
  @override
  Color get toastColor => const Color(0xFF1E232C);
  @override
  Color get toastSuccessDot => const Color(0xFF4CAF50);
  @override
  Color get toastErrorDot => const Color(0xFFF44336);
  @override
  Color get toastShadow => const Color(0x4D1E232C);
}
