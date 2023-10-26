import 'package:alo_delivery/view/components/my_customization_widget/custom_button.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_text.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_textField.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_toast.dart';
import 'package:alo_delivery/view/screens/login.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../view_model/bloc/auth_cubit/auth_cubit.dart';
import '../../../view_model/bloc/auth_cubit/auth_state.dart';
import '../../../view_model/navigation/navigation.dart';
import '../../components/app_customs/app_bar/custom_sliver_appbar.dart';
import '../../components/app_customs/color_assets/color_assets.dart';
import '../../components/app_customs/image_container/image_container.dart';
import '../../components/texts/keys.dart';
import '../../components/texts/licenses.dart';

class DeliveryRegisterScreen extends StatelessWidget {
  const DeliveryRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is CreateDeliverySuccessState) {
          AuthCubit.get(context).clearController();
          Navigation.goPushAndReplacement(
            context,
            LoginScreen(
              type: ConstKeys.delivery,
            ),
          );
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Form(
          key: cubit.registerFormKey,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                CustomSliverAppBar(
                  onTap: () => cubit.clearImages(),
                ),
              ],
              body: Padding(
                padding: EdgeInsetsDirectional.all(
                  10.w,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomText(
                        text: "انشاء حساب جديد",
                        fontSize: 25.sp,
                        color: ColorAssets.darkPurple,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 10.h,
                        width: double.infinity,
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
                        borderSideOnError: BorderSide(
                          color: Colors.red,
                          width: 2.w,
                        ),
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "برجاء ملئ خانة الاسم";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        controller: cubit.phoneController,
                        keyboardType: TextInputType.phone,
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
                            return "برجاء ملئ خانة رقم الهاتف";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        controller: cubit.nIDController,
                        keyboardType: TextInputType.number,
                        radius: 8.r,
                        filled: true,
                        label: "الرقم القومى",
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
                            return "برجاء ملئ خانة الرقم القومى";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        controller: cubit.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        radius: 8.r,
                        obscureText: cubit.isRegisterVisible ? false : true,
                        filled: true,
                        label: "الرقم السرى",
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.showRegisterPassword();
                          },
                          icon: Icon(
                            cubit.isRegisterVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 28.sp,
                            color: cubit.isRegisterVisible
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
                        height: 10.h,
                      ),
                      // CustomTextField(
                      //   controller: cubit.vPasswordController,
                      //   keyboardType: TextInputType.visiblePassword,
                      //   radius: 8.r,
                      //   obscureText: true,
                      //   filled: true,
                      //   label: "تأكيد الرقم السرى",
                      //   fillColor: ColorAssets.textFieldFill,
                      //   borderSideOnEnabled: BorderSide(
                      //     color: ColorAssets.darkPurple,
                      //     width: 2.w,
                      //   ),
                      //   borderSideOnFocus: BorderSide(
                      //     color: ColorAssets.darkPurple,
                      //     width: 2.w,
                      //   ),
                      //   borderSideOnError: BorderSide(
                      //     color: Colors.red,
                      //     width: 2.w,
                      //   ),
                      //   validator: (v) {
                      //     if (v!.trim().length < 8) {
                      //       return "يجب أن لا يقل الرقم السرى عن 8 أحرف";
                      //     } else if (v != cubit.passwordController.text) {
                      //       return "يجب أن يكون الرقم السرى متطابقاً";
                      //     } else {
                      //       return null;
                      //     }
                      //   },
                      // ),
                      // SizedBox(
                      //   height: 10.h,
                      // ),
                      CustomTextField(
                        controller: cubit.emailController,
                        keyboardType: TextInputType.emailAddress,
                        radius: 8.r,
                        filled: true,
                        label: "البريد الالكترونى",
                        fillColor: ColorAssets.textFieldFill,
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
                        height: 10.h,
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
                            print(v);
                            cubit.setVehicleController(v!);
                          },
                          validator: (v) {
                            if (v == null) {
                              return "برجاء ملئ خانة نوع المركبة";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        textDirection: TextDirection.rtl,
                        children: [
                          ImageContainer(
                            onTap: () {
                              cubit.getFromGallery("ID");
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add_a_photo,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: "أضف صورة البطاقة",
                                  textAlign: TextAlign.center,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ),
                          ),
                          ImageContainer(
                            onTap: cubit.idImage != null
                                ? () {
                                    showAdaptiveDialog(
                                      context: context,
                                      builder: (v) {
                                        return CupertinoAlertDialog(
                                          content: InteractiveViewer(
                                            boundaryMargin: EdgeInsets.zero,
                                            child: Image.file(
                                              filterQuality: FilterQuality.high,
                                              cubit.idImage!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                      barrierDismissible: true,
                                    );
                                  }
                                : () {},
                            child: cubit.idImage != null
                                ? Image.file(
                                    cubit.idImage!,
                                    fit: BoxFit.cover,
                                  )
                                : CustomText(
                                    textAlign: TextAlign.center,
                                    text: "معاينة الصورة",
                                    fontSize: 14.sp,
                                  ),
                          ),

                          ImageContainer(
                            onTap: () {
                              cubit.getFromGallery("Licence");
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add_a_photo,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: "أضف صورة رخصة المركبة",
                                  textAlign: TextAlign.center,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ),
                          ),

                          ImageContainer(
                            onTap: cubit.licenceImage != null
                                ? () {
                                    showAdaptiveDialog(
                                      context: context,
                                      builder: (v) {
                                        return CupertinoAlertDialog(
                                          content: InteractiveViewer(
                                            boundaryMargin: EdgeInsets.zero,
                                            child: Image.file(
                                              filterQuality: FilterQuality.high,
                                              cubit.licenceImage!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                      barrierDismissible: true,
                                    );
                                  }
                                : () {},
                            child: cubit.licenceImage != null
                                ? Image.file(
                                    cubit.licenceImage!,
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
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textDirection: TextDirection.rtl,
                        children: [
                          ImageContainer(
                            onTap: () {
                              cubit.getFromGallery("Profile");
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add_a_photo,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: "أضف صورتك الشخصية",
                                  textAlign: TextAlign.center,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          ImageContainer(
                            onTap: cubit.profileImage != null
                                ? () {
                                    showAdaptiveDialog(
                                      context: context,
                                      builder: (v) {
                                        return CupertinoAlertDialog(
                                          content: InteractiveViewer(
                                            boundaryMargin: EdgeInsets.zero,
                                            child: Image.file(
                                              filterQuality: FilterQuality.high,
                                              cubit.profileImage!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                      barrierDismissible: true,
                                    );
                                  }
                                : () {},
                            child: cubit.profileImage != null
                                ? Image.file(
                                    cubit.profileImage!,
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
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          end: 5.w,
                          top: 5.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  RichText(
                                    textScaleFactor: 1,
                                    textHeightBehavior:
                                        const TextHeightBehavior(
                                      applyHeightToFirstAscent: !true,
                                    ),
                                    text: TextSpan(
                                      text: "أوافق علي ",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 15.sp,
                                        color: Colors.black,
                                        height: 2,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      showAdaptiveDialog(
                                        context: context,
                                        builder: (v) {
                                          return CupertinoAlertDialog(
                                            title: CustomText(
                                              text: "شروط المستخدم",
                                              fontSize: 20.sp,
                                              color: Colors.black,
                                            ),
                                            content: Wrap(
                                              children: [
                                                CustomText(
                                                  text: deliveryLicenses,
                                                  fontSize: 15.sp,
                                                  color: Colors.black,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        barrierDismissible: true,
                                      );
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
                                      " شروط المستخدم",
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
                            Checkbox(
                              value: cubit.isChecked,
                              onChanged: (value) => cubit.checkLicences(),
                              activeColor: ColorAssets.darkPurple,
                            ),
                          ],
                        ),
                      ),
                      CustomButton(
                        onPressed: () {
                          if (cubit.isChecked == false) {
                            showToast(
                              msg:
                                  "يجب أن تكون موافقا علي شروط المستخدم حتي تتمكن من إنشاء الحساب",
                              isError: true,
                            );
                          }
                          if (cubit.idImage == null ||
                              cubit.profileImage == null ||
                              cubit.licenceImage == null) {
                            showToast(
                              msg: "يجب رفع جمبع الصور",
                              isError: true,
                            );
                          }
                          if (cubit.registerFormKey.currentState!.validate() &&
                              cubit.isChecked) {

                            cubit.createDelivery();

                          }
                        },
                        width: 331.w,
                        height: 56.h,
                        bGColor: ColorAssets.darkPurple,
                        radius: 8.r,
                        child: CustomText(
                          text: "انشاء",
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
                                text: "هل لديك حساب بالفعل؟ ",
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
                                Navigation.goPush(
                                  context,
                                  LoginScreen(
                                    type: ConstKeys.delivery,
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                                "سجل دخول الآن",
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
            ),
          ),
        );
      },
    );
  }
}
