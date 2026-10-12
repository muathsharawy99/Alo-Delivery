import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/core/services/service_locator.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

import '../../../widgets/follow_order_card.dart';
import '../manager/client_follow_order_cubit.dart';
import '../manager/client_follow_order_state.dart';

class ClientFollowOrderScreen extends StatefulWidget {
  const ClientFollowOrderScreen({super.key});

  @override
  State<ClientFollowOrderScreen> createState() =>
      _ClientFollowOrderScreenState();
}

class _ClientFollowOrderScreenState extends State<ClientFollowOrderScreen> {
  final ClientFollowOrderCubit cubit = sl<ClientFollowOrderCubit>();

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
      body: SafeArea(
        child: Column(
          children: [
            ScreenTitle(LocaleKeys.order_follow.tr()),
            SizedBox(height: AppSize.s30.h, width: double.infinity),
            BlocBuilder<ClientFollowOrderCubit, ClientFollowOrderState>(
              bloc: cubit,
              builder: (context, state) => switch (state.status) {
                RequestState.initial || RequestState.loading =>
                  const LoadingApp(),
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
                    itemCount: state.orders.length,
                    separatorBuilder: (_, _) => SizedBox(height: AppSize.s20.h),
                    itemBuilder: (_, i) => FollowOrderCard(
                      description: state.orders[i].description,
                    ),
                  ),
                ),
              },
            ).expand(),
          ],
        ),
      ),
    );
  }
}
