import 'package:to_do/domain/model/task.dart';

abstract class CreateTaskUseCase {
  Future<List<Task>> createTask(Task task);
}
