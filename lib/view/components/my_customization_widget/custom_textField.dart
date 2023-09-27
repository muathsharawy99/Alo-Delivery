import 'package:alo_delivery/view/components/my_customization_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final double? width;
  final double? height;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final double? radius;
  final int? maxLines;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool? readOnly;
  final bool? obscureText;
  final bool? filled;
  final bool? alignLabelWithHint;
  final Color? fillColor;
  final String? label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final String? Function(String? v)? validator;
  final TextInputAction? whatToDoNext;
  final BorderSide? borderSideOnEnabled;
  final BorderSide? borderSideOnFocusedError;
  final BorderSide? borderSideOnError;
  final BorderSide? borderSideOnFocus;
  final Function()? onTap;

  const CustomTextField({
    Key? key,
    this.radius,
    this.readOnly,
    this.obscureText,
    this.filled,
    this.fillColor,
    this.label,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.validator,
    this.whatToDoNext,
    this.onTap,
    required this.controller,
    required this.keyboardType,
    this.textDirection,
    this.textAlign,
    this.borderSideOnEnabled,
    this.borderSideOnFocusedError,
    this.borderSideOnError,
    this.borderSideOnFocus,
    this.width,
    this.height,
    this.maxLines,
    this.alignLabelWithHint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Material(
        borderRadius: BorderRadius.circular(
          radius ?? 0.r,
        ),
        child: Directionality(
          textDirection: textDirection ?? TextDirection.rtl,
          child: TextFormField(
            textAlign: textAlign ?? TextAlign.start,
            onTap: onTap,
            controller: controller,
            keyboardType: keyboardType,
            readOnly: readOnly ?? false,
            obscureText: obscureText ?? false,
            validator: validator,
            textInputAction: whatToDoNext,
            maxLines: maxLines ?? 1,
            onFieldSubmitted: (v) => FocusScope.of(context).nextFocus(),
            decoration: InputDecoration(
              alignLabelWithHint: alignLabelWithHint,
              filled: filled,
              fillColor: fillColor,
              label: CustomText(
                text: label ?? "",
              ),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: borderSideOnEnabled ?? const BorderSide(),
                borderRadius: BorderRadius.circular(
                  radius ?? 0.r,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: borderSideOnError ?? const BorderSide(),
                borderRadius: BorderRadius.circular(
                  radius ?? 0.r,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: borderSideOnFocusedError ?? const BorderSide(),
                borderRadius: BorderRadius.circular(
                  radius ?? 0.r,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: borderSideOnFocus ?? const BorderSide(),
                borderRadius: BorderRadius.circular(
                  radius ?? 0.r,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
