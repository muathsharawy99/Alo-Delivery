import 'package:alo_delivery/view/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../view_model/navigation/navigation.dart';
import '../../my_customization_widget/custom_button.dart';
import '../../my_customization_widget/custom_svg.dart';
import '../../my_customization_widget/custom_text.dart';
import '../color_assets/color_assets.dart';
import 'indicator.dart';

class OnBoardBanner extends StatelessWidget {
  final String text;
  final String imagePath;
  final int index;

  const OnBoardBanner({
    super.key,
    required this.text,
    required this.imagePath,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70.h,
        ),
        Container(
          width: 277.w,
          height: 397.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              150.r,
            ),
            border: Border.all(
              color: ColorAssets.darkPurple,
              width: 2.w,
            ),
          ),
          child: SvgAssets(
            path: imagePath,
            height: 238.h,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Indicator(index: index),
        SizedBox(
          height: 30.h,
        ),
        Expanded(
          child: CustomText(
            text: text,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 25.sp,
            textAlign: TextAlign.center,
          ),
        ),
        if (index == 2)
          Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              CustomButton(
                onPressed: () {
                  Navigation.goPushAndReplacement(
                    context,
                    WelcomeScreen(),
                  );
                },
                width: 331.w,
                height: 56.h,
                bGColor: ColorAssets.darkPurple,
                radius: 8.r,
                child: CustomText(
                  text: "سجل الآن",
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
