import 'package:get_it/get_it.dart';

import '../../features/auth/screens/login/manager/login_cubit.dart';
import '../../features/auth/screens/login/service/login_service.dart';
import '../../features/auth/screens/register/manager/register_cubit.dart';
import '../../features/auth/screens/register/service/register_service.dart';
import '../../features/client/screens/follow_order/manager/client_follow_order_cubit.dart';
import '../../features/client/screens/make_order/manager/client_make_order_cubit.dart';
import '../../features/client/service/client_service.dart';
import '../../features/delivery/screens/order_details/manager/delivery_order_details_cubit.dart';
import '../../features/delivery/screens/orders/manager/delivery_orders_cubit.dart';
import '../../features/delivery/service/delivery_service.dart';
import '../../features/merchant/screens/make_order/manager/merchant_make_order_cubit.dart';
import '../../features/merchant/service/merchant_service.dart';
import '../blocs/vehicles/manager/vehicles_cubit.dart';
import '../blocs/vehicles/service/vehicles_service.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //app-wide
    sl.registerLazySingleton(() => VehiclesCubit(VehiclesService()));

    //auth
    sl.registerFactory(() => LoginCubit(LoginService()));
    sl.registerFactory(() => RegisterCubit(RegisterService()));

    //client
    sl.registerFactory(() => ClientMakeOrderCubit(ClientService()));
    sl.registerFactory(() => ClientFollowOrderCubit(ClientService()));

    //delivery
    sl.registerFactory(() => DeliveryOrdersCubit(DeliveryService()));
    sl.registerFactory(() => DeliveryOrderDetailsCubit(DeliveryService()));

    //merchant
    sl.registerFactory(() => MerchantMakeOrderCubit(MerchantService()));
  }
}
