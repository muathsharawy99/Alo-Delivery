import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAssets extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  final Clip? clipBehavior;
  final BoxFit? fit;
  final AlignmentDirectional? alignment;

  const SvgAssets({
    super.key,
    required this.path,
    this.height,
    this.width,
    this.clipBehavior,
    this.fit,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      fit: fit ?? BoxFit.contain,
      alignment: alignment ?? Alignment.center,
      height: height,
      width: width,
      clipBehavior: clipBehavior ?? Clip.hardEdge,
    );
  }
}
