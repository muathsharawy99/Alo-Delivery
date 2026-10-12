import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/unified_extensions.dart';

/// Dropdown styled like [AppField].
class AppDropdownField<T> extends StatelessWidget {
  const AppDropdownField({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
    this.validator,
  });

  final String label;
  final Map<T, String> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String? Function(T?)? validator;

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppSize.radiusField.r),
    borderSide: BorderSide(color: color, width: AppSize.borderWidth.w),
  );

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      initialValue: value,
      onChanged: onChanged,
      validator: validator,
      items: [
        for (final e in items.entries)
          DropdownMenuItem<T>(
            value: e.key,
            child: Text(e.value, style: context.regular),
          ),
      ],
      decoration: InputDecoration(
        filled: true,
        fillColor: context.fieldFillColor,
        label: Text(label, style: context.regular),
        enabledBorder: _border(context.primaryColor),
        focusedBorder: _border(context.primaryColor),
        focusedErrorBorder: _border(context.primaryColor),
        errorBorder: _border(context.errorColor),
      ),
    );
  }
}
