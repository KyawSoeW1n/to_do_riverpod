import 'package:to_do/domain/model/task_list.dart';

abstract class GetTaskUseCase {
  Future<TaskList> getTaskList();
}
