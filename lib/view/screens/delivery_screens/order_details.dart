import 'package:alo_delivery/view/components/app_customs/app_bar/custom_appbar.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_button.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_text.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_textField.dart';
import 'package:alo_delivery/view_model/bloc/delivery_cubit/delivery_cubit.dart';
import 'package:alo_delivery/view_model/bloc/delivery_cubit/delivery_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/app_customs/color_assets/color_assets.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({
    super.key,
    required this.orderId,
  });

  final int orderId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeliveryCubit, DeliveryState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DeliveryCubit.get(context);
        return Scaffold(
          appBar: const CustomAppBar(
            showProfile: false,
            showTitle: true,
          ),
          body: Form(
            key: cubit.deliveryPriceFormKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsDirectional.all(
                  10.w,
                ),
                child: Column(
                  children: [
                    CustomText(
                      text: "تفاصيل الطلب",
                      fontSize: 25.sp,
                      color: ColorAssets.darkPurple,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 50.h,
                      // width: double.infinity,
                    ),
                    CustomTextField(
                      controller: cubit.fromController,
                      label: "من",
                      keyboardType: TextInputType.none,
                      radius: 8.r,
                      filled: true,
                      readOnly: true,
                      maxLines: 2,
                      fillColor: ColorAssets.textFieldFill,
                      borderSideOnEnabled: BorderSide(
                        color: ColorAssets.darkPurple,
                        width: 2.w,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      controller: cubit.toController,
                      label: "الى",
                      keyboardType: TextInputType.none,
                      radius: 8.r,
                      filled: true,
                      readOnly: true,
                      maxLines: 2,
                      fillColor: ColorAssets.textFieldFill,
                      borderSideOnEnabled: BorderSide(
                        color: ColorAssets.darkPurple,
                        width: 2.w,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      controller: cubit.phoneController,
                      label: "رقم الهاتف",
                      keyboardType: TextInputType.none,
                      radius: 8.r,
                      filled: true,
                      readOnly: true,
                      maxLines: 2,
                      fillColor: ColorAssets.textFieldFill,
                      borderSideOnEnabled: BorderSide(
                        color: ColorAssets.darkPurple,
                        width: 2.w,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      controller: cubit.descriptionController,
                      label: "وصف الطلب",
                      keyboardType: TextInputType.none,
                      radius: 8.r,
                      filled: true,
                      readOnly: true,
                      maxLines: 3,
                      fillColor: ColorAssets.textFieldFill,
                      borderSideOnEnabled: BorderSide(
                        color: ColorAssets.darkPurple,
                        width: 2.w,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: EdgeInsetsDirectional.only(
              start: 10.w,
              end: 10.w,
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  CustomTextField(
                    controller: cubit.priceController,
                    keyboardType: TextInputType.number,
                    width: 180.w,
                    radius: 8.r,
                    filled: true,
                    label: "السعر",
                    fillColor: ColorAssets.textFieldFill,
                    borderSideOnEnabled: BorderSide(
                      color: ColorAssets.darkPurple,
                      width: 2.w,
                    ),
                    borderSideOnFocus: BorderSide(
                      color: ColorAssets.darkPurple,
                      width: 2.w,
                    ),
                    borderSideOnError: BorderSide(
                      color: Colors.red,
                      width: 2.w,
                    ),
                    borderSideOnFocusedError: BorderSide(
                      color: ColorAssets.darkPurple,
                      width: 2.w,
                    ),
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "برجاء ملئ الخانة";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Spacer(),
                  CustomButton(
                    onPressed: () {
                      if (cubit.deliveryPriceFormKey.currentState!.validate()) {
                        ///TODO : Do offer
                        cubit.deliveryAddOfferPrice(
                          orderId: orderId,
                        );
                      }
                    },
                    width: 180.w,
                    height: 70.h,
                    bGColor: ColorAssets.darkPurple,
                    radius: 8.r,
                    child: CustomText(
                      text: "تأكيد",
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
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
