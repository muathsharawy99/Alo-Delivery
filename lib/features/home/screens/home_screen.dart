import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/gen/assets.gen.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

import '../widgets/service_tile.dart';

/// Two services per account type:
/// client → track order / new order, courier → reports / available orders,
/// merchant → (tracking not ready yet) / new order.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.type});

  final UserType type;

  void _onFirstService() {
    switch (type) {
      case UserType.client:
        push(NamedRoutes.clientFollowOrder);
      case UserType.delivery:
        push(NamedRoutes.deliveryReport);
      case UserType.merchant:
        break;
    }
  }

  void _onSecondService() {
    switch (type) {
      case UserType.client:
        push(NamedRoutes.clientMakeOrder);
      case UserType.delivery:
        push(NamedRoutes.deliveryOrders);
      case UserType.merchant:
        push(NamedRoutes.merchantMakeOrder);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: const CustomAppBar(showBack: false, showProfile: true),
      body: SafeArea(
        child: Column(
          children: [
            ScreenTitle(LocaleKeys.home_choose_service.tr()),
            SizedBox(height: AppSize.s30.h, width: double.infinity),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ServiceTile(
                  onTap: _onFirstService,
                  label: type.isDelivery
                      ? LocaleKeys.home_reports.tr()
                      : LocaleKeys.home_follow_order.tr(),
                  imagePath: type.isDelivery
                      ? Assets.images.report.path
                      : Assets.images.tracking.path,
                ),
                ServiceTile(
                  onTap: _onSecondService,
                  label: type.isDelivery
                      ? LocaleKeys.home_available_orders.tr()
                      : LocaleKeys.home_new_order.tr(),
                  imagePath: Assets.images.newOrder.path,
                ),
              ],
            ),
            const Spacer(),
            CustomImage(
              Assets.images.services.path,
              alignment: Alignment.bottomCenter,
              width: AppSize.s488.w,
            ),
          ],
        ),
      ),
    );
  }
}
