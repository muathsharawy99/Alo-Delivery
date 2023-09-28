import 'package:alo_delivery/view/components/my_customization_widget/custom_button.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_svg.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_text.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_textField.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_toast.dart';
import 'package:alo_delivery/view/screens/home.dart';
import 'package:alo_delivery/view/screens/client_screens/client_register.dart';
import 'package:alo_delivery/view_model/bloc/auth_cubit/auth_cubit.dart';
import 'package:alo_delivery/view_model/bloc/auth_cubit/auth_state.dart';
import 'package:alo_delivery/view_model/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/app_customs/app_bar/custom_sliver_appbar.dart';
import '../components/app_customs/color_assets/color_assets.dart';
import '../components/my_customization_widget/custom_dialog.dart';
import '../components/texts/keys.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginUserSuccessState) {
          Navigation.goPushAndReplacement(
            context,
            HomeScreen(
              type: ConstKeys.client,
            ),
          );
        } else if (state is LoginDeliverySuccessState) {
          Navigation.goPushAndReplacement(
            context,
            HomeScreen(
              type: ConstKeys.delivery,
            ),
          );
        } else if (state is LoginMerchantSuccessState) {
          Navigation.goPushAndReplacement(
            context,
            HomeScreen(
              type: ConstKeys.merchant,
            ),
          );
        } else if (state is LoginUserPendingState ||
            state is LoginDeliveryPendingState ||
            state is LoginMerchantPendingState) {
          showMyDialog(
            titleString: "عفوا",
            context: context,
            text: ConstKeys.pending,
          );
        } else if (state is LoginUserRejectedState ||
            state is LoginDeliveryRejectedState ||
            state is LoginMerchantRejectedState) {
          showMyDialog(
            titleString: "عفوا",
            context: context,
            text: ConstKeys.rejected,
          );
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Form(
          key: cubit.loginFormKey,
          child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: NestedScrollView(
                physics: BouncingScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  CustomSliverAppBar(),
                ],
                body: Padding(
                  padding: EdgeInsetsDirectional.all(
                    10.w,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomText(
                          text: "تسجيل دخول",
                          fontSize: 25.sp,
                          color: ColorAssets.darkPurple,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 20.h,
                        ),
                        SvgAssets(
                          path: "assets/images/login.svg",
                          height: 400.h,
                        ),
                        CustomTextField(
                          controller: cubit.nIDController,
                          keyboardType: TextInputType.number,
                          radius: 8.r,
                          filled: true,
                          label: "الرقم القومي",
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
                              return "برجاء ملئ خانة الرقم القومي";
                            }

                            ///TODO : Validator

                            // else if (v.length < 14) {
                            //   return "برجاء كتابة الرقم القومي بشكل صحيح";
                            // }
                            else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextField(
                          controller: cubit.passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          radius: 8.r,
                          obscureText: cubit.isLoginVisible ? false : true,
                          filled: true,
                          label: "الرقم السرى",
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.showLoginPassword();
                            },
                            icon: Icon(
                              cubit.isLoginVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 28.sp,
                              color: cubit.isLoginVisible
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
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
                            if (v!.trim().length < 8) {
                              return "يجب أن لا يقل الرقم السرى عن 8 أحرف";
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
                            if (cubit.loginFormKey.currentState!.validate()) {
                              if (type == ConstKeys.client) {
                                cubit.loginClient();
                              }

                              ///TODO : Delivery Home Screen
                              else if (type == ConstKeys.delivery) {
                                cubit.loginDelivery();
                              }

                              ///TODO : Merchant Home Screen
                              else if (type == ConstKeys.merchant) {
                                cubit.loginMerchant();
                              }
                            }
                          },
                          width: 331.w,
                          height: 56.h,
                          bGColor: ColorAssets.darkPurple,
                          radius: 8.r,
                          child: CustomText(
                            text: "دخول",
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            color: Colors.white,
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              RichText(
                                textScaleFactor: 1,
                                textHeightBehavior: const TextHeightBehavior(
                                  applyHeightToFirstAscent: !true,
                                ),
                                text: TextSpan(
                                  text: "ليس لديك حساب ؟ ",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15.sp,
                                    color: Colors.black,
                                    height: 2,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  cubit.clearController();
                                  Navigation.goPop(context);
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  minimumSize: Size(
                                    10.w,
                                    50.h,
                                  ),
                                  maximumSize: Size(
                                    double.infinity,
                                    50.h,
                                  ),
                                ),
                                child: Text(
                                  "انشاء حساب جديد",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    height: .5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }
}
