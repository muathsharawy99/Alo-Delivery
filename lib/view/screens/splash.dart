import 'package:alo_delivery/view/components/my_customization_widget/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/app_customs/color_assets/color_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: ColorAssets.darkPurple,
              radius: 100.r,
              child: SvgAssets(
                path: "assets/images/logo.svg",
                height: 90.h,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: SvgAssets(
              alignment: AlignmentDirectional.bottomCenter,
              path: "assets/images/bottom_splash.svg",
              height: 400.h,
            ),
          ),
        ],
      ),
    );
  }
}
