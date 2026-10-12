import 'dart:io';

import 'package:image_picker/image_picker.dart';

class AppImagePicker {
  AppImagePicker._();

  /// One image from the gallery, or null if the user cancels / it fails.
  static Future<File?> pickFromGallery() async {
    try {
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      return picked == null ? null : File(picked.path);
    } catch (_) {
      return null;
    }
  }
}
