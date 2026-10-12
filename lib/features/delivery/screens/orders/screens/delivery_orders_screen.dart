import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/core/services/service_locator.dart';
import 'package:alo_delivery/gen/assets.gen.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

import '../manager/delivery_orders_cubit.dart';
import '../manager/delivery_orders_state.dart';
import '../widgets/delivery_order_card.dart';

/// Orders open for price offers.
class DeliveryOrdersScreen extends StatefulWidget {
  const DeliveryOrdersScreen({super.key});

  @override
  State<DeliveryOrdersScreen> createState() => _DeliveryOrdersScreenState();
}

class _DeliveryOrdersScreenState extends State<DeliveryOrdersScreen> {
  final DeliveryOrdersCubit cubit = sl<DeliveryOrdersCubit>();

  @override
  void initState() {
    super.initState();
    cubit.getOrders();
  }

  @override
  void dispose() {
    if (!cubit.isClosed) cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: const CustomAppBar(),
      body: BlocBuilder<DeliveryOrdersCubit, DeliveryOrdersState>(
        bloc: cubit,
        builder: (context, state) => switch (state.status) {
          RequestState.initial || RequestState.loading => Lottie.asset(
            Assets.lottieFiles.searching.path,
            width: AppSize.s350.w,
          ).center,
          RequestState.error => CustomErrorWidget(
            title: state.msg,
            errorStatus: state.errorType,
            onTap: cubit.getOrders,
          ),
          RequestState.empty => CustomEmptyWidget(onTap: cubit.getOrders),
          RequestState.done => RefreshIndicator.adaptive(
            color: context.primaryColor,
            onRefresh: cubit.getOrders,
            child: ListView.separated(
              padding: EdgeInsetsDirectional.all(AppSize.screenPadding.w),
              itemCount: state.orders.length + 1,
              separatorBuilder: (_, i) =>
                  SizedBox(height: i == 0 ? AppSize.s50.h : AppSize.s20.h),
              itemBuilder: (_, i) => i == 0
                  ? ScreenTitle(LocaleKeys.home_available_orders.tr())
                  : DeliveryOrderCard(
                      order: state.orders[i - 1],
                      onTap: () => push(
                        NamedRoutes.deliveryOrderDetails,
                        arg: {RouteString.order: state.orders[i - 1]},
                      ),
                    ),
            ),
          ),
        },
      ),
    );
  }
}
