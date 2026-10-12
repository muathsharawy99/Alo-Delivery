import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';

/// "Continue as …" button: label + role icon.
class RoleButton extends StatelessWidget {
  const RoleButton({
    super.key,
    required this.label,
    required this.iconPath,
    required this.color,
    required this.textColor,
    required this.onPressed,
    this.borderColor,
  });

  final String label;
  final String iconPath;
  final Color color;
  final Color textColor;
  final Color? borderColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onPressed,
      width: AppSize.s312.w,
      height: AppSize.s45.h,
      radius: AppSize.radiusBox.r,
      color: color,
      borderColor: borderColor,
      elevation: AppSize.s0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            label,
            style: context.regular.copyWith(
              fontSize: FontSize.s15,
              color: textColor,
            ),
          ),
          CustomImage(iconPath, height: AppSize.s23.h),
        ],
      ),
    );
  }
}
