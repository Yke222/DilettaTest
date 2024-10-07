import 'package:flutter/material.dart';

class AppTheme {
  static const _textStyleH1 = TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
        height: 0.888,
        letterSpacing: 0.0,
      );

  static const _textStyleH2 = TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
        height: 1,
        letterSpacing: 0.0,
      );

  static const _textStyleH3 = TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        height: 1.333,
        letterSpacing: 0.0,
      );

  static const _textStyleH4 = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
        height: 1.2,
        letterSpacing: 0.0,
      );

  static const _textStyleSubtitle1 = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        height: 1.333,
      );

  static const _textStyleSubtitle2 = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
        height: 1.333,
      );

  static const _textStyleBody1 = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
        height: 1.25,
        letterSpacing: 0.0,
      );

  static const _textStyleBody2 = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        height: 1.25,
      );

  static const _textStyleBody3 = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
        height: 1.25,
        letterSpacing: 0.0,
      );

  static const _textStyleCaption1 = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
        height: 1.285,
        letterSpacing: 0.0,
      );

  static const _textStyleCaption2 = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        height: 1.285,
        letterSpacing: 0.0,
      );

  static const _textStyleOverline = TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        height: 1.166,
        letterSpacing: 0.0,
      );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF000A0A),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF000A0A),
      elevation: 0,
    ),
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      displayLarge: _textStyleH1,
      displayMedium: _textStyleH2,
      displaySmall: _textStyleH3,
      headlineMedium: _textStyleH4,
      titleMedium: _textStyleSubtitle1,
      titleSmall: _textStyleSubtitle2,
      bodyLarge: _textStyleBody1,
      bodyMedium: _textStyleBody2,
      bodySmall: _textStyleBody3,
      labelLarge: _textStyleCaption1,
      labelMedium: _textStyleCaption2,
      labelSmall: _textStyleOverline,
    ),
  );

  static TextStyle? textStyleH1(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge;
  }

  static TextStyle? textStyleH2(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium;
  }

  static TextStyle? textStyleH3(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall;
  }

  static TextStyle? textStyleH4(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium;
  }

  static TextStyle? textStyleSubtitle1(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium;
  }

  static TextStyle? textStyleSubtitle2(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall;
  }

  static TextStyle? textStyleBody1(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge;
  }

  static TextStyle? textStyleBody2(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium;
  }

  static TextStyle? textStyleBody3(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall;
  }

  static TextStyle? textStyleCaption1(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge;
  }

  static TextStyle? textStyleCaption2(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium;
  }

  static TextStyle? textStyleOverlay(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall;
  }
}