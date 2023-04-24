import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'product/hive_constants.dart';

void main() async {
  Hive.initFlutter();
  await Hive.openBox(HiveConstants.todoBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
