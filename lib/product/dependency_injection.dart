import 'package:get_it/get_it.dart';

import '../features/data/todo_repository.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerFactory<TodoRepository>(() => TodoRepository());
}
