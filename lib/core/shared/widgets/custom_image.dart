import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Asset image by path (`Assets.images.x.path`): SVGs through flutter_svg,
/// anything else through [Image.asset].
class CustomImage extends StatelessWidget {
  const CustomImage(
    this.path, {
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.color,
  });

  final String path;
  final double? height, width;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (path.endsWith('.svg')) {
      return SvgPicture.asset(
        path,
        height: height,
        width: width,
        fit: fit,
        alignment: alignment,
        colorFilter: color == null
            ? null
            : ColorFilter.mode(color!, BlendMode.srcIn),
      );
    }
    return Image.asset(
      path,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment,
      color: color,
    );
  }
}
