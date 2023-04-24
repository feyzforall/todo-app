import 'package:flutter/material.dart';

import '../../product/colors.dart';
import '../../product/dimensions.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

const List<Color> todoColors = [
  AppColors.tartOrange,
  AppColors.slateBlue,
  AppColors.darkOrchid,
  AppColors.mountainMeadow,
];

class _AddTodoScreenState extends State<AddTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.chevron_left_outlined),
          color: Colors.black,
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.pagePadding),
        child: Column(
          children: [
            TextField(
              maxLength: 25,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.circle_outlined,
                  color: AppColors.lightGray,
                ),
                border: InputBorder.none,
                counterText: "",
                hintText: "Ne Yapılacak",
                hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.lightGray,
                    ),
              ),
            ),
            const Divider(),
            SizedBox(
              child: TextFormField(
                scrollPhysics: const NeverScrollableScrollPhysics(),
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 15,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _bottomNavigationBar(BuildContext context) {
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
          Text(
            'Ekle',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
