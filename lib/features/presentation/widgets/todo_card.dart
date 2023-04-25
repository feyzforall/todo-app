import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../product/assets.dart';
import '../../../product/color_extension.dart';
import '../../../product/colors.dart';
import '../../../product/dependency_injection.dart';
import '../../data/todo_repository.dart';
import '../../domain/todo.dart';
import '../add_todo_screen.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AddTodoScreen(todo: todo),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          color: AppColors.cultured,
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      getIt.get<TodoRepository>().completeTodo(todo);
                    },
                    child: SvgPicture.asset(Assets.circleIcon),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _title(context),
                      _description(context),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () => getIt.get<TodoRepository>().addFavorite(todo),
                  child: SvgPicture.asset(
                    todo.isFavorite ? Assets.filledStarIcon : Assets.starIcon,
                    width: 20,
                  ),
                ),
                const SizedBox(width: 10),
                _colorBand(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      todo.title,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }

  Widget _description(BuildContext context) {
    if (todo.description != null && todo.description!.isNotEmpty) {
      return Text(
        todo.description!,
        style: Theme.of(context).textTheme.labelSmall,
      );
    } else {
      return const SizedBox();
    }
  }

  Container _colorBand() {
    return Container(
      width: 20,
      height: 55,
      decoration: BoxDecoration(
        color: todo.color.toColor(),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(7.0),
          bottomRight: Radius.circular(7.0),
        ),
      ),
    );
  }
}
