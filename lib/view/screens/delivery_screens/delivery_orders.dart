import 'package:alo_delivery/model/delivery_models/delivery_orders_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../view_model/bloc/delivery_cubit/delivery_cubit.dart';
import '../../../view_model/bloc/delivery_cubit/delivery_state.dart';
import '../../components/app_customs/app_bar/custom_appbar.dart';
import '../../components/app_customs/color_assets/color_assets.dart';
import '../../components/app_customs/delivery_card/normal_order_details.dart';
import '../../components/my_customization_widget/custom_text.dart';

class DeliveryOrdersScreen extends StatelessWidget {
  const DeliveryOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeliveryCubit, DeliveryState>(
      listener: (context, state) {
        if (state is DeliveryGetAllOrdersLoadingState) {}
      },
      builder: (context, state) {
        var cubit = DeliveryCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: CustomAppBar(
            showTitle: true,
            showProfile: false,
          ),
          body: state is DeliveryGetAllOrdersLoadingState
              ? Center(
                  child: LottieBuilder.asset(
                    "assets/lottie_files/searching.json",
                    width: 350.w,
                  ),
                )
              : Padding(
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
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>

                              NormalOrderDetailsCard(
                            currentIndex: index,
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 20.h,
                          ),
                          itemCount:
                              cubit.deliveryOrdersModel?.data?.length ?? 0,
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
