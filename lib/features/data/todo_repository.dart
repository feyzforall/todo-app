import 'package:hive/hive.dart';

import '../../product/hive_constants.dart';
import '../domain/todo.dart';

class TodoRepository {
  var box = Hive.box(HiveConstants.todoBox);

  void addTodo(Todo todo) => box.put(todo.id, todo);

  void deleteTodo(Todo todo) => box.delete(todo.id);
}
