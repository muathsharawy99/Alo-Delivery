import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/gen/assets.gen.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

import '../../../data/models/delivery_order_model.dart';

class DeliveryOrderCard extends StatelessWidget {
  const DeliveryOrderCard({super.key, required this.order, required this.onTap});

  final DeliveryOrderModel order;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppSize.radiusCard.r);
    final textStyle = context.regular.copyWith(fontSize: FontSize.s15);
    Widget line(String text, int maxLines) => SizedBox(
      width: AppSize.s240.w,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: textStyle,
      ),
    );
    return InkWell(
      onTap: onTap,
      borderRadius: radius,
      child: Container(
        width: AppSize.s376.w,
        padding: EdgeInsetsDirectional.all(AppSize.s24.w),
        decoration: BoxDecoration(
          color: context.surfaceColor,
          borderRadius: radius,
          border: Border.all(
            width: AppSize.s3.w,
            color: context.primaryColor,
          ),
        ),
        child: Row(
          children: [
            CustomImage(
              Assets.images.newOrder.path,
              width: AppSize.s80.w,
              height: AppSize.s80.w,
              fit: BoxFit.cover,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                line(LocaleKeys.order_from_value.tr(args: [order.from]), 2),
                line(LocaleKeys.order_to_value.tr(args: [order.to]), 2),
                line(
                  LocaleKeys.order_description_value.tr(
                    args: [order.description],
                  ),
                  1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
