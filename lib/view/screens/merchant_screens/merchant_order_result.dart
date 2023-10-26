import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../view_model/bloc/merchant_cubit/merchant_cubit.dart';
import '../../../view_model/bloc/merchant_cubit/merchant_state.dart';
import '../../components/app_customs/app_bar/custom_appbar.dart';
import '../../components/app_customs/calling_redirection_card/calling_redirection_card.dart';
import '../../components/app_customs/color_assets/color_assets.dart';
import '../../components/app_customs/delivery_card/normal_delivery_card.dart';
import '../../components/my_customization_widget/custom_text.dart';

class MerchantOrderResultScreen extends StatelessWidget {
  const MerchantOrderResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MerchantCubit, MerchantState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MerchantCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: const CustomAppBar(
            showTitle: true,
            showProfile: false,
          ),
          body: Padding(
            padding: EdgeInsetsDirectional.all(
              10.w,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomText(
                    text: "نتيجة الطلب",
                    fontSize: 25.sp,
                    color: ColorAssets.darkPurple,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                  ),
                  Text(
                    "If Searching",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  LottieBuilder.asset(
                    "assets/lottie_files/searching.json",
                    width: 350.w,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "If There Is Cars",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // StreamBuilder(
                  //   stream: Stream,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       debugPrint("${snapshot.data}");
                  //       return ListView.separated(
                  //         shrinkWrap: true,
                  //         physics: NeverScrollableScrollPhysics(),
                  //         itemBuilder: (context, index) => NormalDeliveryCard(),
                  //         separatorBuilder: (context, index) => SizedBox(
                  //           height: 20.h,
                  //         ),
                  //         itemCount: 5,
                  //       );
                  //
                  //       //NormalDeliveryCard();
                  //     } else {
                  //       return Text("NO DATA");
                  //     }
                  //   },
                  // ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => NormalDeliveryCard(),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20.h,
                    ),
                    itemCount: 5,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "If There Isn't Any Car",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CallingRedirectionCard(),
                  SizedBox(
                    height: 20.h,
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
