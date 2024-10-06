import 'package:flutter/material.dart';

import 'colors.dart';

const _primaryFont = 'OpenSans';

class AppTypography extends TextTheme {
  final _defaultTextStyle = const TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    fontFamily: _primaryFont,
    height: 1.5,
    leadingDistribution: TextLeadingDistribution.even,
  );

  @override
  TextStyle? get displayLarge => _defaultTextStyle.copyWith(
        fontSize: 52,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle? get displayMedium => _defaultTextStyle.copyWith(
        fontSize: 40,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle? get displaySmall => _defaultTextStyle.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle? get headlineLarge => _defaultTextStyle.copyWith(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle? get headlineMedium => _defaultTextStyle.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle? get headlineSmall => _defaultTextStyle.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle? get titleLarge => _defaultTextStyle.copyWith(
        fontSize: 18,
      );

  @override
  TextStyle? get titleMedium => _defaultTextStyle.copyWith(
        fontSize: 16,
      );

  @override
  TextStyle? get titleSmall => _defaultTextStyle.copyWith(
        fontSize: 12,
      );

  @override
  TextStyle? get labelLarge => _defaultTextStyle.copyWith(
        fontSize: 14,
      );

  @override
  TextStyle? get labelMedium => _defaultTextStyle.copyWith(
        fontSize: 12,
      );

  @override
  TextStyle? get labelSmall => _defaultTextStyle.copyWith(
        fontSize: 10,
      );

  @override
  TextStyle? get bodyLarge => _defaultTextStyle.copyWith(
        fontSize: 12,
      );

  @override
  TextStyle? get bodyMedium => _defaultTextStyle.copyWith(
        fontSize: 11,
      );

  @override
  TextStyle? get bodySmall => _defaultTextStyle.copyWith(
        fontSize: 10,
      );
}
