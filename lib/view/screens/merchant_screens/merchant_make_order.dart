import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view_model/bloc/merchant_cubit/merchant_cubit.dart';
import '../../../view_model/bloc/merchant_cubit/merchant_state.dart';
import '../../../view_model/navigation/navigation.dart';
import '../../components/app_customs/app_bar/custom_appbar.dart';
import '../../components/app_customs/color_assets/color_assets.dart';
import '../../components/my_customization_widget/custom_button.dart';
import '../../components/my_customization_widget/custom_text.dart';
import '../../components/my_customization_widget/custom_textField.dart';
import '../../components/my_customization_widget/custom_toast.dart';
import 'merchant_order_result.dart';

class MerchantMakeOrderScreen extends StatelessWidget {
  const MerchantMakeOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MerchantCubit, MerchantState>(
      listener: (context, state) {
        if (state is MerchantCreateOrderSuccessState) {
          Navigation.goPush(
            context,
            MerchantOrderResultScreen(),
          );
        }
      },
      builder: (context, state) {
        var cubit = MerchantCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: const CustomAppBar(
            showTitle: true,
            showProfile: false,
          ),
          body: Form(
            key: cubit.merchantMakeOrderFormKey,
            child: Padding(
              padding: EdgeInsetsDirectional.all(
                10.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomText(
                      text: "طلب جديد",
                      fontSize: 25.sp,
                      color: ColorAssets.darkPurple,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 20.h,
                      width: double.infinity,
                    ),
                    CustomTextField(
                      controller: cubit.toController,
                      keyboardType: TextInputType.text,
                      radius: 8.r,
                      filled: true,
                      label: "الى عنوان",
                      maxLines: 2,
                      fillColor: ColorAssets.textFieldFill,
                      borderSideOnEnabled: BorderSide(
                        color: ColorAssets.darkPurple,
                        width: 2.w,
                      ),
                      borderSideOnFocus: BorderSide(
                        color: ColorAssets.darkPurple,
                        width: 2.w,
                      ),
                      borderSideOnFocusedError: BorderSide(
                        color: ColorAssets.darkPurple,
                        width: 2.w,
                      ),
                      borderSideOnError: BorderSide(
                        color: Colors.red,
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
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      controller: cubit.nameController,
                      keyboardType: TextInputType.name,
                      radius: 8.r,
                      filled: true,
                      label: "الاسم",
                      fillColor: ColorAssets.textFieldFill,
                      borderSideOnEnabled: BorderSide(
                        color: ColorAssets.darkPurple,
                        width: 2.w,
                      ),
                      borderSideOnFocus: BorderSide(
                        color: ColorAssets.darkPurple,
                        width: 2.w,
                      ),
                      borderSideOnFocusedError: BorderSide(
                        color: ColorAssets.darkPurple,
                        width: 2.w,
                      ),
                      borderSideOnError: BorderSide(
                        color: Colors.red,
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
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      controller: cubit.phoneController,
                      keyboardType: TextInputType.number,
                      radius: 8.r,
                      filled: true,
                      label: "رقم الهاتف",
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
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "برجاء ملئ الخانة";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      controller: cubit.descriptionController,
                      keyboardType: TextInputType.text,
                      radius: 8.r,
                      filled: true,
                      label: "وصف الطلب",
                      alignLabelWithHint: true,
                      fillColor: ColorAssets.textFieldFill,
                      maxLines: 3,
                      borderSideOnEnabled: BorderSide(
                        color: ColorAssets.darkPurple,
                        width: 2.w,
                      ),
                      borderSideOnFocus: BorderSide(
                        color: ColorAssets.darkPurple,
                        width: 2.w,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: DropdownButtonFormField2(
                        isExpanded: true,
                        items: cubit.allVehiclesModel?.data
                            ?.map(
                              (item) => DropdownMenuItem(
                                value: item.id,
                                child: CustomText(
                                  text: "${item.vehicle}",
                                ),
                              ),
                            )
                            .toList(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorAssets.textFieldFill,
                          label: const CustomText(
                            text: "نوع المركبة",
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorAssets.darkPurple,
                              width: 2.w,
                            ),
                            borderRadius: BorderRadius.circular(
                              8.r,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorAssets.darkPurple,
                              width: 2.w,
                            ),
                            borderRadius: BorderRadius.circular(
                              8.r,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorAssets.darkPurple,
                              width: 2.w,
                            ),
                            borderRadius: BorderRadius.circular(
                              8.r,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2.w,
                            ),
                            borderRadius: BorderRadius.circular(
                              8.r,
                            ),
                          ),
                        ),
                        onChanged: (v) {
                          cubit.setVehicleController(v!);
                        },
                        validator: (v) {
                          if (v == null) {
                            return "برجاء اختيار نوع المركبة";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      controller: cubit.priceController,
                      keyboardType: TextInputType.number,
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
                      borderSideOnFocusedError: BorderSide(
                        color: ColorAssets.darkPurple,
                        width: 2.w,
                      ),
                      borderSideOnError: BorderSide(
                        color: Colors.red,
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
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      controller: cubit.shipPriceController,
                      keyboardType: TextInputType.number,
                      radius: 8.r,
                      filled: true,
                      label: "سعر الشحن",
                      fillColor: ColorAssets.textFieldFill,
                      borderSideOnEnabled: BorderSide(
                        color: ColorAssets.darkPurple,
                        width: 2.w,
                      ),
                      borderSideOnFocus: BorderSide(
                        color: ColorAssets.darkPurple,
                        width: 2.w,
                      ),
                      borderSideOnFocusedError: BorderSide(
                        color: ColorAssets.darkPurple,
                        width: 2.w,
                      ),
                      borderSideOnError: BorderSide(
                        color: Colors.red,
                        width: 2.w,
                      ),
                      onChanged: (v) {
                        cubit.totalController.text =
                            (int.parse(cubit.priceController.text) +
                                    int.parse(v!))
                                .toString();
                      },
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "برجاء ملئ الخانة";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      controller: cubit.totalController,
                      radius: 8.r,
                      filled: true,
                      label: "الاجمالي",
                      keyboardType: TextInputType.none,
                      readOnly: true,
                      fillColor: ColorAssets.textFieldFill,
                      borderSideOnEnabled: BorderSide(
                        color: ColorAssets.darkPurple,
                        width: 2.w,
                      ),
                      borderSideOnFocus: BorderSide(
                        color: ColorAssets.darkPurple,
                        width: 2.w,
                      ),
                      borderSideOnFocusedError: BorderSide(
                        color: ColorAssets.darkPurple,
                        width: 2.w,
                      ),
                      borderSideOnError: BorderSide(
                        color: Colors.red,
                        width: 2.w,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                      onPressed: () {
                        ///TODO : Validate and Store
                        // if (cubit.merchantMakeOrderFormKey.currentState!.validate()) {
                        cubit.storeNewOrder();
                        showToast(
                          msg: "HI",
                          isError: false,
                        );

                        // }
                      },
                      width: 331.w,
                      height: 56.h,
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
          ),
        );
      },
    );
  }
}
