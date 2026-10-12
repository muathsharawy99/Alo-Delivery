import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/locale_keys.g.dart';
import '../../extensions/unified_extensions.dart';

/// Rounded tile used to pick an image or show its preview.
class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, required this.onTap, this.child});

  final VoidCallback onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppSize.radiusBox.r);
    return Material(
      shadowColor: context.shadowColor,
      elevation: AppSize.s5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: context.fieldFillColor,
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Container(
          alignment: AlignmentDirectional.center,
          width: AppSize.s88.w,
          height: AppSize.s103.h,
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(
              color: context.primaryColor,
              width: AppSize.borderWidth.w,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

/// "Add image" tile + its preview tile (tap the preview to zoom).
class ImagePickerPair extends StatelessWidget {
  const ImagePickerPair({
    super.key,
    required this.label,
    required this.file,
    required this.onPick,
    this.spacing,
  });

  final String label;
  final File? file;
  final VoidCallback onPick;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    final textStyle = context.regular.copyWith(fontSize: FontSize.s14);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageContainer(
          onTap: onPick,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add_a_photo),
              SizedBox(height: AppSize.s10.h),
              Text(label, textAlign: TextAlign.center, style: textStyle),
            ],
          ),
        ),
        SizedBox(width: spacing ?? AppSize.s15.w),
        ImageContainer(
          onTap: () {
            if (file != null) showImagePreview(file!);
          },
          child: file != null
              ? Image.file(file!, fit: BoxFit.cover)
              : Text(
                  LocaleKeys.static_image_preview.tr(),
                  textAlign: TextAlign.center,
                  style: textStyle,
                ),
        ),
      ],
    );
  }
}

Future<void> showImagePreview(File file) => showAppDialog(
  CupertinoAlertDialog(
    content: InteractiveViewer(
      boundaryMargin: EdgeInsets.zero,
      child: Image.file(file, filterQuality: FilterQuality.high, fit: BoxFit.cover),
    ),
  ),
);
