import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../product/hive_constants.dart';
import '../domain/todo.dart';

class HomeScren extends StatefulWidget {
  const HomeScren({super.key});

  @override
  State<HomeScren> createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren> {
  late Box<Todo> todoBox;

  @override
  void initState() {
    super.initState();
    todoBox = Hive.box<Todo>(HiveConstants.todoBox);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: ValueListenableBuilder(
        valueListenable: todoBox.listenable(),
        builder: (context, box, widget) {
          return _homeScreenBody(todoBox);
        },
      ),
    );
  }

  Widget _homeScreenBody(Box<Todo> todoBox) {
    if (todoBox.isNotEmpty) {
      return ListView.builder(
        itemCount: todoBox.length,
        itemBuilder: (BuildContext context, int index) {
          var todo = todoBox.getAt(index);
          return ListTile(
            title: Text(todo!.title),
          );
        },
      );
    } else {
      return const SizedBox();
    }
  }
}
