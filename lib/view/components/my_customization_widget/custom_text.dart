import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.textAlign,
     this.fontSize,
    this.color,
    this.fontWeight,
    this.fontStyle,
  });

  final String text;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.rtl,
      overflow: overflow,
      softWrap: softWrap,
      maxLines: maxLines,
      textAlign: textAlign,
      style: GoogleFonts.montserrat(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      ),
    );
  }
}
