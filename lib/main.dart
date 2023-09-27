import 'package:alo_delivery/view/screens/on_boarding.dart';
import 'package:alo_delivery/view/screens/splash.dart';
import 'package:alo_delivery/view_model/bloc/auth_cubit/auth_cubit.dart';
import 'package:alo_delivery/view_model/bloc/bloc_observer/bloc_observer.dart';
import 'package:alo_delivery/view_model/bloc/client_cubit/client_cubit.dart';
import 'package:alo_delivery/view_model/bloc/delivery_cubit/delivery_cubit.dart';
import 'package:alo_delivery/view_model/local/secure_storage/secure_storage.dart';
import 'package:alo_delivery/view_model/local/shared_preferences/shared_preferences.dart';
import 'package:alo_delivery/view_model/network/dio_helper/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  SharedPreference.initShared();
  await SecureStorage.initSecureStorage();
  await DioHelper.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        430,
        932,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthCubit()..getVehicles(),
            ),
            BlocProvider(
              create: (context) => ClientCubit()..getVehicles(),
            ),
            BlocProvider(
              create: (context) => DeliveryCubit(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: AnimatedSplashScreen(
              splash: SplashScreen(),
              nextScreen: OnBoardingScreen(),
              splashTransition: SplashTransition.fadeTransition,
              splashIconSize: MediaQuery.of(context).size.height,
            ),
          ),
        );
      },
    );
  }
}
