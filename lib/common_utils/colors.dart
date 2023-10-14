import 'package:flutter/material.dart';

int hexToInt(String hex) {
  return int.parse(hex.replaceAll("#", "0xFF"));
}

class AppColors {
  static Color scaffoldBackground = Color(hexToInt('#212121')).withOpacity(0.5);
  static Color appbarBackground = Color(hexToInt('#3E3E3E')).withOpacity(0.3);
  static Color bottomSheetBg = Color(hexToInt('#444147'));

  static Color primary = Color(hexToInt('#F1FE87'));
  static Color secondary = Color(hexToInt('#B8A9C6'));
  static Color teritiary = Color(hexToInt('#EAEAEA'));
  static Color text = Colors.white;

  static Color cardPrimary = Color(hexToInt('#B2D0CE'));

  static Color secondaryText = Color(hexToInt('#B2D0CE'));

  static Color textfield = Color(hexToInt('#545353'));
  static Color cardBackground = Color(hexToInt('#252626'));
}