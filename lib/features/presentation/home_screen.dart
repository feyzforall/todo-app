import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../product/colors.dart';
import '../../product/dependency_injection.dart';
import '../../product/dimensions.dart';
import '../../product/hive_constants.dart';
import '../data/todo_repository.dart';
import '../domain/todo.dart';
import 'add_todo_screen.dart';
import 'widgets/completed_todo_card.dart';
import 'widgets/theme_switch_fab.dart';
import 'widgets/todo_card.dart';

class HomeScren extends StatefulWidget {
  const HomeScren({super.key});

  @override
  State<HomeScren> createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren> {
  late Box<Todo> todoBox;
  late Box<Todo> completedTodoBox;

  @override
  void initState() {
    super.initState();
    todoBox = Hive.box<Todo>(HiveConstants.todoBox);
    completedTodoBox = Hive.box<Todo>(HiveConstants.completedTodoBox);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingActionButton(context),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.pagePadding),
          child: ValueListenableBuilder(
            valueListenable: todoBox.listenable(),
            builder: (context, box, widget) => _body(),
          ),
        ),
      ),
    );
  }

  Widget _floatingActionButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ThemeSwitchFAB(),
        FloatingActionButton(
          heroTag: "addTodo",
          backgroundColor: AppColors.arsenic,
          child: const Icon(Icons.add, size: 40),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const AddTodoScreen(),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _body() {
    if (completedTodoBox.isEmpty) {
      return _todoSection();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 60, child: _todoSection()),
          Text(
            "TAMAMLANAN",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Divider(),
          Expanded(flex: 30, child: _completedTodos(todoBox)),
        ],
      );
    }
  }

  Widget _todoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "YAPILACAKLAR",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Divider(),
        todoBox.isNotEmpty
            ? _todos(todoBox)
            : Center(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      'Yapılacak bir şey yok',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontSize: 20,
                            color: AppColors.lightSilver,
                          ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }

  ListView _todos(Box<Todo> todoBox) {
    return ListView(
      shrinkWrap: true,
      children: [
        for (var todo in todoBox.values.where((element) => element.isCompleted == false).toList())
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) => getIt.get<TodoRepository>().deleteTodo(todo),
              child: TodoCard(todo: todo),
            ),
          )
      ],
    );
  }

  ListView _completedTodos(Box<Todo> todoBox) {
    return ListView(
      shrinkWrap: true,
      children: [
        for (var todo in completedTodoBox.values)
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: CompletedTodoCard(todo: todo),
          )
      ],
    );
  }
}
