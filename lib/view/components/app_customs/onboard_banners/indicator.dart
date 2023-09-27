import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color_assets/color_assets.dart';

class Indicator extends StatelessWidget {
  final int? index;

  const Indicator({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: index == 0
          ? AlignmentDirectional.topEnd
          : index == 1
              ? AlignmentDirectional.center
              : AlignmentDirectional.bottomStart,
      width: 90.w,
      height: 6.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          38.r,
        ),
        color: ColorAssets.indicatorFill,
      ),
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 30,
        ),
        width: 30.w,
        height: 6.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            38.r,
          ),
          color: ColorAssets.darkPurple,
        ),
      ),
    );
  }
}
