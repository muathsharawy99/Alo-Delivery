import 'package:flutter/material.dart';

abstract class BaseColor {
  // Brand
  Color get primary;
  Color get primaryDark;
  Color get primaryLight;
  Color get onPrimary;

  // Surfaces
  Color get scaffoldColor;
  Color get surface;
  Color get fieldFill;
  Color get indicatorTrack;
  Color get outlinedButton;

  // Text & icons
  Color get defaultTextColor;
  Color get hintColor;
  Color get shadowColor;
  Color get activeIcon;

  // Status
  Color get errorColor;
  Color get successColor;

  // Toast
  Color get toastColor;
  Color get toastSuccessDot;
  Color get toastErrorDot;
  Color get toastShadow;
}
