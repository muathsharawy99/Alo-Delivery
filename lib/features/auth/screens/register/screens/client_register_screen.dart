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

class ClientRegisterScreen extends StatefulWidget {
  const ClientRegisterScreen({super.key});

  @override
  State<ClientRegisterScreen> createState() => _ClientRegisterScreenState();
}

class _ClientRegisterScreenState extends State<ClientRegisterScreen> {
  final RegisterCubit cubit = sl<RegisterCubit>();
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final phone = TextEditingController();
  final nationalId = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  void dispose() {
    for (final c in [name, phone, nationalId, email, password, confirmPassword]) {
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
    cubit.registerClient(
      name: name.text,
      phone: phone.text,
      nationalId: nationalId.text,
      email: email.text,
      password: password.text,
      confirmPassword: confirmPassword.text,
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
            onRegisterStateChanged(state, UserType.client),
        builder: (context, state) => RegisterForm(
          formKey: formKey,
          type: UserType.client,
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
            AppDropdownField<String>(
              label: LocaleKeys.auth_gender.tr(),
              value: state.gender,
              items: {
                'male': LocaleKeys.auth_gender_male.tr(),
                'female': LocaleKeys.auth_gender_female.tr(),
              },
              onChanged: cubit.setGender,
              validator: (v) =>
                  v == null ? LocaleKeys.validations_choose_gender.tr() : null,
            ),
            AppField(
              controller: email,
              label: LocaleKeys.auth_email.tr(),
              keyboardType: TextInputType.emailAddress,
            ),
            AppField(
              controller: password,
              label: LocaleKeys.auth_password.tr(),
              keyboardType: TextInputType.visiblePassword,
              validator: Validator.password,
            ),
            AppField(
              controller: confirmPassword,
              label: LocaleKeys.auth_confirm_password.tr(),
              keyboardType: TextInputType.visiblePassword,
              validator: Validator.confirmPassword(password),
            ),
          ],
        ),
      ),
    );
  }
}
