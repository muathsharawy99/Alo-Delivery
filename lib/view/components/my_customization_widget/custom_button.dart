import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color? bGColor;
  final double? elevation;
  final double? radius;
  final double? width;
  final double? height;
  final Color? borderColor;
  final double? borderWidth;
  final double? strokeAlign;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.bGColor,
    this.elevation,
    this.radius,
    this.width,
    this.height,
    this.borderColor,
    this.borderWidth,
    this.strokeAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                radius ?? 0.r,
              ),
              side: BorderSide(
                color: borderColor ?? const Color(0xFF000000),
                width: borderWidth ?? 0,
                strokeAlign: strokeAlign ?? BorderSide.strokeAlignInside,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color?>(bGColor),
          elevation: MaterialStateProperty.all<double?>(elevation),
        ),
        child: child,
      ),
    );
  }
}
