import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/unified_extensions.dart';

/// Rounded elevated button. With [title] it is the main purple action
/// (331 × 56, bold white text); pass [child] for custom content.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    this.title,
    this.child,
    this.color,
    this.borderColor,
    this.width,
    this.height,
    this.radius,
    this.elevation,
    this.isLoading = false,
  });

  final VoidCallback? onPressed;
  final String? title;
  final Widget? child;
  final Color? color;
  final Color? borderColor;
  final double? width, height, radius, elevation;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? AppSize.s331.w,
      height: height ?? AppSize.s56.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? context.primaryColor,
          disabledBackgroundColor: color ?? context.primaryColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              radius ?? AppSize.radiusField.r,
            ),
            side: borderColor == null
                ? BorderSide.none
                : BorderSide(
                    color: borderColor!,
                    width: AppSize.borderWidth.w,
                  ),
          ),
        ),
        child: isLoading
            ? CustomProgress(size: AppSize.s24.w, color: context.onPrimary)
            : child ??
                  Text(
                    title ?? '',
                    style: context.bold.copyWith(
                      fontSize: FontSize.s15,
                      color: context.onPrimary,
                    ),
                  ),
      ),
    );
  }
}
