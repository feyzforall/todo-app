import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/colors.dart';

final colorProvider = StateNotifierProvider<ColorNotifier, MapEntry<String, Color>>(
  (_) => ColorNotifier(),
);

class ColorNotifier extends StateNotifier<MapEntry<String, Color>> {
  ColorNotifier() : super(AppColors.todoColors.entries.first);

  void selectColor(MapEntry<String, Color> color) {
    state = color;
  }
}
