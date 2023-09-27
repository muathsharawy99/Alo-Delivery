import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'back_button.dart';

class CustomSliverAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomSliverAppBar({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Size get preferredSize => Size.fromHeight(80.h);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      toolbarHeight: 80.h,
      leadingWidth: 0,
      title: Padding(
        padding: EdgeInsetsDirectional.only(
          start: 5.w,
        ),
        child: CustomBackButton(
          onTap: onTap,
        ),
      ),
    );
  }
}
