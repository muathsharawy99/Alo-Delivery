import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/core/services/service_locator.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

import '../manager/register_cubit.dart';
import '../manager/register_state.dart';
import '../widgets/register_form.dart';
import '../widgets/register_listener.dart';

class MerchantRegisterScreen extends StatefulWidget {
  const MerchantRegisterScreen({super.key});

  @override
  State<MerchantRegisterScreen> createState() => _MerchantRegisterScreenState();
}

class _MerchantRegisterScreenState extends State<MerchantRegisterScreen> {
  final RegisterCubit cubit = sl<RegisterCubit>();
  final formKey = GlobalKey<FormState>();
  final company = TextEditingController();
  final phone = TextEditingController();
  final extraPhone = TextEditingController();
  final nationalId = TextEditingController();
  final password = TextEditingController();
  final address = TextEditingController();

  @override
  void dispose() {
    for (final c in [company, phone, extraPhone, nationalId, password, address]) {
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
    if (!formKey.isValid) return;
    cubit.registerMerchant(
      company: company.text,
      phone: phone.text,
      extraPhone: extraPhone.text,
      nationalId: nationalId.text,
      password: password.text,
      address: address.text,
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
            onRegisterStateChanged(state, UserType.merchant),
        builder: (context, state) => RegisterForm(
          formKey: formKey,
          type: UserType.merchant,
          termsAccepted: state.termsAccepted,
          onToggleTerms: cubit.toggleTerms,
          onCreate: _create,
          isLoading: state.status.isLoading,
          fields: [
            AppField(
              controller: company,
              label: LocaleKeys.auth_company.tr(),
              keyboardType: TextInputType.name,
              validator: Validator.notEmpty(
                LocaleKeys.validations_empty_company,
              ),
            ),
            AppField(
              controller: phone,
              label: LocaleKeys.auth_phone.tr(),
              keyboardType: TextInputType.phone,
              validator: Validator.notEmpty(LocaleKeys.validations_empty_phone),
            ),
            AppField(
              controller: extraPhone,
              label: LocaleKeys.auth_extra_phone.tr(),
              keyboardType: TextInputType.phone,
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
              controller: address,
              label: LocaleKeys.auth_address.tr(),
              keyboardType: TextInputType.streetAddress,
              validator: Validator.notEmpty(
                LocaleKeys.validations_empty_address,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
