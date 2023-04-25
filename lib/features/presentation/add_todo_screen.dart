import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../product/colors.dart';
import '../../product/dependency_injection.dart';
import '../../product/dimensions.dart';
import '../application/color_notifier.dart';
import '../data/todo_repository.dart';
import '../domain/todo.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'widgets/leading_button.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key, this.todo});

  final Todo? todo;

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    titleController = TextEditingController(text: widget.todo?.title);
    descriptionController = TextEditingController(text: widget.todo?.description);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const LeadingButton(),
      ),
      bottomNavigationBar: Consumer(
        builder: (context, ref, child) => CustomBottomNavigationBar(
          text: widget.todo != null ? "Kaydet" : "Ekle",
          onPressed: () {
            widget.todo == null ? _addTodo(ref) : _updateTodo(ref, widget.todo!);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.pagePadding),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _titleField(context),
              const Divider(),
              _descriptionField(context),
            ],
          ),
        ),
      ),
    );
  }

  void _addTodo(WidgetRef ref) {
    if (_formKey.currentState!.validate()) {
      var uuid = const Uuid();
      getIt.get<TodoRepository>().addTodo(
            Todo(
              id: uuid.v1(),
              title: titleController.text,
              description: descriptionController.text,
              createdDate: DateTime.now(),
              color: ref.watch(colorProvider).key,
            ),
          );
      Navigator.of(context).pop();
    }
  }

  void _updateTodo(WidgetRef ref, Todo todo) {
    if (_formKey.currentState!.validate()) {
      getIt.get<TodoRepository>().updateTodo(
            Todo(
              id: todo.id,
              title: titleController.text,
              description: descriptionController.text,
              createdDate: todo.createdDate,
              color: ref.watch(colorProvider).key,
            ),
          );
      Navigator.of(context).pop();
    }
  }

  TextFormField _titleField(BuildContext context) {
    return TextFormField(
      maxLength: 25,
      controller: titleController,
      style: Theme.of(context).textTheme.headlineSmall,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
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
    );
  }

  TextField _descriptionField(BuildContext context) {
    return TextField(
      controller: descriptionController,
      scrollPhysics: const NeverScrollableScrollPhysics(),
      textInputAction: TextInputAction.newline,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 15,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Açıklama',
        hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.lightGray,
            ),
      ),
    );
  }
}
