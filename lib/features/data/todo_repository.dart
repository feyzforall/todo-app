import 'package:hive/hive.dart';

import '../../product/hive_constants.dart';
import '../domain/todo.dart';

class TodoRepository {
  var box = Hive.box<Todo>(HiveConstants.todoBox);

  void addTodo(Todo todo) => box.put(todo.id, todo);

  void deleteTodo(Todo todo) => box.deleteAt(0);

  void toggleFavorite(Todo todo) {
    box.delete(todo.id);
    if (todo.isFavorite) {
      box.put(todo.id, todo.copyWith(todo: todo, isFavorite: false));
    } else {
      box.put(todo.id, todo.copyWith(todo: todo, isFavorite: true));
    }
  }
}
