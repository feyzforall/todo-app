import 'package:flutter/material.dart';

import '../../product/colors.dart';

typedef TodoId = String;

class Todo {
  TodoId id;
  String title;
  String? description;
  bool isCompleted;
  Color? color;

  Todo({
    required this.id,
    required this.title,
    this.description,
    this.isCompleted = false,
    this.color = AppColors.slateBlue,
  });
}
