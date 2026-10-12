import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

import '../../../widgets/auth_switch_row.dart';
import '../../../widgets/terms_check_row.dart';

/// Shared sign-up page body: title, the account's [fields] (20h apart),
/// terms checkbox, "Create" and the link to login.
class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required this.formKey,
    required this.type,
    required this.fields,
    required this.termsAccepted,
    required this.onToggleTerms,
    required this.onCreate,
    required this.isLoading,
  });

  final GlobalKey<FormState> formKey;
  final UserType type;
  final List<Widget> fields;
  final bool termsAccepted;
  final VoidCallback onToggleTerms;
  final VoidCallback onCreate;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: EdgeInsetsDirectional.all(AppSize.screenPadding.w),
        child: Column(
          children: [
            ScreenTitle(LocaleKeys.auth_create_account.tr()),
            SizedBox(height: AppSize.s20.h, width: double.infinity),
            for (final field in fields) ...[
              field,
              SizedBox(height: AppSize.s20.h),
            ],
            TermsCheckRow(value: termsAccepted, onChanged: onToggleTerms),
            AppButton(
              onPressed: onCreate,
              isLoading: isLoading,
              title: LocaleKeys.auth_create.tr(),
            ),
            AuthSwitchRow(
              question: LocaleKeys.auth_have_account.tr(),
              action: LocaleKeys.auth_login_now.tr(),
              onTap: () => push(NamedRoutes.login, arg: {RouteString.type: type}),
            ),
          ],
        ),
      ),
    );
  }
}
