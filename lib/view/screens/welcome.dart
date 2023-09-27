import 'package:alo_delivery/view/components/my_customization_widget/custom_button.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_svg.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_text.dart';
import 'package:alo_delivery/view/screens/client_screens/client_register.dart';
import 'package:alo_delivery/view/screens/delivery_register.dart';
import 'package:alo_delivery/view_model/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/app_customs/color_assets/color_assets.dart';
import 'merchant_screens/merchant_register.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SvgAssets(
              path: "assets/images/welcome.svg",
              height: 400.h,
            ),
            CustomText(
              text: "مرحبا !",
              fontSize: 35.sp,
              color: ColorAssets.darkPurple,
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomText(
              text: "الدخول ك",
              fontSize: 18.sp,
              color: ColorAssets.darkPurple,
            ),
            SizedBox(
              height: 30.h,
              width: double.infinity,
            ),
            CustomButton(
              width: 312.w,
              height: 45.h,
              radius: 20.r,
              bGColor: ColorAssets.darkPurple,
              elevation: 0,
              onPressed: () {
                Navigation.goPush(
                  context,
                  ClientRegisterScreen(),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    text: "عميل",
                    fontSize: 15.sp,
                    color: Colors.white,
                  ),
                  SvgAssets(
                    path: "assets/images/customer_icon.svg",
                    height: 23.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            CustomButton(
              width: 312.w,
              height: 45.h,
              radius: 20.r,
              bGColor: Colors.white70,
              borderColor: ColorAssets.darkPurple,
              strokeAlign: BorderSide.strokeAlignInside,
              borderWidth: 3.w,
              elevation: 0,
              onPressed: () {
                Navigation.goPush(
                  context,
                  DeliveryRegisterScreen(),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    text: "دليفرى",
                    fontSize: 15.sp,
                    color: ColorAssets.darkPurple,
                  ),
                  SvgAssets(
                    path: "assets/images/delivery_icon.svg",
                    height: 23.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            CustomButton(
              width: 312.w,
              height: 45.h,
              radius: 20.r,
              bGColor: ColorAssets.normalPurple,
              elevation: 0,
              onPressed: () {
                Navigation.goPush(
                  context,
                  MerchantRegisterScreen(),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    text: "تاجر",
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                  SvgAssets(
                    path: "assets/images/seller_icon.svg",
                    height: 23.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
