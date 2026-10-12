import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/core/services/service_locator.dart';
import 'package:alo_delivery/core/shared/widgets/vehicle_dropdown.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

import '../manager/client_make_order_cubit.dart';
import '../manager/client_make_order_state.dart';

class ClientMakeOrderScreen extends StatefulWidget {
  const ClientMakeOrderScreen({super.key});

  @override
  State<ClientMakeOrderScreen> createState() => _ClientMakeOrderScreenState();
}

class _ClientMakeOrderScreenState extends State<ClientMakeOrderScreen> {
  final ClientMakeOrderCubit cubit = sl<ClientMakeOrderCubit>();
  final formKey = GlobalKey<FormState>();
  final from = TextEditingController();
  final to = TextEditingController();
  final phone = TextEditingController();
  final description = TextEditingController();

  @override
  void dispose() {
    for (final c in [from, to, phone, description]) {
      c.dispose();
    }
    if (!cubit.isClosed) cubit.close();
    super.dispose();
  }

  void _confirm() {
    if (!formKey.isValid) return;
    cubit.createOrder(
      from: from.text,
      to: to.text,
      phone: phone.text,
      description: description.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: AppSize.s20.h);
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: const CustomAppBar(),
      body: BlocConsumer<ClientMakeOrderCubit, ClientMakeOrderState>(
        bloc: cubit,
        listenWhen: (p, c) => p.status != c.status,
        listener: (context, state) {
          if (state.status.isError) FlashHelper.showToast(state.msg);
          if (state.status.isDone) {
            FlashHelper.showToast(state.msg, type: MessageType.success);
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
                  controller: from,
                  label: LocaleKeys.order_from.tr(),
                  maxLines: 2,
                  validator: Validator.notEmpty(),
                ),
                gap,
                AppField(
                  controller: to,
                  label: LocaleKeys.order_to.tr(),
                  maxLines: 2,
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
                ImagePickerPair(
                  label: LocaleKeys.static_add_image.tr(),
                  file: state.image,
                  onPick: cubit.pickImage,
                  spacing: AppSize.s20.w,
                ).toStart,
                gap,
                VehicleDropdown(
                  value: state.vehicleId,
                  onChanged: cubit.setVehicle,
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
