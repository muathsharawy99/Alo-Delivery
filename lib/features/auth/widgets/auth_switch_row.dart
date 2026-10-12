import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alo_delivery/core/extensions/unified_extensions.dart';

/// "Have an account? Login now" / "No account? Create one".
class AuthSwitchRow extends StatelessWidget {
  const AuthSwitchRow({
    super.key,
    required this.question,
    required this.action,
    required this.onTap,
  });

  final String question;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(question, style: context.regular.copyWith(fontSize: FontSize.s15)),
        TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size(AppSize.s10.w, AppSize.s50.h),
          ),
          child: Text(
            action,
            style: context.bold.copyWith(
              fontSize: FontSize.s15,
              color: context.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
