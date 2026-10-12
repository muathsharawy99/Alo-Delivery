import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/gen/assets.gen.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

/// Searching for couriers / contact us (offers list not wired yet).
class ClientOrderResultScreen extends StatelessWidget {
  const ClientOrderResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.all(AppSize.screenPadding.w),
        child: Column(
          children: [
            ScreenTitle(LocaleKeys.order_result.tr()),
            SizedBox(height: AppSize.s50.h, width: double.infinity),
            Text(LocaleKeys.order_if_searching.tr(), style: context.regular),
            SizedBox(height: AppSize.s10.h),
            Lottie.asset(
              Assets.lottieFiles.searching.path,
              width: AppSize.s350.w,
            ),
            SizedBox(height: AppSize.s30.h),
            Text(LocaleKeys.order_if_cars.tr(), style: context.regular),
            SizedBox(height: AppSize.s50.h),
            Text(LocaleKeys.order_if_no_cars.tr(), style: context.regular),
            SizedBox(height: AppSize.s10.h),
            const ContactUsCard(),
            SizedBox(height: AppSize.s20.h),
          ],
        ),
      ),
    );
  }
}
