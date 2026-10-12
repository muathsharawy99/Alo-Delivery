import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';

/// White card with an illustration and a purple label.
class ServiceTile extends StatelessWidget {
  const ServiceTile({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onTap,
  });

  final String imagePath;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppSize.radiusBox.r);
    return Material(
      shadowColor: context.shadowColor,
      elevation: AppSize.s5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: context.surfaceColor,
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Container(
          padding: EdgeInsetsDirectional.all(AppSize.s10.w),
          width: AppSize.s166.w,
          height: AppSize.s207.h,
          decoration: BoxDecoration(borderRadius: radius),
          child: Column(
            children: [
              CustomImage(imagePath, width: AppSize.s70.w).expand(flex: 2),
              Container(
                width: AppSize.s143.w,
                height: AppSize.s38.h,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: context.primaryColor,
                  borderRadius: BorderRadius.circular(AppSize.radiusCard.r),
                ),
                child: Text(
                  label,
                  style: context.regular.copyWith(
                    fontSize: FontSize.s12,
                    color: context.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
