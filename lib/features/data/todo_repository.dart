import 'package:hive/hive.dart';

import '../../product/hive_constants.dart';
import '../domain/todo.dart';

class TodoRepository {
  var box = Hive.box<Todo>(HiveConstants.todoBox);

  void addTodo(Todo todo) => box.put(todo.id, todo);

  void deleteTodo(Todo todo) => box.deleteAt(0);

  void updateTodo(Todo todo) {
    box.delete(todo.id);
    box.put(
      todo.id,
      todo.copyWith(
        todo: todo,
        isFavorite: todo.isFavorite,
        isCompleted: todo.isCompleted,
      ),
    );
  }

  // TODO : isCompleted ve isFavorite için iki farklı copyWith
  // tarzı metod yazılabilir. Bu biraz saçma geldi, bakacağız.
  void addFavorite(Todo todo) {
    box.delete(todo.id);
    if (todo.isFavorite) {
      box.put(
        todo.id,
        todo.copyWith(
          todo: todo,
          isFavorite: false,
          isCompleted: todo.isCompleted,
        ),
      );
    } else {
      box.put(
        todo.id,
        todo.copyWith(
          todo: todo,
          isFavorite: true,
          isCompleted: todo.isCompleted,
        ),
      );
    }
  }

  void completeTodo(Todo todo) {
    box.delete(todo.id);
    box.put(
      todo.id,
      todo.copyWith(
        todo: todo,
        isFavorite: todo.isFavorite,
        isCompleted: true,
      ),
    );
    print(todo.isCompleted);
  }
}
