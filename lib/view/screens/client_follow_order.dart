import 'package:alo_delivery/view/components/app_customs/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/bloc/client_cubit/client_cubit.dart';
import '../../view_model/bloc/client_cubit/client_state.dart';
import '../components/app_customs/color_assets/color_assets.dart';
import '../components/app_customs/follow_order_container/follow_order_container.dart';
import '../components/my_customization_widget/custom_text.dart';

class ClientFollowOrderScreen extends StatelessWidget {
  const ClientFollowOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<ClientCubit, ClientState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ClientCubit.get(context);
          return Scaffold(
            appBar: CustomAppBar(
              showTitle: true,
              showProfile: false,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomText(
                      text: "متابعة طلب",
                      fontSize: 25.sp,
                      color: ColorAssets.darkPurple,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 30.h,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.all(
                        10.w,
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => FollowOrderContainer(
                          orderDescription: cubit.allOffersModel?.data?[0]
                                  .orders?[index].description ??
                              "description",
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20.h,
                        ),
                        itemCount:
                            cubit.allOffersModel?.data?[0].orders?.length ?? 5,
                      ),
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
