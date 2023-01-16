import '../model/task.dart';

abstract class UpdateTaskUseCase {
  Future<List<Task>> updateTask(List<Task> taskList);
}