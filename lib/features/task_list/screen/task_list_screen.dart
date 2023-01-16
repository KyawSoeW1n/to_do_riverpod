import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do/constant/routes/app_routes.dart';
import 'package:to_do/domain/model/task_list.dart';

import '../../../presentation/viewmodel/task_filter_provider.dart';
import '../../../presentation/viewmodel/task_list_viewmodel.dart';
import '../widget/task_item_widget.dart';

class TaskListScreen extends StatelessWidget {
  final _filteredTodoListProvider = filterTaskProvider;

  TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do"),
      ),
      body: Column(
        children: [
          GGButton(),
          Expanded(
            child: Consumer(
              builder: (context, ref, _) {
                return ref.watch(_filteredTodoListProvider).maybeWhen(
                      success: (content) => _buildTaskList(ref, content),
                      error: (_) => const Text("Error"),
                      orElse: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(),
    );
  }

  Widget _buildTaskList(WidgetRef ref, TaskList taskList) {
    return ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (context, i) {
        return TaskItemWidget(
          taskList[i],
        );
      },
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final _provider = filterKindViewModelStateNotifierProvider;

  CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final viewModel = ref.watch(_provider.notifier);
      ref.watch(_provider);
      return viewModel.isFilteredByPending()
          ? FloatingActionButton(
              child: const Icon(
                Icons.add,
              ),
              onPressed: () => context.go("/${Routes.addTask}"),
            )
          : Container();
    });
  }
}

class GGButton extends StatelessWidget {
  final _provider = filterKindViewModelStateNotifierProvider;

  GGButton({super.key});

  @override
  Widget build(final BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final viewModel = ref.watch(_provider.notifier);
        ref.watch(_provider);
        return Row(
          children: [
            Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () {
                  viewModel.filterByPending();
                },
                child: const Text("Pending"),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () {
                  viewModel.filterByCompleted();
                },
                child: const Text("Done"),
              ),
            ),
          ],
        );
      },
    );
  }
}
