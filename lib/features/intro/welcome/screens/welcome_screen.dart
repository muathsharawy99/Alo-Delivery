import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/gen/assets.gen.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

import '../widgets/role_button.dart';

/// Pick the account type, then register.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.regular.copyWith(color: context.primaryColor);
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomImage(Assets.images.welcome.path, height: AppSize.s400.h),
              Text(
                LocaleKeys.welcome_title.tr(),
                style: titleStyle.copyWith(fontSize: FontSize.s35),
              ),
              SizedBox(height: AppSize.s50.h),
              Text(
                LocaleKeys.welcome_login_as.tr(),
                style: titleStyle.copyWith(fontSize: FontSize.s18),
              ),
              SizedBox(height: AppSize.s30.h, width: double.infinity),
              RoleButton(
                label: LocaleKeys.welcome_client.tr(),
                iconPath: Assets.images.customerIcon.path,
                color: context.primaryColor,
                textColor: context.onPrimary,
                onPressed: () => push(NamedRoutes.clientRegister),
              ),
              SizedBox(height: AppSize.s25.h),
              RoleButton(
                label: LocaleKeys.welcome_delivery.tr(),
                iconPath: Assets.images.deliveryIcon.path,
                color: context.outlinedButtonColor,
                textColor: context.primaryColor,
                borderColor: context.primaryColor,
                onPressed: () => push(NamedRoutes.deliveryRegister),
              ),
              SizedBox(height: AppSize.s25.h),
              RoleButton(
                label: LocaleKeys.welcome_merchant.tr(),
                iconPath: Assets.images.sellerIcon.path,
                color: context.primaryLight,
                textColor: context.defaultTextColor,
                onPressed: () => push(NamedRoutes.merchantRegister),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
