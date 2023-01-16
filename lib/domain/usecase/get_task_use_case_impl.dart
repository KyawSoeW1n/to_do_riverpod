import 'package:to_do/domain/model/task_list.dart';

import '../repo/task_repo.dart';
import 'get_task_use_case.dart';

class GetTaskUseCaseImpl implements GetTaskUseCase {
  final TaskRepo _taskRepo;

  GetTaskUseCaseImpl(this._taskRepo);

  @override
  Future<TaskList> getTaskList() => _taskRepo.getTaskList();
}
