import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/core/services/service_locator.dart';
import 'package:alo_delivery/gen/assets.gen.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

import '../../../widgets/auth_switch_row.dart';
import '../../../widgets/pending_dialog.dart';
import '../manager/login_cubit.dart';
import '../manager/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.type});

  final UserType type;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginCubit cubit = sl<LoginCubit>();
  final formKey = GlobalKey<FormState>();
  final phone = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    phone.dispose();
    password.dispose();
    if (!cubit.isClosed) cubit.close();
    super.dispose();
  }

  void _login() {
    if (!formKey.isValid) return;
    cubit.login(type: widget.type, phone: phone.text, password: password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: const CustomAppBar(),
      body: BlocConsumer<LoginCubit, LoginState>(
        bloc: cubit,
        listenWhen: (p, c) => p.status != c.status,
        listener: (context, state) {
          if (state.status.isError) {
            FlashHelper.showToast(state.msg);
          } else if (state.status.isDone && state.isPending) {
            showAppDialog(const PendingDialog());
          } else if (state.status.isDone) {
            FlashHelper.showToast(state.msg, type: MessageType.success);
            replacement(
              NamedRoutes.home,
              arg: {RouteString.type: widget.type},
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              padding: EdgeInsetsDirectional.all(AppSize.screenPadding.w),
              child: Column(
                children: [
                  ScreenTitle(LocaleKeys.auth_login.tr()),
                  SizedBox(width: double.infinity, height: AppSize.s20.h),
                  CustomImage(Assets.images.login.path, height: AppSize.s400.h),
                  AppField(
                    controller: phone,
                    label: LocaleKeys.auth_phone.tr(),
                    keyboardType: TextInputType.number,
                    validator: Validator.phone,
                  ),
                  SizedBox(height: AppSize.s20.h),
                  AppField(
                    controller: password,
                    label: LocaleKeys.auth_password.tr(),
                    keyboardType: TextInputType.visiblePassword,
                    validator: Validator.password,
                  ),
                  SizedBox(height: AppSize.s20.h),
                  AppButton(
                    onPressed: _login,
                    isLoading: state.status.isLoading,
                    title: LocaleKeys.auth_login_button.tr(),
                  ),
                  AuthSwitchRow(
                    question: LocaleKeys.auth_no_account.tr(),
                    action: LocaleKeys.auth_create_account.tr(),
                    onTap: () => Navigator.maybePop(context),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
