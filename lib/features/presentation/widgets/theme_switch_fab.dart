import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../product/colors.dart';
import '../../../product/hive_constants.dart';
import '../../application/theme_notifier.dart';

class ThemeSwitchFAB extends StatelessWidget {
  const ThemeSwitchFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return ValueListenableBuilder(
          valueListenable: Hive.box<bool>(HiveConstants.themeBox).listenable(),
          builder: (BuildContext context, box, Widget? child) {
            return Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  FloatingActionButton(
                    heroTag: "switchThemeOne",
                    mini: true,
                    backgroundColor: box.get(HiveConstants.themeKey)! ? AppColors.arsenic : AppColors.lightGray,
                    onPressed: () {
                      ref.read(themeProvider.notifier).toggle();
                    },
                  ),
                  Visibility(
                    visible: ref.watch(themeProvider),
                    child: FloatingActionButton(
                      mini: true,
                      heroTag: "switchThemeTwo",
                      backgroundColor: box.get(HiveConstants.themeKey)! ? AppColors.lightGray : AppColors.arsenic,
                      onPressed: () {
                        ref.read(themeProvider.notifier).toggle();
                        Hive.box<bool>(HiveConstants.themeBox).put(HiveConstants.themeKey, !box.get(HiveConstants.themeKey)!);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
