import 'dart:developer';

import 'package:alo_delivery/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension StringContext on String {
  /// `#55348B` / `55348B` → [Color] (used by `Model.colorFromJson`).
  Color get color {
    try {
      String colorStr = replaceAll("#", "");
      if (colorStr.length == 6) {
        colorStr = "FF$colorStr";
      }
      return Color(int.parse(colorStr, radix: 16));
    } catch (e) {
      log('Error parsing color: $e');
      return Colors.transparent;
    }
  }
}

class Validator {
  Validator._();

  /// Required field; [messageKey] is a `LocaleKeys` key.
  static String? Function(String?) notEmpty([
    String messageKey = LocaleKeys.validations_empty_field,
  ]) {
    return (value) =>
        (value == null || value.trim().isEmpty) ? messageKey.tr() : null;
  }

  /// Required + at least 11 digits (login).
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validations_empty_phone.tr();
    }
    if (value.length < 11) return LocaleKeys.validations_phone_invalid.tr();
    return null;
  }

  static String? password(String? value) {
    if ((value ?? '').trim().length < 8) {
      return LocaleKeys.validations_password_min.tr();
    }
    return null;
  }

  static String? Function(String?) confirmPassword(
    TextEditingController password,
  ) {
    return (value) {
      final error = Validator.password(value);
      if (error != null) return error;
      if (value != password.text) {
        return LocaleKeys.validations_password_match.tr();
      }
      return null;
    };
  }
}
