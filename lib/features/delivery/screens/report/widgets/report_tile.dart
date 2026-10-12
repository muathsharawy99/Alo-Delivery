import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';

/// One report row: value badge + label.
class ReportTile extends StatelessWidget {
  const ReportTile({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppSize.radiusField.r);
    final textStyle = context.regular.copyWith(fontSize: FontSize.s18);
    return Container(
      width: AppSize.s387.w,
      height: AppSize.s81.h,
      padding: EdgeInsetsDirectional.all(AppSize.s20.w),
      decoration: BoxDecoration(
        color: context.fieldFillColor,
        borderRadius: radius,
        border: Border.all(
          color: context.primaryColor,
          width: AppSize.borderWidth.w,
        ),
      ),
      child: Row(
        children: [
          Container(
            alignment: AlignmentDirectional.center,
            padding: EdgeInsetsDirectional.all(AppSize.s10.w),
            decoration: BoxDecoration(
              color: context.primaryColor,
              borderRadius: radius,
            ),
            child: Text(
              value,
              style: context.bold.copyWith(
                fontSize: FontSize.s18,
                color: context.onPrimary,
              ),
            ),
          ),
          const Spacer(),
          Text(label, style: textStyle),
        ],
      ),
    );
  }
}
