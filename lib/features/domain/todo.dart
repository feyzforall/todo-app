import 'package:hive/hive.dart';

import '../../product/colors.dart';
import '../../product/hive_constants.dart';

part 'todo.g.dart';

typedef TodoId = String;

@HiveType(typeId: HiveConstants.todoTypeId)
class Todo extends HiveObject {
  @HiveField(0)
  TodoId id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  bool isCompleted;
  @HiveField(4)
  String color;

  Todo({
    required this.id,
    required this.title,
    this.description,
    this.isCompleted = false,
    this.color = AppColors.slateBlueString,
  });
}
