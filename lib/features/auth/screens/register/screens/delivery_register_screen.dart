import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/core/services/service_locator.dart';
import 'package:alo_delivery/core/shared/widgets/vehicle_dropdown.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

import '../manager/register_cubit.dart';
import '../manager/register_image.dart';
import '../manager/register_state.dart';
import '../widgets/register_form.dart';
import '../widgets/register_listener.dart';

class DeliveryRegisterScreen extends StatefulWidget {
  const DeliveryRegisterScreen({super.key});

  @override
  State<DeliveryRegisterScreen> createState() => _DeliveryRegisterScreenState();
}

class _DeliveryRegisterScreenState extends State<DeliveryRegisterScreen> {
  final RegisterCubit cubit = sl<RegisterCubit>();
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final phone = TextEditingController();
  final nationalId = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();

  @override
  void dispose() {
    for (final c in [name, phone, nationalId, password, email]) {
      c.dispose();
    }
    if (!cubit.isClosed) cubit.close();
    super.dispose();
  }

  void _create() {
    if (!cubit.state.termsAccepted) {
      FlashHelper.showToast(LocaleKeys.validations_terms_required.tr());
      return;
    }
    if (!cubit.state.hasAllImages) {
      FlashHelper.showToast(LocaleKeys.validations_images_required.tr());
      return;
    }
    if (!formKey.isValid) return;
    cubit.registerDelivery(
      name: name.text,
      phone: phone.text,
      nationalId: nationalId.text,
      email: email.text,
      password: password.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: const CustomAppBar(),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        bloc: cubit,
        listenWhen: (p, c) => p.status != c.status,
        listener: (context, state) =>
            onRegisterStateChanged(state, UserType.delivery),
        builder: (context, state) => RegisterForm(
          formKey: formKey,
          type: UserType.delivery,
          termsAccepted: state.termsAccepted,
          onToggleTerms: cubit.toggleTerms,
          onCreate: _create,
          isLoading: state.status.isLoading,
          fields: [
            AppField(
              controller: name,
              label: LocaleKeys.auth_name.tr(),
              keyboardType: TextInputType.name,
              validator: Validator.notEmpty(LocaleKeys.validations_empty_name),
            ),
            AppField(
              controller: phone,
              label: LocaleKeys.auth_phone.tr(),
              keyboardType: TextInputType.phone,
              validator: Validator.notEmpty(LocaleKeys.validations_empty_phone),
            ),
            AppField(
              controller: nationalId,
              label: LocaleKeys.auth_national_id.tr(),
              keyboardType: TextInputType.number,
              validator: Validator.notEmpty(
                LocaleKeys.validations_empty_national_id,
              ),
            ),
            AppField(
              controller: password,
              label: LocaleKeys.auth_password.tr(),
              keyboardType: TextInputType.visiblePassword,
              validator: Validator.password,
            ),
            AppField(
              controller: email,
              label: LocaleKeys.auth_email.tr(),
              keyboardType: TextInputType.emailAddress,
            ),
            VehicleDropdown(
              value: state.vehicleId,
              onChanged: cubit.setVehicle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ImagePickerPair(
                  label: LocaleKeys.auth_add_id_image.tr(),
                  file: state.idImage,
                  onPick: () => cubit.pickImage(RegisterImage.id),
                  spacing: AppSize.s10.w,
                ),
                ImagePickerPair(
                  label: LocaleKeys.auth_add_licence_image.tr(),
                  file: state.licenceImage,
                  onPick: () => cubit.pickImage(RegisterImage.licence),
                  spacing: AppSize.s10.w,
                ),
              ],
            ),
            ImagePickerPair(
              label: LocaleKeys.auth_add_profile_image.tr(),
              file: state.profileImage,
              onPick: () => cubit.pickImage(RegisterImage.profile),
            ).center,
          ],
        ),
      ),
    );
  }
}
