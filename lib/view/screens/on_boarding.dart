import 'package:alo_delivery/view/components/texts/on_board.dart';
import 'package:alo_delivery/view_model/bloc/auth_cubit/auth_cubit.dart';
import 'package:alo_delivery/view_model/bloc/auth_cubit/auth_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/app_customs/onboard_banners/banner.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(
                10.w,
              ),
              child: CarouselSlider(

                items: [
                  OnBoardBanner(
                    index: cubit.currentIndex,
                    text: firstScreen,
                    imagePath: "assets/images/first_banner.svg",
                  ),
                  OnBoardBanner(
                    index: cubit.currentIndex,
                    text: secondScreen,
                    imagePath: "assets/images/second_banner.svg",
                  ),
                  OnBoardBanner(
                    index: cubit.currentIndex,
                    text: thirdScreen,
                    imagePath: "assets/images/third_banner.svg",
                  ),
                ],
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    cubit.changeIndicatorIndex(index);
                  },
                  enableInfiniteScroll: false,
                  reverse: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 5,
                  height: MediaQuery
                      .sizeOf(context)
                      .height+200,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
