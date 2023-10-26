import 'package:alo_delivery/model/delivery_models/delivery_orders_model.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_textField.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_toast.dart';
import 'package:alo_delivery/view/screens/delivery_screens/order_details.dart';
import 'package:alo_delivery/view_model/bloc/delivery_cubit/delivery_cubit.dart';
import 'package:alo_delivery/view_model/bloc/delivery_cubit/delivery_state.dart';
import 'package:alo_delivery/view_model/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../my_customization_widget/custom_button.dart';
import '../../my_customization_widget/custom_svg.dart';
import '../../my_customization_widget/custom_text.dart';
import '../color_assets/color_assets.dart';

class NormalOrderDetailsCard extends StatelessWidget {
  final int currentIndex;

  const NormalOrderDetailsCard({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeliveryCubit, DeliveryState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DeliveryCubit.get(context);
        return InkWell(
          onTap: () {
            cubit.initController(currentIndex);
            Navigation.goPush(
              context,
              OrderDetailsScreen(
                orderId: cubit.deliveryOrdersModel?.data?[currentIndex].id ?? 0,
              ),
            );
          },
          borderRadius: BorderRadius.circular(
            10.r,
          ),
          child: Container(
            width: 376.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                10.r,
              ),
              border: Border.all(
                width: 3.w,
                color: ColorAssets.darkPurple,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
            ),
            padding: EdgeInsetsDirectional.all(
              24.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 80.w,
                      height: 80.w,
                      child: const SvgAssets(
                        path: "assets/images/new_order.svg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 240.w,
                          child: CustomText(
                            text:
                                "من : ${cubit.deliveryOrdersModel?.data?[currentIndex].from}",
                            fontSize: 15.sp,
                            maxLines: 2,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 240.w,
                          child: CustomText(
                            text:
                                "الي : ${cubit.deliveryOrdersModel?.data?[currentIndex].to}",
                            fontSize: 15.sp,
                            maxLines: 2,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 240.w,
                          child: CustomText(
                            text:
                                "وصف الطلب : ${cubit.deliveryOrdersModel?.data?[currentIndex].description}",
                            fontSize: 15.sp,
                            maxLines: 1,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
