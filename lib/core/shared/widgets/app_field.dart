import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/unified_extensions.dart';

/// Filled field with the purple outline. [TextInputType.visiblePassword]
/// is obscured with an eye toggle.
class AppField extends StatefulWidget {
  const AppField({
    super.key,
    required this.controller,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.readOnly = false,
    this.width,
    this.alignLabelWithHint,
  });

  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final int maxLines;
  final bool readOnly;
  final double? width;
  final bool? alignLabelWithHint;

  @override
  State<AppField> createState() => _AppFieldState();
}

class _AppFieldState extends State<AppField> {
  bool _showPassword = false;

  bool get _isPassword => widget.keyboardType == TextInputType.visiblePassword;

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppSize.radiusField.r),
    borderSide: BorderSide(color: color, width: AppSize.borderWidth.w),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.readOnly ? TextInputType.none : widget.keyboardType,
        readOnly: widget.readOnly,
        obscureText: _isPassword && !_showPassword,
        validator: widget.validator,
        onChanged: widget.onChanged,
        maxLines: widget.maxLines,
        style: context.regular,
        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        decoration: InputDecoration(
          filled: true,
          fillColor: context.fieldFillColor,
          alignLabelWithHint: widget.alignLabelWithHint,
          label: Text(widget.label, style: context.regular),
          enabledBorder: _border(context.primaryColor),
          focusedBorder: _border(context.primaryColor),
          focusedErrorBorder: _border(context.primaryColor),
          errorBorder: _border(context.errorColor),
          suffixIcon: _isPassword
              ? IconButton(
                  onPressed: () =>
                      setState(() => _showPassword = !_showPassword),
                  icon: Icon(
                    _showPassword ? Icons.visibility_off : Icons.visibility,
                    size: AppSize.s28.w,
                    color: _showPassword
                        ? context.activeIconColor
                        : context.hintColor,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
