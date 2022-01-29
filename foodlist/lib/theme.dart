import 'package:flutter/material.dart';

class ThemeColors {
  static const primary = Colors.tealAccent;
  static const text = Colors.white;
  static const textLight = Colors.white70;
}

class ThemeTextStyles {
  static const bodyText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ThemeColors.text,
    height: 1.2,
  );

  static const headin6 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: ThemeColors.text,
    height: 1.2,
  );

  static const caption = TextStyle(
    fontSize: 12,
    color: ThemeColors.textLight,
    height: 1.2,
  );
}
