import 'package:alo_delivery/view/components/my_customization_widget/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../my_customization_widget/custom_button.dart';
import '../../my_customization_widget/custom_text.dart';
import '../color_assets/color_assets.dart';

class CallingRedirectionCard extends StatelessWidget {
  const CallingRedirectionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 376.w,
      height: 300.h,
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
      padding: EdgeInsetsDirectional.all(
        24.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomText(
            text: "نعتذر لعدم التوافر في الوقت الحالي",
            fontSize: 18.sp,
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.bold,
          ),
          CustomText(
            text: "يرجى الاتصال بنا",
            fontSize: 18.sp,
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            onPressed: () async {
              final number = Uri.parse('tel:+201555776493');
              if (await canLaunchUrl(number)) {
                launchUrl(
                  number,
                );
              } else {
                throw "Couldn't call $number";
              }
            },
            height: 40.h,
            width: 140.w,
            radius: 20.r,
            bGColor: ColorAssets.textFieldFill,
            borderColor: ColorAssets.darkPurple,
            borderWidth: 2.w,
            elevation: 0,
            child: Row(
              children: [
                Icon(
                  Icons.phone,
                  color: ColorAssets.darkPurple,
                ),
                SizedBox(
                  width: 10.w,
                ),
                CustomText(
                  text: "اتصل الآن",
                  fontSize: 13.sp,
                  color: ColorAssets.darkPurple,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomText(
            text: "او التواصل معنا عن طريق الواتساب",
            fontSize: 18.sp,
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            onPressed: () async {
              final Uri launchUri =
                  Uri(scheme: "https", path: "wa.me/201555776493");
              if (await canLaunchUrl(launchUri)) {
                await launchUrl(
                  launchUri,
                  mode: LaunchMode.externalNonBrowserApplication,
                );
              } else {
                throw "Couldn't call $launchUri";
              }
            },
            height: 40.h,
            width: 160.w,
            radius: 20.r,
            bGColor: Colors.green,
            elevation: 0,
            child: Row(
              children: [
                SvgAssets(
                  path: "assets/images/whatsapp_icon.svg",
                  height: 25.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                CustomText(
                  text: "WhatsApp",
                  fontSize: 13.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
