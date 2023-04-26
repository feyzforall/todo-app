import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'features/domain/todo.dart';
import 'features/presentation/home_screen.dart';
import 'product/dependency_injection.dart' as injector;
import 'product/hive_constants.dart';
import 'product/theme.dart';

void main() async {
  await _initializeMethods();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

Future<void> _initializeMethods() async {
  WidgetsFlutterBinding.ensureInitialized();
  injector.init();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDirectory.path)
    ..registerAdapter(TodoAdapter());
  Hive.initFlutter();
  await Hive.openBox<Todo>(HiveConstants.todoBox);
  await Hive.openBox<Todo>(HiveConstants.completedTodoBox);
  await Hive.openBox<bool>(HiveConstants.themeBox);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<bool>(HiveConstants.themeBox).listenable(),
      builder: (BuildContext context, value, Widget? child) {
        var darkMode = Hive.box<bool>(HiveConstants.themeBox).get(HiveConstants.themeKey, defaultValue: false);
        return MaterialApp(
          title: 'TODO',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: darkMode! ? ThemeMode.dark : ThemeMode.light,
          home: const HomeScren(),
        );
      },
    );
  }
}
