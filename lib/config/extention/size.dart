import 'dart:math';

import 'package:flutter/material.dart';

double setWidth(num width) => width * 1;
double setHeight(num height) => height * 1;
double radius(num r) => r * min(1, 1);

SizedBox setVerticalSpacing(num height) => SizedBox(height: setHeight(height));
SizedBox setHorizontalSpacing(num width) => SizedBox(width: setWidth(width));

extension SizeExtension on num {
  double get w => setWidth(this);

  double get h => setHeight(this);

  double get r => radius(this);

  SizedBox get verticalSpace => setVerticalSpacing(this);

  SizedBox get horizontalSpace => setHorizontalSpacing(this);
}
