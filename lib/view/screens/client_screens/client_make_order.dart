import 'package:alo_delivery/view/components/my_customization_widget/custom_button.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_text.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_textField.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_toast.dart';
import 'package:alo_delivery/view/screens/client_order_result.dart';
import 'package:alo_delivery/view_model/bloc/client_cubit/client_cubit.dart';
import 'package:alo_delivery/view_model/bloc/client_cubit/client_state.dart';
import 'package:alo_delivery/view_model/navigation/navigation.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/app_customs/app_bar/custom_appbar.dart';
import '../../components/app_customs/color_assets/color_assets.dart';
import '../../components/app_customs/image_container/image_container.dart';

class ClientMakeOrderScreen extends StatelessWidget {
  const ClientMakeOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientCubit, ClientState>(
      listener: (context, state) {
        ///TODO : Navigation
        // if (state is UserCreateOrderSuccessState) {
        //   Navigation.goPush(
        //     context,
        //     ClientOrderResultScreen(),
        //   );
        // }
      },
      builder: (context, state) {
        var cubit = ClientCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: CustomAppBar(
            showTitle: true,
            showProfile: false,
          ),
          body: Form(
            key: cubit.clientMakeOrderFormKey,
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
                      controller: cubit.fromController,
                      keyboardType: TextInputType.text,
                      radius: 8.r,
                      filled: true,
                      label: "من",
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
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      controller: cubit.toController,
                      keyboardType: TextInputType.text,
                      radius: 8.r,
                      filled: true,
                      label: "الى",
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
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        ImageContainer(
                          onTap: () {
                            cubit.getFromGallery();
                          },
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        ImageContainer(
                          onTap: cubit.imageFile != null
                              ? () {
                                  showAdaptiveDialog(
                                    context: context,
                                    builder: (v) {
                                      return CupertinoAlertDialog(
                                        content: InteractiveViewer(
                                          boundaryMargin: EdgeInsets.zero,
                                          child: Image.file(
                                            filterQuality: FilterQuality.high,
                                            cubit.imageFile!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                    barrierDismissible: true,
                                  );
                                }
                              : () {},
                          child: cubit.imageFile != null
                              ? Image.file(
                                  cubit.imageFile!,
                                  fit: BoxFit.cover,
                                )
                              : CustomText(
                                  textAlign: TextAlign.center,
                                  text: "معاينة الصورة",
                                  fontSize: 14.sp,
                                ),
                        ),
                      ],
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
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(),
                        ),
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
                          print(v);
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
                    CustomButton(
                      onPressed: () {
                        ///TODO : Validate
                        if (cubit.clientMakeOrderFormKey.currentState!
                            .validate()) {
                          cubit.storeNewOrder();
                          showToast(
                            msg: "HI",
                            isError: false,
                          );
                        }
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
