import 'package:alo_delivery/view/components/app_customs/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/app_customs/color_assets/color_assets.dart';
import '../components/app_customs/follow_order_container/follow_order_container.dart';
import '../components/my_customization_widget/custom_text.dart';

class ClientFollowOrderScreen extends StatelessWidget {
  const ClientFollowOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showProfile: false),
      body: SafeArea(
        child: Column(
          children: [
            CustomText(
              text: "متابعة طلب",
              fontSize: 25.sp,
              color: ColorAssets.darkPurple,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 30.h,
              width: double.infinity,
            ),
            FollowOrderContainer(),
          ],
        ),
      ),
    );
  }
}
