import 'package:hive/hive.dart';

import '../../product/hive_constants.dart';
import '../domain/todo.dart';

class TodoRepository {
  var todoBox = Hive.box<Todo>(HiveConstants.todoBox);
  var completedTodoBox = Hive.box<Todo>(HiveConstants.completedTodoBox);

  void addTodo(Todo todo) => todoBox.put(todo.id, todo);

  void deleteTodo(Todo todo) => todoBox.delete(todo.id);

  void updateTodo(Todo todo) {
    todoBox.delete(todo.id);
    todoBox.put(
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
    todoBox.delete(todo.id);
    if (todo.isFavorite) {
      todoBox.put(
        todo.id,
        todo.copyWith(
          todo: todo,
          isFavorite: false,
          isCompleted: todo.isCompleted,
        ),
      );
    } else {
      todoBox.put(
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
    todoBox.delete(todo.id);
    completedTodoBox.put(todo.id, todo);
  }
}
