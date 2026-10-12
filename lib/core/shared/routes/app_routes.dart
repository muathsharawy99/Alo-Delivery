import 'package:flutter/material.dart';

import '../../../features/auth/screens/login/screens/login_screen.dart';
import '../../../features/auth/screens/register/screens/client_register_screen.dart';
import '../../../features/auth/screens/register/screens/delivery_register_screen.dart';
import '../../../features/auth/screens/register/screens/merchant_register_screen.dart';
import '../../../features/client/screens/follow_order/screens/client_follow_order_screen.dart';
import '../../../features/client/screens/make_order/screens/client_make_order_screen.dart';
import '../../../features/client/screens/order_result/screens/client_order_result_screen.dart';
import '../../../features/delivery/data/models/delivery_order_model.dart';
import '../../../features/delivery/screens/order_details/screens/delivery_order_details_screen.dart';
import '../../../features/delivery/screens/orders/screens/delivery_orders_screen.dart';
import '../../../features/delivery/screens/report/screens/delivery_report_screen.dart';
import '../../../features/home/screens/home_screen.dart';
import '../../../features/intro/onboarding/screens/onboarding_screen.dart';
import '../../../features/intro/splash/screens/splash_screen.dart';
import '../../../features/intro/welcome/screens/welcome_screen.dart';
import '../../../features/merchant/screens/make_order/screens/merchant_make_order_screen.dart';
import '../../../features/merchant/screens/order_result/screens/merchant_order_result_screen.dart';
import '../../extensions/context_extensions.dart';
import '../enums/user_type.dart';
import 'routes.dart';

class AppRoutes {
  static AppRoutes get init => AppRoutes._internal();

  String initial = NamedRoutes.splash;

  AppRoutes._internal();

  Map<String, Widget Function(BuildContext c)> appRoutes = {
    // Intro
    NamedRoutes.splash: (c) => const SplashScreen(),
    NamedRoutes.onboarding: (c) => const OnboardingScreen(),
    NamedRoutes.welcome: (c) => const WelcomeScreen(),

    // Auth
    NamedRoutes.login: (c) => LoginScreen(type: _type(c)),
    NamedRoutes.clientRegister: (c) => const ClientRegisterScreen(),
    NamedRoutes.deliveryRegister: (c) => const DeliveryRegisterScreen(),
    NamedRoutes.merchantRegister: (c) => const MerchantRegisterScreen(),

    // App
    NamedRoutes.home: (c) => HomeScreen(type: _type(c)),

    // Client
    NamedRoutes.clientMakeOrder: (c) => const ClientMakeOrderScreen(),
    NamedRoutes.clientFollowOrder: (c) => const ClientFollowOrderScreen(),
    NamedRoutes.clientOrderResult: (c) => const ClientOrderResultScreen(),

    // Delivery
    NamedRoutes.deliveryOrders: (c) => const DeliveryOrdersScreen(),
    NamedRoutes.deliveryOrderDetails: (c) => DeliveryOrderDetailsScreen(
      order: c.arg[RouteString.order] as DeliveryOrderModel? ??
          DeliveryOrderModel.fromJson(),
    ),
    NamedRoutes.deliveryReport: (c) => const DeliveryReportScreen(),

    // Merchant
    NamedRoutes.merchantMakeOrder: (c) => const MerchantMakeOrderScreen(),
    NamedRoutes.merchantOrderResult: (c) => const MerchantOrderResultScreen(),
  };

  static UserType _type(BuildContext c) =>
      c.arg[RouteString.type] as UserType? ?? UserType.client;
}

class RouteString {
  static const type = "type";
  static const order = "order";
}
