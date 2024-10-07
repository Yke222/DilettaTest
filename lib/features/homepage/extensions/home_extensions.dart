import 'package:flutter/material.dart';

extension StarRatingExtension on double {
  List<Widget> buildStarIcons({
    int maxStars = 5,
    double iconSize = 16,
    Color color = Colors.yellow,
  }) {
    return List<Widget>.generate(maxStars, (index) {
      int starPosition = index + 1;
      if (this >= starPosition) {
        return Icon(Icons.star, color: color, size: iconSize);
      } else if (this >= starPosition - 0.5 && this < starPosition) {
        return Icon(Icons.star_half, color: color, size: iconSize);
      } else {
        return Icon(Icons.star_border, color: color, size: iconSize);
      }
    });
  }
}

extension ChipThemeExtension on BuildContext {
  ChipThemeData get chipTheme => Theme.of(this).chipTheme;
}
