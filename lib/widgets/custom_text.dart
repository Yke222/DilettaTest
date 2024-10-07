import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.description,
      this.fontSize = 16,
      this.fontWeight = FontWeight.normal,
      this.maxLines,
      this.color});

  final String description;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: GoogleFonts.sourceSans3(fontSize: fontSize, fontWeight: fontWeight, color: color),
      maxLines: maxLines,
    );
  }
}
