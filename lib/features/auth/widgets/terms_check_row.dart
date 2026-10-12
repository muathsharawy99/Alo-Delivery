import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

/// Checkbox + "I agree to the terms of use" (the terms open in a dialog).
class TermsCheckRow extends StatelessWidget {
  const TermsCheckRow({super.key, required this.value, required this.onChanged});

  final bool value;
  final VoidCallback onChanged;

  void _showTerms(BuildContext context) => showAppDialog(
    CupertinoAlertDialog(
      title: Text(
        LocaleKeys.auth_terms.tr(),
        style: context.regular.copyWith(fontSize: FontSize.s20),
      ),
      content: Text(
        LocaleKeys.auth_terms_body.tr(),
        style: context.regular.copyWith(fontSize: FontSize.s15),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (_) => onChanged(),
          activeColor: context.primaryColor,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              LocaleKeys.auth_agree_to.tr(),
              style: context.regular.copyWith(fontSize: FontSize.s15),
            ),
            TextButton(
              onPressed: () => _showTerms(context),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size(AppSize.s10.w, AppSize.s50.h),
              ),
              child: Text(
                LocaleKeys.auth_terms.tr(),
                style: context.bold.copyWith(
                  fontSize: FontSize.s15,
                  color: context.primaryColor,
                ),
              ),
            ),
          ],
        ).flexible(),
      ],
    ).withPadding(end: AppSize.s5.w, top: AppSize.s5.w);
  }
}
