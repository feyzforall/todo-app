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
  @HiveField(5)
  DateTime createdDate;
  @HiveField(6)
  bool isFavorite;

  Todo({
    required this.id,
    required this.title,
    this.description,
    this.isCompleted = false,
    this.color = AppColors.slateBlueString,
    required this.createdDate,
    this.isFavorite = false,
  });

  Todo copyWith({required Todo todo, required bool isFavorite, required bool isCompleted}) => Todo(
        id: todo.id,
        title: todo.title,
        description: todo.description,
        isCompleted: isCompleted,
        createdDate: todo.createdDate,
        isFavorite: isFavorite,
        color: todo.color,
      );
}
