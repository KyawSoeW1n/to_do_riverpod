import 'package:to_do/domain/model/task.dart';
import 'package:to_do/domain/model/task_list.dart';

abstract class TaskRepo {
  Future<TaskList> getTaskList();

  Future<List<Task>> createTask(List<Task> taskList);

  Future<List<Task>> updateTask(List<Task> taskList);
}

