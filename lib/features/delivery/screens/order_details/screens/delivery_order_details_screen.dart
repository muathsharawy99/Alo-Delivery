import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/core/services/service_locator.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

import '../../../data/models/delivery_order_model.dart';
import '../manager/delivery_order_details_cubit.dart';
import '../manager/delivery_order_details_state.dart';
import '../widgets/offer_price_bar.dart';

/// Read-only order info + send a price offer.
class DeliveryOrderDetailsScreen extends StatefulWidget {
  const DeliveryOrderDetailsScreen({super.key, required this.order});

  final DeliveryOrderModel order;

  @override
  State<DeliveryOrderDetailsScreen> createState() =>
      _DeliveryOrderDetailsScreenState();
}

class _DeliveryOrderDetailsScreenState
    extends State<DeliveryOrderDetailsScreen> {
  final DeliveryOrderDetailsCubit cubit = sl<DeliveryOrderDetailsCubit>();
  final formKey = GlobalKey<FormState>();
  late final from = TextEditingController(text: widget.order.from);
  late final to = TextEditingController(text: widget.order.to);
  late final phone = TextEditingController(text: widget.order.phone);
  late final description = TextEditingController(
    text: widget.order.description,
  );
  final price = TextEditingController();

  @override
  void dispose() {
    for (final c in [from, to, phone, description, price]) {
      c.dispose();
    }
    if (!cubit.isClosed) cubit.close();
    super.dispose();
  }

  void _confirm() {
    if (!formKey.isValid) return;
    cubit.addOffer(orderId: widget.order.intId, price: price.text);
  }

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: AppSize.s20.h);
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsetsDirectional.all(AppSize.screenPadding.w),
          child: Column(
            children: [
              ScreenTitle(LocaleKeys.order_details.tr()),
              SizedBox(height: AppSize.s50.h),
              AppField(
                controller: from,
                label: LocaleKeys.order_from.tr(),
                readOnly: true,
                maxLines: 2,
              ),
              gap,
              AppField(
                controller: to,
                label: LocaleKeys.order_to.tr(),
                readOnly: true,
                maxLines: 2,
              ),
              gap,
              AppField(
                controller: phone,
                label: LocaleKeys.order_phone.tr(),
                readOnly: true,
                maxLines: 2,
              ),
              gap,
              AppField(
                controller: description,
                label: LocaleKeys.order_description.tr(),
                readOnly: true,
                maxLines: 3,
              ),
              gap,
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
            BlocConsumer<DeliveryOrderDetailsCubit, DeliveryOrderDetailsState>(
              bloc: cubit,
              listenWhen: (p, c) => p.status != c.status,
              listener: (context, state) {
                if (state.status.isError) FlashHelper.showToast(state.msg);
                if (state.status.isDone) {
                  FlashHelper.showToast(state.msg, type: MessageType.success);
                }
              },
              builder: (context, state) => OfferPriceBar(
                controller: price,
                onConfirm: _confirm,
                isLoading: state.status.isLoading,
              ),
            ),
      ),
    );
  }
}
