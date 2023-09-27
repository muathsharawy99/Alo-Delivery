import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app_customs/color_assets/color_assets.dart';
import 'custom_text.dart';

void showMyDialog({
  required String titleString,
  required String text,
  required BuildContext context,
}) =>
    showAdaptiveDialog(
      context: context,
      builder: (v) => CupertinoAlertDialog(
        title: CustomText(
          text: titleString,
          fontSize: 20.sp,
          color: Colors.black,
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: text,
              fontSize: 15.sp,
              color: Colors.black,
            ),
            SizedBox(
              width: 8.w,
            ),
            Icon(
              Icons.warning_amber_rounded,
              color: ColorAssets.darkPurple,
            ),
          ],
        ),
      ),
      barrierDismissible: true,
    );
