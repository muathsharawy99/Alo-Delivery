import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../view_model/bloc/delivery_cubit/delivery_cubit.dart';
import '../../view_model/bloc/delivery_cubit/delivery_state.dart';
import '../components/app_customs/app_bar/custom_appbar.dart';
import '../components/app_customs/color_assets/color_assets.dart';
import '../components/app_customs/delivery_card/normal_order_details.dart';
import '../components/my_customization_widget/custom_text.dart';

class DeliveryOrdersScreen extends StatelessWidget {
  const DeliveryOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeliveryCubit, DeliveryState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DeliveryCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: CustomAppBar(
            showProfile: false,
          ),
          body: Padding(
            padding: EdgeInsetsDirectional.all(
              10.w,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomText(
                    text: "الطلبات المتاحة",
                    fontSize: 25.sp,
                    color: ColorAssets.darkPurple,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                  ),
                  Text(
                    "If Searching",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  LottieBuilder.asset(
                    "assets/lottie_files/searching.json",
                    width: 350.w,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "If There Is Normal Order",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  NormalOrderDetailsCard(
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "If There Isn't Any Orders",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  LottieBuilder.asset(
                    "assets/lottie_files/no_data.json",
                    width: 350.w,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
