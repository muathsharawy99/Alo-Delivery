import 'package:alo_delivery/view/components/my_customization_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color_assets/color_assets.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.onTap,
    this.child,
  });

  final VoidCallback onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.grey,
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: ColorAssets.textFieldFill,
      borderRadius: BorderRadius.circular(
        20.r,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          20.r,
        ),
        child: Container(
          alignment: AlignmentDirectional.center,
          width: 88.w,
          height: 103.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20.r,
            ),
            border: Border.all(
              color: ColorAssets.darkPurple,
              width: 2.w,
            ),
          ),
          child: child ??
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add_a_photo,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomText(
                    text: "أضف صورة",
                    fontSize: 14.sp,
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
