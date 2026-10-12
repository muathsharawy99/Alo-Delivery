import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/gen/assets.gen.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

import '../widgets/onboarding_banner.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = {
      LocaleKeys.onboarding_first: Assets.images.firstBanner.path,
      LocaleKeys.onboarding_second: Assets.images.secondBanner.path,
      LocaleKeys.onboarding_third: Assets.images.thirdBanner.path,
    };
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: CarouselSlider(
          items: [
            for (final page in pages.entries)
              OnboardingBanner(
                text: page.key.tr(),
                imagePath: page.value,
                currentIndex: currentIndex,
                onRegister: () => replacement(NamedRoutes.welcome),
              ),
          ],
          options: CarouselOptions(
            onPageChanged: (index, reason) =>
                setState(() => currentIndex = index),
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            enlargeFactor: AppSize.s5,
            height: MediaQuery.sizeOf(context).height + AppSize.s200,
          ),
        ).withPadding(all: AppSize.screenPadding.w),
      ),
    );
  }
}
