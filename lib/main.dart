import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'features/domain/todo.dart';
import 'features/presentation/home_screen.dart';
import 'product/dependency_injection.dart' as injector;
import 'product/hive_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injector.init();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDirectory.path)
    ..registerAdapter(TodoAdapter());
  Hive.initFlutter();
  await Hive.openBox<Todo>(HiveConstants.todoBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO',
      home: HomeScren(),
    );
  }
}
