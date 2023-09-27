import 'package:alo_delivery/view/components/app_customs/color_assets/color_assets.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_svg.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FollowOrderContainer extends StatefulWidget {
  const FollowOrderContainer({super.key});

  @override
  State<FollowOrderContainer> createState() => _FollowOrderContainerState();
}

bool visible = false;

class _FollowOrderContainerState extends State<FollowOrderContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(
        8.r,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: ColorAssets.textFieldFill,
      child: InkWell(
        onTap: () {
          setState(() {
            visible = !visible;
          });
        },
        borderRadius: BorderRadius.circular(
          8.r,
        ),
        child: Container(
          width: 406.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8.r,
            ),
            border: Border.all(
              color: ColorAssets.darkPurple,
              width: 2.w,
            ),
          ),
          padding: EdgeInsetsDirectional.all(
            15.w,
          ),
          child: Visibility(
            replacement: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgAssets(
                      path: "assets/images/package.svg",
                      width: 35.w,
                    ),
                    CustomText(
                      text: "الطلب الاول",
                      fontSize: 15.sp,
                      color: ColorAssets.darkPurple,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Stepper(
                  physics: NeverScrollableScrollPhysics(),
                  type: StepperType.vertical,
                  elevation: 0,
                  currentStep: 3,
                  controlsBuilder: (context, details) => Row(
                    children: [],
                  ),
                  steps: [
                    Step(
                      title: CustomText(
                        text: "المندوب فى الطريق إليك",
                        color: ColorAssets.darkPurple,
                        fontSize: 18.sp,
                      ),
                      content: CustomText(
                        text:
                            "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}\n${(DateTime.now().hour) > 12 ? (DateTime.now().hour - 12) : (DateTime.now().hour) == 0 ? (DateTime.now().hour + 12) : DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second} | ${(DateTime.now().hour) > 12 ? "PM" : "AM"}",
                        textAlign: TextAlign.center,

                        ///TODO : Color
                        color: ColorAssets.darkPurple,
                        fontSize: 18.sp,
                      ),
                      isActive: true,
                    ),
                    Step(
                      title: CustomText(
                        text: "تم الاستلام",
                        color: ColorAssets.darkPurple,
                        fontSize: 18.sp,
                      ),
                      content: CustomText(
                        text:
                            "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}\n${(DateTime.now().hour) > 12 ? (DateTime.now().hour - 12) : (DateTime.now().hour) == 0 ? (DateTime.now().hour + 12) : DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second} | ${(DateTime.now().hour) > 12 ? "PM" : "AM"}",
                        textAlign: TextAlign.center,
                        color: ColorAssets.darkPurple,
                        fontSize: 18.sp,
                      ),
                      isActive: true,
                    ),
                    Step(
                      title: CustomText(
                        text: "فى الطريق",
                        color: ColorAssets.darkPurple,
                        fontSize: 18.sp,
                      ),
                      content: CustomText(
                        text:
                            "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}\n${(DateTime.now().hour) > 12 ? (DateTime.now().hour - 12) : (DateTime.now().hour) == 0 ? (DateTime.now().hour + 12) : DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second} | ${(DateTime.now().hour) > 12 ? "PM" : "AM"}",
                        textAlign: TextAlign.center,
                        color: ColorAssets.darkPurple,
                        fontSize: 18.sp,
                      ),
                      isActive: true,
                    ),
                    Step(
                      title: CustomText(
                        text: "تم التسليم",
                        color: ColorAssets.darkPurple,
                        fontSize: 18.sp,
                      ),
                      content: CustomText(
                        text:
                            "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}\n${(DateTime.now().hour) > 12 ? (DateTime.now().hour - 12) : (DateTime.now().hour) == 0 ? (DateTime.now().hour + 12) : DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second} | ${(DateTime.now().hour) > 12 ? "PM" : "AM"}",
                        textAlign: TextAlign.center,
                        color: ColorAssets.darkPurple,
                        fontSize: 18.sp,
                      ),
                      isActive: true,
                    ),
                  ],
                ),
              ],
            ),
            visible: visible,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgAssets(
                  path: "assets/images/package.svg",
                  width: 35.w,
                ),
                CustomText(
                  text: "الطلب الاول",
                  fontSize: 15.sp,
                  color: ColorAssets.darkPurple,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
