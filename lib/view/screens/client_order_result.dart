import 'package:alo_delivery/view/components/my_customization_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../view_model/bloc/client_cubit/client_cubit.dart';
import '../../view_model/bloc/client_cubit/client_state.dart';
import '../components/app_customs/app_bar/custom_appbar.dart';
import '../components/app_customs/calling_redirection_card/calling_redirection_card.dart';
import '../components/app_customs/color_assets/color_assets.dart';
import '../components/app_customs/delivery_card/normal_delivery_card.dart';

class ClientOrderResultScreen extends StatelessWidget {
  const ClientOrderResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientCubit, ClientState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ClientCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: CustomAppBar(
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
                  NormalDeliveryCard(),
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
