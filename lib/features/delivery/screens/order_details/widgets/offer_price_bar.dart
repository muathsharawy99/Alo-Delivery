import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

/// Bottom bar: the courier's price + confirm.
class OfferPriceBar extends StatelessWidget {
  const OfferPriceBar({
    super.key,
    required this.controller,
    required this.onConfirm,
    required this.isLoading,
  });

  final TextEditingController controller;
  final VoidCallback onConfirm;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppField(
          controller: controller,
          label: LocaleKeys.order_price.tr(),
          keyboardType: TextInputType.number,
          width: AppSize.s180.w,
          validator: Validator.notEmpty(),
        ),
        const Spacer(),
        AppButton(
          onPressed: onConfirm,
          isLoading: isLoading,
          width: AppSize.s180.w,
          height: AppSize.s70.h,
          title: LocaleKeys.static_confirm.tr(),
        ),
      ],
    ).withPadding(horizontal: AppSize.screenPadding.w);
  }
}
