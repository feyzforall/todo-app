import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _appColors = AppColors._internal();

  factory AppColors() {
    return _appColors;
  }

  AppColors._internal();

  static const String slateBlueString = "6661DC";
  static const Color slateBlue = Color(0xFF6661DC);
  static const Color tartOrange = Color(0xFFF54747);
  static const Color darkOrchid = Color(0xFFAE34D9);
  static const Color mountainMeadow = Color(0xFF31BB92);
  static const Color arsenic = Color(0xFF38374C);
  static const Color lightGray = Color(0xFFD3D3D3);
}
