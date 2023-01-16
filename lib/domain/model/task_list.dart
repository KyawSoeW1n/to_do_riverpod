import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:to_do/domain/model/task.dart';

part 'task_list.freezed.dart';

@freezed
class TaskList with _$TaskList {
  const factory TaskList({required List<Task> values}) = _TaskList;

  //
  const TaskList._();

  operator [](final int index) => values[index];

  int get length => values.length;

  TaskList addTask(final List<Task> taskList) => copyWith(values: taskList);

  TaskList updateTaskList(final List<Task> taskList) {
    return copyWith(values: taskList);
  }

  TaskList filterByCompleted() =>
      copyWith(values: values.where((todo) => todo.status).toList());

  TaskList filterByPending() =>
      copyWith(values: values.where((todo) => !todo.status).toList());
}
