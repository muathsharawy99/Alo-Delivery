import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/locale_keys.g.dart';
import '../../extensions/unified_extensions.dart';
import '../../utils/url_opener.dart';

/// Shown when no courier is available: call or WhatsApp support.
class ContactUsCard extends StatelessWidget {
  const ContactUsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.bold.copyWith(fontSize: FontSize.s18);
    final buttonStyle = context.bold.copyWith(fontSize: FontSize.s13);
    return Container(
      width: AppSize.s376.w,
      height: AppSize.s350.h,
      padding: EdgeInsetsDirectional.all(AppSize.s24.w),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(AppSize.radiusCard.r),
        border: Border.all(
          width: AppSize.s3.w,
          color: context.primaryColor,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            LocaleKeys.contact_unavailable.tr(),
            overflow: TextOverflow.ellipsis,
            style: titleStyle,
          ),
          Text(
            LocaleKeys.contact_call_us.tr(),
            overflow: TextOverflow.ellipsis,
            style: titleStyle,
          ),
          SizedBox(height: AppSize.s20.h),
          AppButton(
            onPressed: () => UrlOpener.call(AppConstants.supportPhone),
            height: AppSize.s40.h,
            width: AppSize.s140.w,
            radius: AppSize.radiusBox.r,
            color: context.fieldFillColor,
            borderColor: context.primaryColor,
            elevation: AppSize.s0,
            child: Row(
              children: [
                Icon(Icons.phone, color: context.primaryColor),
                SizedBox(width: AppSize.s10.w),
                Text(
                  LocaleKeys.contact_call_now.tr(),
                  style: buttonStyle.copyWith(color: context.primaryColor),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSize.s20.h),
          Text(
            LocaleKeys.contact_or_whatsapp.tr(),
            overflow: TextOverflow.ellipsis,
            style: titleStyle,
          ),
          SizedBox(height: AppSize.s20.h),
          AppButton(
            onPressed: () => UrlOpener.whatsapp(AppConstants.supportWhatsapp),
            height: AppSize.s40.h,
            width: AppSize.s160.w,
            radius: AppSize.radiusBox.r,
            color: context.successColor,
            elevation: AppSize.s0,
            child: Row(
              children: [
                CustomImage(
                  Assets.images.whatsappIcon.path,
                  height: AppSize.s25.h,
                ),
                SizedBox(width: AppSize.s10.w),
                Text(
                  LocaleKeys.contact_whatsapp.tr(),
                  style: buttonStyle.copyWith(color: context.onPrimary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
