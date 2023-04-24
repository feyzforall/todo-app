import 'package:flutter/material.dart';

import '../../../product/colors.dart';

const List<Color> todoColors = [
  AppColors.tartOrange,
  AppColors.slateBlue,
  AppColors.darkOrchid,
  AppColors.mountainMeadow,
];

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      width: MediaQuery.of(context).size.width,
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              for (var color in todoColors)
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(),
                    ),
                  ),
                ),
            ],
          ),
          TextButton(
            onPressed: () {
              onPressed();
            },
            child: Text(
              'Ekle',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
