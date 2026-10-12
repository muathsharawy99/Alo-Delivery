import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/core/services/service_locator.dart';
import 'package:alo_delivery/core/shared/widgets/vehicle_dropdown.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

import '../manager/merchant_make_order_cubit.dart';
import '../manager/merchant_make_order_state.dart';

class MerchantMakeOrderScreen extends StatefulWidget {
  const MerchantMakeOrderScreen({super.key});

  @override
  State<MerchantMakeOrderScreen> createState() =>
      _MerchantMakeOrderScreenState();
}

class _MerchantMakeOrderScreenState extends State<MerchantMakeOrderScreen> {
  final MerchantMakeOrderCubit cubit = sl<MerchantMakeOrderCubit>();
  final formKey = GlobalKey<FormState>();
  final to = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  final description = TextEditingController();
  final price = TextEditingController();
  final shipPrice = TextEditingController();
  final total = TextEditingController();

  @override
  void dispose() {
    for (final c in [to, name, phone, description, price, shipPrice, total]) {
      c.dispose();
    }
    if (!cubit.isClosed) cubit.close();
    super.dispose();
  }

  void _updateTotal(String _) =>
      total.text = MerchantMakeOrderCubit.total(price.text, shipPrice.text);

  void _confirm() {
    if (!formKey.isValid) return;
    cubit.createOrder(
      to: to.text,
      name: name.text,
      phone: phone.text,
      description: description.text,
      price: price.text,
      shipPrice: shipPrice.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: AppSize.s20.h);
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: const CustomAppBar(),
      body: BlocConsumer<MerchantMakeOrderCubit, MerchantMakeOrderState>(
        bloc: cubit,
        listenWhen: (p, c) => p.status != c.status,
        listener: (context, state) {
          if (state.status.isError) FlashHelper.showToast(state.msg);
          if (state.status.isDone) {
            FlashHelper.showToast(state.msg, type: MessageType.success);
            push(NamedRoutes.merchantOrderResult);
          }
        },
        builder: (context, state) => Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: EdgeInsetsDirectional.all(AppSize.screenPadding.w),
            child: Column(
              children: [
                ScreenTitle(LocaleKeys.order_new_order.tr()),
                SizedBox(height: AppSize.s20.h, width: double.infinity),
                AppField(
                  controller: to,
                  label: LocaleKeys.order_to_address.tr(),
                  maxLines: 2,
                  validator: Validator.notEmpty(),
                ),
                gap,
                AppField(
                  controller: name,
                  label: LocaleKeys.auth_name.tr(),
                  keyboardType: TextInputType.name,
                  validator: Validator.notEmpty(),
                ),
                gap,
                AppField(
                  controller: phone,
                  label: LocaleKeys.order_phone.tr(),
                  keyboardType: TextInputType.number,
                  validator: Validator.notEmpty(),
                ),
                gap,
                AppField(
                  controller: description,
                  label: LocaleKeys.order_description.tr(),
                  maxLines: 3,
                  alignLabelWithHint: true,
                  validator: Validator.notEmpty(),
                ),
                gap,
                VehicleDropdown(
                  value: state.vehicleId,
                  onChanged: cubit.setVehicle,
                ),
                gap,
                AppField(
                  controller: price,
                  label: LocaleKeys.order_price.tr(),
                  keyboardType: TextInputType.number,
                  onChanged: _updateTotal,
                  validator: Validator.notEmpty(),
                ),
                gap,
                AppField(
                  controller: shipPrice,
                  label: LocaleKeys.order_ship_price.tr(),
                  keyboardType: TextInputType.number,
                  onChanged: _updateTotal,
                  validator: Validator.notEmpty(),
                ),
                gap,
                AppField(
                  controller: total,
                  label: LocaleKeys.order_total.tr(),
                  readOnly: true,
                ),
                gap,
                AppButton(
                  onPressed: _confirm,
                  isLoading: state.status.isLoading,
                  title: LocaleKeys.static_confirm.tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
