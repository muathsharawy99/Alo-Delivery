import 'package:alo_delivery/view_model/bloc/delivery_cubit/delivery_cubit.dart';
import 'package:alo_delivery/view_model/bloc/delivery_cubit/delivery_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/app_customs/app_bar/custom_appbar.dart';
import '../../components/app_customs/color_assets/color_assets.dart';
import '../../components/my_customization_widget/custom_text.dart';

class DeliveryReportScreen extends StatelessWidget {
  const DeliveryReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeliveryCubit, DeliveryState>(
      listener: (context, state) {},
      builder: (context, state) {
        // var cubit = DeliveryCubit.get(context);
        return Scaffold(
          appBar: CustomAppBar(
            showProfile: false,
          ),
          body: Padding(
            padding: EdgeInsetsDirectional.all(
              10.w,
            ),
            child: Column(
              children: [
                CustomText(
                  text: "التقارير",
                  fontSize: 25.sp,
                  color: ColorAssets.darkPurple,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 50.h,
                  width: double.infinity,
                ),
                Container(
                  width: 387.w,
                  height: 81.h,
                  decoration: BoxDecoration(
                    color: ColorAssets.textFieldFill,
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                    border: Border.all(
                      color: ColorAssets.darkPurple,
                      width: 2.w,
                    ),
                  ),
                  padding: EdgeInsetsDirectional.all(
                    20.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ColorAssets.darkPurple,
                          borderRadius: BorderRadius.circular(
                            8.r,
                          ),
                        ),
                        alignment: AlignmentDirectional.center,
                        padding: EdgeInsetsDirectional.all(
                          10.w,
                        ),
                        child: CustomText(
                          text: "10000000",
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      CustomText(
                        text: "اجمالى عدد الشحنات",
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: 387.w,
                  height: 81.h,
                  decoration: BoxDecoration(
                    color: ColorAssets.textFieldFill,
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                    border: Border.all(
                      color: ColorAssets.darkPurple,
                      width: 2.w,
                    ),
                  ),
                  padding: EdgeInsetsDirectional.all(
                    20.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ColorAssets.darkPurple,
                          borderRadius: BorderRadius.circular(
                            8.r,
                          ),
                        ),
                        alignment: AlignmentDirectional.center,
                        padding: EdgeInsetsDirectional.all(
                          10.w,
                        ),
                        child: CustomText(
                          text: "10000000",
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      CustomText(
                        text: "اجمالى قيمة الشحن",
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
