import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/unified_extensions.dart';

/// Transparent app bar: the diamond back button and / or the profile avatar.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.showBack = true, this.showProfile = false});

  final bool showBack;
  final bool showProfile;

  @override
  Size get preferredSize => Size.fromHeight(AppSize.s80.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      toolbarHeight: AppSize.s80.h,
      leadingWidth: 0,
      automaticallyImplyLeading: false,
      title: showBack
          ? const AppBackButton().withPadding(start: AppSize.s5.w)
          : null,
      actions: [
        if (showProfile)
          const CircleAvatar(
            backgroundImage: NetworkImage(AppConstants.placeholderAvatar),
          ).withPadding(end: AppSize.s20.w),
      ],
    );
  }
}

/// Rotated square back button.
class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppSize.radiusCard.r);
    return Transform.rotate(
      angle: pi / 4,
      child: Material(
        shadowColor: context.shadowColor,
        elevation: AppSize.s3,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: context.surfaceColor,
        borderRadius: radius,
        child: InkWell(
          onTap: () => Navigator.maybePop(context),
          borderRadius: radius,
          child: Container(
            width: AppSize.s50.w,
            height: AppSize.s50.w,
            decoration: BoxDecoration(
              borderRadius: radius,
              border: Border.all(
                color: context.shadowColor,
                width: AppSize.borderWidth.w,
              ),
            ),
            child: Transform.rotate(
              angle: -pi / 4,
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: AppSize.s30.w,
                color: context.primaryDark,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
