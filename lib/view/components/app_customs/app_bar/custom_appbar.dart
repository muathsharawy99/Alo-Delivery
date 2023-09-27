import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.showProfile,
  });

  final bool showProfile;

  @override
  Size get preferredSize => Size.fromHeight(80.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      toolbarHeight: 80.h,
      leadingWidth: 0,
      title: Padding(
        padding: EdgeInsetsDirectional.only(
          start: 5.w,
        ),
        child: const CustomBackButton(),
      ),
      actions: [
        if (showProfile == true)
          Padding(
            padding: EdgeInsetsDirectional.only(
              end: 20.w,
            ),
            child: CircleAvatar(
              backgroundImage: Image.network(
                "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              ).image,
            ),
          )
      ],
    );
  }
}
