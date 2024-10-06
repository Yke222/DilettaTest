import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'typography.dart';

const fontFamily = 'OpenSans';

class AppTheme {
  static ThemeData light({
    Color primaryColor = AppColors.primary,
    Color secondaryColor = AppColors.secondary,
    Color scaffoldBackgroundColor = Colors.white,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return ThemeData(
      primaryColor: primaryColor,
      hoverColor: Colors.white,
      focusColor: Colors.white,
      highlightColor: Colors.white,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      primaryTextTheme: AppTypography(),
      disabledColor: primaryColor.withOpacity(0.4),
      appBarTheme: AppBarTheme(
        color: scaffoldBackgroundColor,
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        toolbarTextStyle: AppTypography().bodyMedium,
        titleTextStyle: AppTypography().titleLarge,
      ),
      textTheme: AppTypography(),
      buttonTheme: const ButtonThemeData(
        height: 48,
        textTheme: ButtonTextTheme.primary,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
      ).copyWith(
        primaryContainer: MaterialColor(
          primaryColor.value,
          {
            50: primaryColor.withOpacity(.1),
            100: primaryColor.withOpacity(.2),
            200: primaryColor.withOpacity(.3),
            300: primaryColor.withOpacity(.4),
            400: primaryColor.withOpacity(.5),
            500: primaryColor.withOpacity(.6),
            600: primaryColor.withOpacity(.7),
            700: primaryColor.withOpacity(.8),
            800: primaryColor.withOpacity(.9),
            900: primaryColor.withOpacity(1),
          },
        ),
        error: AppColors.danger,
      ),
    );
  }
}
