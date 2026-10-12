import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

import 'onboarding_indicator.dart';

class OnboardingBanner extends StatelessWidget {
  const OnboardingBanner({
    super.key,
    required this.text,
    required this.imagePath,
    required this.currentIndex,
    required this.onRegister,
  });

  final String text;
  final String imagePath;

  /// The page being shown (drives the indicator and the last-page button).
  final int currentIndex;
  final VoidCallback onRegister;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s70.h),
        Container(
          width: AppSize.s277.w,
          height: AppSize.s397.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s150.r),
            border: Border.all(
              color: context.primaryColor,
              width: AppSize.borderWidth.w,
            ),
          ),
          child: CustomImage(imagePath, height: AppSize.s238.h),
        ),
        SizedBox(height: AppSize.s30.h),
        OnboardingIndicator(index: currentIndex),
        SizedBox(height: AppSize.s30.h),
        Text(
          text,
          textAlign: TextAlign.center,
          style: context.bold.copyWith(fontSize: FontSize.s25),
        ).expand(),
        if (currentIndex == 2)
          AppButton(
            onPressed: onRegister,
            title: LocaleKeys.onboarding_register_now.tr(),
          ).withPadding(top: AppSize.s30.h),
      ],
    );
  }
}
