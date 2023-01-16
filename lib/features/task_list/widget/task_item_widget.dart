import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/model/task.dart';
import '../../../presentation/viewmodel/task_list_viewmodel.dart';

final _todoListProvider = taskListViewModelStateNotifierProvider;

class TaskItemWidget extends ConsumerWidget {
  final Task task;

  const TaskItemWidget(this.task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text(task.description),
      trailing: task.status
          ? null
          : IconButton(
              splashRadius: 14,
              onPressed: () {
                ref.watch(_todoListProvider.notifier).updateTask(task);
              },
              icon: const Icon(
                Icons.check,
                color: Colors.green,
              ),
            ),
    );
  }
}
