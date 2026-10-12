import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

import '../widgets/report_tile.dart';

/// Courier totals (placeholder values until the reports API exists).
class DeliveryReportScreen extends StatelessWidget {
  const DeliveryReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          ScreenTitle(LocaleKeys.reports_title.tr()),
          SizedBox(height: AppSize.s50.h, width: double.infinity),
          ReportTile(
            label: LocaleKeys.reports_total_shipments.tr(),
            value: '10000000',
          ),
          SizedBox(height: AppSize.s30.h),
          ReportTile(
            label: LocaleKeys.reports_total_shipping.tr(),
            value: '10000000',
          ),
        ],
      ).withPadding(all: AppSize.screenPadding.w),
    );
  }
}
