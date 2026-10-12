import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/gen/assets.gen.dart';

/// Logo + bottom illustration, then onboarding.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _start();
  }

  Future<void> _start() async {
    await Future<void>.delayed(AppConstants.splashDuration);
    if (!mounted) return;
    replacement(NamedRoutes.onboarding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            CircleAvatar(
              backgroundColor: context.primaryColor,
              radius: AppSize.s100.r,
              child: CustomImage(
                Assets.images.logo.path,
                height: AppSize.s90.h,
              ),
            ).center,
            CustomImage(
              Assets.images.bottomSplash.path,
              alignment: Alignment.bottomCenter,
              height: AppSize.s400.h,
            ).withAlign(Alignment.bottomCenter),
          ],
        ),
      ),
    );
  }
}
