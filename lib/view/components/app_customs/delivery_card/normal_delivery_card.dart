import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../my_customization_widget/custom_button.dart';
import '../../my_customization_widget/custom_text.dart';
import '../color_assets/color_assets.dart';

class NormalDeliveryCard extends StatelessWidget {
  const NormalDeliveryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 376.w,
      height: 193.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10.r,
        ),
        border: Border.all(
          width: 3.w,
          color: ColorAssets.darkPurple,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      padding: EdgeInsetsDirectional.all(24.w,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100.w,
                height: 100.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network(
                      "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    ).image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 220.w,
                    child: CustomText(
                      text: "الاسم : على احمد",
                      fontSize: 15.sp,
                      color: Colors.black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    width: 220.w,
                    child: CustomText(
                      text: "السعر : 400 جنيها",
                      fontSize: 15.sp,
                      color: Colors.black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              CustomButton(
                onPressed: () {},
                height: 40.h,
                width: 130.w,
                radius: 20.r,
                bGColor: ColorAssets.textFieldFill,
                elevation: 0,
                borderColor: ColorAssets.darkPurple,
                borderWidth: 2.w,
                child: CustomText(
                  text: "رفض ",
                  fontSize: 13.sp,
                  color: ColorAssets.darkPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              CustomButton(
                onPressed: () {},
                height: 40.h,
                width: 130.w,
                radius: 20.r,
                bGColor: ColorAssets.darkPurple,
                elevation: 0,
                child: CustomText(
                  text: "قبول",
                  fontSize: 13.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
