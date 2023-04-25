import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../product/assets.dart';
import '../../../product/colors.dart';
import '../../domain/todo.dart';
import '../completed_todo_screen.dart';

class CompletedTodoCard extends StatelessWidget {
  const CompletedTodoCard({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CompletedTodoScreen(todo: todo),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          color: AppColors.lightSilver,
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Row(
          children: [
            const SizedBox(width: 15),
            SvgPicture.asset(Assets.checkIcon),
            const SizedBox(width: 15),
            Text(
              todo.title,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.silverFoil,
                    decoration: TextDecoration.lineThrough,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
