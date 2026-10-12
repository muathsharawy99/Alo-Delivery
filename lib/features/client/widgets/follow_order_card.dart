import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/gen/assets.gen.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

/// Order header; tap to show / hide its delivery steps (shown by default).
class FollowOrderCard extends StatefulWidget {
  const FollowOrderCard({super.key, required this.description});

  final String description;

  @override
  State<FollowOrderCard> createState() => _FollowOrderCardState();
}

class _FollowOrderCardState extends State<FollowOrderCard> {
  bool collapsed = false;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppSize.radiusField.r);
    final textStyle = context.regular.copyWith(
      fontSize: FontSize.s18,
      color: context.primaryColor,
    );
    final time = DateFormat('d-M-y\nh:m:s | a', 'en').format(DateTime.now());
    final header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomImage(Assets.images.packageIcon.path, width: AppSize.s35.w),
        Text(
          widget.description,
          style: textStyle.copyWith(fontSize: FontSize.s15),
        ),
      ],
    );
    return Material(
      borderRadius: radius,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: context.fieldFillColor,
      child: InkWell(
        onTap: () => setState(() => collapsed = !collapsed),
        borderRadius: radius,
        child: Container(
          width: AppSize.s406.w,
          padding: EdgeInsetsDirectional.all(AppSize.s15.w),
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(
              color: context.primaryColor,
              width: AppSize.borderWidth.w,
            ),
          ),
          child: collapsed
              ? header
              : Column(
                  children: [
                    header,
                    SizedBox(height: AppSize.s15.h),
                    Stepper(
                      physics: const NeverScrollableScrollPhysics(),
                      elevation: AppSize.s0,
                      currentStep: 3,
                      controlsBuilder: (context, details) =>
                          const SizedBox.shrink(),
                      steps: [
                        for (final step in [
                          LocaleKeys.order_step_on_the_way_to_you,
                          LocaleKeys.order_step_received,
                          LocaleKeys.order_step_on_the_way,
                          LocaleKeys.order_step_delivered,
                        ])
                          Step(
                            title: Text(step.tr(), style: textStyle),
                            content: Text(
                              time,
                              textAlign: TextAlign.center,
                              style: textStyle,
                            ),
                            isActive: true,
                          ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
