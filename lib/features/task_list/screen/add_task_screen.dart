import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do/presentation/viewmodel/add_task_viewmodel.dart';

import '../widget/text_form_field_widget.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  late final AddTaskViewModel _addTaskViewModel;

  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _addTaskViewModel = ref.read(todoFormViewModelProvider(null));
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormFieldWidget(
                  "Enter Title",
                  "Title",
                  "Please enter title",
                  titleController,
                ),
                TextFormFieldWidget(
                  "Enter description",
                  "description",
                  "Please enter description",
                  descriptionController,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState == null) {
              return;
            }
            if (_formKey.currentState!.validate()) {
              _addTaskViewModel
                  .setTitle(titleController.text.toString().trim());
              _addTaskViewModel
                  .setDescription(descriptionController.text.toString().trim());
              _addTaskViewModel.addTask();
              context.go('/');
            }
          },
          child: const Text("Save"),
        ),
      ),
    );
  }
}
