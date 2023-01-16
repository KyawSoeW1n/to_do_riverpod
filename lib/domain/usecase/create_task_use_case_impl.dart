import 'package:to_do/domain/model/task.dart';
import 'package:to_do/domain/model/task_box.dart';
import 'package:to_do/domain/repo/task_repo.dart';
import 'package:to_do/domain/usecase/create_task_use_case.dart';

class CreateTaskUseCaseImpl implements CreateTaskUseCase {
  final TaskRepo _taskRepo;

  CreateTaskUseCaseImpl(this._taskRepo);

  @override
  Future<List<Task>> createTask(Task task) async {
    final List<Task> taskList = List.castFrom(TaskBox().getTaskList());
    taskList.add(task);
    await _taskRepo.createTask(taskList);
    return taskList;
  }
}
