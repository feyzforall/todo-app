import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _appColors = AppColors._internal();

  factory AppColors() {
    return _appColors;
  }

  AppColors._internal();

  static const Color slateBlue = Color(0xFF6661DC);
}
