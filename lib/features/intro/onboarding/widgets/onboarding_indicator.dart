import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';

/// Three-step progress bar: the dot moves start → center → end.
class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppSize.s38.r);
    return Container(
      alignment: switch (index) {
        0 => AlignmentDirectional.centerStart,
        1 => AlignmentDirectional.center,
        _ => AlignmentDirectional.centerEnd,
      },
      width: AppSize.s90.w,
      height: AppSize.s6.h,
      decoration: BoxDecoration(
        borderRadius: radius,
        color: context.indicatorTrackColor,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 30),
        width: AppSize.s30.w,
        height: AppSize.s6.h,
        decoration: BoxDecoration(
          borderRadius: radius,
          color: context.primaryColor,
        ),
      ),
    );
  }
}
