import 'package:alo_delivery/view/components/my_customization_widget/custom_textField.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../my_customization_widget/custom_button.dart';
import '../../my_customization_widget/custom_svg.dart';
import '../../my_customization_widget/custom_text.dart';
import '../color_assets/color_assets.dart';

class NormalOrderDetailsCard extends StatefulWidget {
  NormalOrderDetailsCard({
    super.key,
  });

  @override
  State<NormalOrderDetailsCard> createState() => _NormalOrderDetailsCardState();
}

var priceKey = GlobalKey<FormState>();
final priceController = TextEditingController();

class _NormalOrderDetailsCardState extends State<NormalOrderDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: priceKey,
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
            strokeAlign: BorderSide.strokeAlignOutside,
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
                Container(
                  width: 80.w,
                  height: 80.w,
                  child: SvgAssets(
                    path: "assets/images/new_order.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 240.w,
                      child: CustomText(
                        text: "من : ش المطافي",
                        fontSize: 15.sp,
                        maxLines: 2,
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: 240.w,
                      child: CustomText(
                        text: "الي : ش عباس",
                        fontSize: 15.sp,
                        maxLines: 2,
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: 240.w,
                      child: CustomText(
                        text: "وصف الطلب : أثاث منزلي",
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
            SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  onPressed: () {
                    if (priceKey.currentState!.validate()) {
                      showToast(msg: "Done", isError: false);
                    }
                  },
                  height: 40.h,
                  width: 130.w,
                  radius: 20.r,
                  bGColor: ColorAssets.darkPurple,
                  elevation: 0,
                  child: CustomText(
                    text: "ارسال",
                    fontSize: 13.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                CustomTextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  width: 130.w,
                  height: 65.h,
                  radius: 20.r,
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
                      return "من فضلك ضع السعر المقترح";
                    } else {
                      return null;
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
