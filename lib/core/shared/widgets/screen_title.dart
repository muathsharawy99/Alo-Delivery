import 'package:flutter/material.dart';

import '../../extensions/unified_extensions.dart';

/// Big purple page title.
class ScreenTitle extends StatelessWidget {
  const ScreenTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: context.bold.copyWith(
        fontSize: FontSize.s25,
        color: context.primaryColor,
      ),
    );
  }
}
