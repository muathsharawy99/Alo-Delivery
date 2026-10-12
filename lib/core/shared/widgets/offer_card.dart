import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/locale_keys.g.dart';
import '../../extensions/unified_extensions.dart';

/// A courier's price offer (placeholder data until the offers API is wired).
class OfferCard extends StatelessWidget {
  const OfferCard({super.key, this.onAccept, this.onReject});

  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  @override
  Widget build(BuildContext context) {
    final textStyle = context.regular.copyWith(fontSize: FontSize.s15);
    final buttonStyle = context.bold.copyWith(fontSize: FontSize.s13);
    return Container(
      width: AppSize.s376.w,
      height: AppSize.s193.h,
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: AppSize.s100.w,
                height: AppSize.s100.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(AppConstants.placeholderAvatar),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: AppSize.s220.w,
                    child: Text(
                      LocaleKeys.offer_name.tr(),
                      overflow: TextOverflow.ellipsis,
                      style: textStyle,
                    ),
                  ),
                  SizedBox(height: AppSize.s15.h),
                  SizedBox(
                    width: AppSize.s220.w,
                    child: Text(
                      LocaleKeys.offer_price.tr(),
                      overflow: TextOverflow.ellipsis,
                      style: textStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              AppButton(
                onPressed: onReject ?? () {},
                height: AppSize.s40.h,
                width: AppSize.s130.w,
                radius: AppSize.radiusBox.r,
                color: context.fieldFillColor,
                borderColor: context.primaryColor,
                elevation: AppSize.s0,
                child: Text(
                  LocaleKeys.offer_reject.tr(),
                  style: buttonStyle.copyWith(color: context.primaryColor),
                ),
              ),
              const Spacer(),
              AppButton(
                onPressed: onAccept ?? () {},
                height: AppSize.s40.h,
                width: AppSize.s130.w,
                radius: AppSize.radiusBox.r,
                elevation: AppSize.s0,
                child: Text(
                  LocaleKeys.offer_accept.tr(),
                  style: buttonStyle.copyWith(color: context.onPrimary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
