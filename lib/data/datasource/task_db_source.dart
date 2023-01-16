import '../../domain/model/task.dart';

abstract class TaskDBSource {
  Future<void> createTask(final List<Task> taskList);

  Future<List<Task>> getTaskList();
}
