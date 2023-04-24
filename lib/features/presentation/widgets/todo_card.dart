import 'package:flutter/material.dart';

import '../../../product/color_extension.dart';
import '../../domain/todo.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      decoration: BoxDecoration(
        color: todo.color.toColor(),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.circle_outlined,
            size: 32,
            color: Colors.white,
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(todo.title),
              todo.description != null ? Text(todo.description!) : const SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}
