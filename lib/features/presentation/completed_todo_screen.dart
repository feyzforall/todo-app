import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../product/assets.dart';
import '../../product/colors.dart';
import '../../product/dimensions.dart';
import '../domain/todo.dart';
import 'widgets/leading_button.dart';

class CompletedTodoScreen extends StatelessWidget {
  const CompletedTodoScreen({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightSilver,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.lightSilver,
        leading: const LeadingButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  todo.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                ),
                SvgPicture.asset(Assets.checkIcon),
              ],
            ),
            const Divider(),
            Text(
              todo.description ?? "",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
