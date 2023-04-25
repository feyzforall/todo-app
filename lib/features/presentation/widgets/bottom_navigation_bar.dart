import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../product/colors.dart';
import '../../application/color_notifier.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      width: MediaQuery.of(context).size.width,
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _colorRow(),
          TextButton(
            onPressed: () {
              onPressed();
            },
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }

  Row _colorRow() {
    return Row(
      children: [
        for (var color in AppColors.todoColors.entries)
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return GestureDetector(
                  onTap: () {
                    ref.read(colorProvider.notifier).selectColor(color);
                  },
                  child: AnimatedContainer(
                    width: color.key == ref.watch(colorProvider).key ? 30 : 25,
                    height: color.key == ref.watch(colorProvider).key ? 30 : 25,
                    decoration: BoxDecoration(
                      color: color.value,
                      shape: BoxShape.circle,
                    ),
                    duration: const Duration(milliseconds: 300),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
