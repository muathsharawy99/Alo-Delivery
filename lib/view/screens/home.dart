import 'package:alo_delivery/view/components/app_customs/calling_redirection_card/calling_redirection_card.dart';
import 'package:alo_delivery/view/components/app_customs/delivery_card/normal_order_details.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_svg.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_text.dart';
import 'package:alo_delivery/view/screens/client_make_order.dart';
import 'package:alo_delivery/view/screens/on_boarding.dart';
import 'package:alo_delivery/view_model/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/app_customs/app_bar/custom_appbar.dart';
import '../components/app_customs/color_assets/color_assets.dart';
import '../components/app_customs/delivery_card/normal_delivery_card.dart';
import '../components/app_customs/services_container/services_container.dart';
import '../components/texts/keys.dart';
import 'client_follow_order.dart';
import 'delivery_orders.dart';
import 'delivery_screens/delivery_report.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showProfile: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomText(
              text: "اختر الخدمة",
              fontSize: 25.sp,
              color: ColorAssets.darkPurple,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 30.h,
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ServicesContainer(
                  onTap: () {

                    if (type == ConstKeys.client) {
                      Navigation.goPush(
                        context,
                        ClientFollowOrderScreen(),
                      );
                    }

                    if (type == ConstKeys.delivery) {
                      Navigation.goPush(
                        context,
                        DeliveryReportScreen(),
                      );

                      ///TODO : Merchant LayOut
                    }
                    // if (type == ConstKeys.merchant) {
                    //   Navigation.goPush(
                    //     context,
                    //     ClientMakeOrderScreen(),
                    //   );
                    // }
                  },
                  label: type == ConstKeys.client || type == ConstKeys.merchant
                      ? "متابعة طلب"
                      : "التقارير",
                  path: type == ConstKeys.client || type == ConstKeys.merchant
                      ? "assets/images/tracking.svg"
                      : "assets/images/report.svg",
                ),
                ServicesContainer(
                  onTap: () {
                    if (type == ConstKeys.client) {
                      Navigation.goPush(
                        context,
                        ClientMakeOrderScreen(),
                      );
                    }

                    if (type == ConstKeys.delivery) {
                      Navigation.goPush(
                        context,
                        DeliveryOrdersScreen(),
                      );
                    }

                    ///TODO : Merchant LayOut

                    // if (type == ConstKeys.merchant) {
                    //   Navigation.goPush(
                    //     context,
                    //     ClientMakeOrderScreen(),
                    //   );
                    // }
                  },
                  label: type == ConstKeys.client || type == ConstKeys.merchant
                      ? "طلب جديد"
                      : "الطلبات المتاحة",
                  path: "assets/images/new_order.svg",
                ),
              ],
            ),
            Spacer(),
            SvgAssets(
              alignment: AlignmentDirectional.bottomCenter,
              path: "assets/images/services.svg",
              width: 488.w,
            ),
          ],
        ),
      ),
    );
  }
}
