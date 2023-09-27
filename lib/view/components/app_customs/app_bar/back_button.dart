import 'dart:math';
import 'package:alo_delivery/view_model/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color_assets/color_assets.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 4,
      child: Material(
        shadowColor: Colors.grey,
        elevation: 3,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10.r,
        ),
        child: InkWell(
          onTap: () {
            if(onTap != null){
              onTap!.call();
            }
            Navigation.goPop(context);
          },
          borderRadius: BorderRadius.circular(
            10.r,
          ),
          child: Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.r,
              ),
              border: Border.all(
                color: Colors.grey,
                width: 2.w,
              ),
            ),
            child: Transform.rotate(
              angle: -pi / 4,
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 30.sp,
                color: ColorAssets.darkerPurple,
                weight: 7.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
