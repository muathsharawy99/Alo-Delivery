import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';
import 'package:alo_delivery/gen/locale_keys.g.dart';

/// "Sorry — your account hasn't been activated yet".
class PendingDialog extends StatelessWidget {
  const PendingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        LocaleKeys.static_sorry.tr(),
        style: context.regular.copyWith(fontSize: FontSize.s20),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.auth_pending.tr(),
            style: context.regular.copyWith(fontSize: FontSize.s15),
          ).flexible(),
          SizedBox(width: AppSize.s8.w),
          Icon(Icons.warning_amber_rounded, color: context.primaryColor),
        ],
      ),
    );
  }
}
