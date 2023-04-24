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
      padding: const EdgeInsets.all(6.0),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(context),
              _description(context),
            ],
          )
        ],
      ),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      todo.title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.white,
          ),
    );
  }

  Widget _description(BuildContext context) {
    if (todo.description != null && todo.description!.isNotEmpty) {
      return Text(
        todo.description!,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w200,
            ),
      );
    } else {
      return const SizedBox();
    }
  }
}
