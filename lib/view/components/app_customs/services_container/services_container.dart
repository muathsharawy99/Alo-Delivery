import 'package:alo_delivery/view/components/my_customization_widget/custom_svg.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color_assets/color_assets.dart';

class ServicesContainer extends StatelessWidget {
  const ServicesContainer({
    super.key,
    required this.path,
    required this.label,
    required this.onTap,
  });

  final String path;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.grey,
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white,
      borderRadius: BorderRadius.circular(
        20.r,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          20.r,
        ),
        child: Container(
          padding: EdgeInsetsDirectional.all(
            10.w,
          ),
          width: 166.w,
          height: 207.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20.r,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: SvgAssets(
                  path: path,
                  width: 70.w,
                ),
              ),
              Container(
                width: 143.w,
                height: 38.h,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: ColorAssets.darkPurple,
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                ),
                child: CustomText(
                  text: label,
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
