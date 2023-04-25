import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../product/colors.dart';
import '../../product/dimensions.dart';
import '../../product/hive_constants.dart';
import '../domain/todo.dart';
import 'add_todo_screen.dart';
import 'widgets/todo_card.dart';

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
            builder: (context, box, widget) {
              return _homeScreenBody(todoBox);
            },
          ),
        ),
      ),
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.arsenic,
      child: const Icon(Icons.add, size: 40),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => const AddTodoScreen(),
          ),
        );
      },
    );
  }

  Widget _homeScreenBody(Box<Todo> todoBox) {
    if (todoBox.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "YAPILACAKLAR",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: todoBox.length,
              itemBuilder: (BuildContext context, int index) {
                var todo = todoBox.getAt(index);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: TodoCard(todo: todo!),
                );
              },
            ),
          ),
          Text(
            "TAMAMLANAN",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Divider(),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
