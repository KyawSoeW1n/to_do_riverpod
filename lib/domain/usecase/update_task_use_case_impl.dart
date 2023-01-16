import 'package:to_do/domain/model/task.dart';
import 'package:to_do/domain/usecase/update_task_use_case.dart';

import '../repo/task_repo.dart';

class UpdateTaskUseCaseImpl implements UpdateTaskUseCase {
  final TaskRepo _taskRepo;

  UpdateTaskUseCaseImpl(this._taskRepo);

  @override
  Future<List<Task>> updateTask(List<Task> taskList) async {
    await _taskRepo.updateTask(taskList);
    return taskList;
  }
}
