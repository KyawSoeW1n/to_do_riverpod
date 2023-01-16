import 'package:hive/hive.dart';

// import 'package:to_do/data/datasource/task_db_source.dart';
import 'package:to_do/domain/model/task.dart';
import 'package:to_do/domain/model/task_box.dart';
import 'package:to_do/domain/model/task_list.dart';
import 'package:to_do/domain/repo/task_repo.dart';

import '../../constant/keys/app_keys.dart';
import '../datasource/task_db_source.dart';

class TaskRepoImpl extends TaskRepo {
  final TaskDBSource taskDBSource;

  TaskRepoImpl(this.taskDBSource);

  @override
  Future<List<Task>> createTask(List<Task> taskList) async {
    if (!Hive.box(AppKeys.taskBox).isOpen) {
      await Hive.openBox(AppKeys.taskList);
    }

    await TaskBox().addTaskList(taskList);
    return taskList;
  }

  @override
  Future<TaskList> getTaskList() async {
    return TaskList(values: List.castFrom(TaskBox().getTaskList()));
  }

  @override
  Future<List<Task>> updateTask(List<Task> taskList) async {
    if (!Hive.box(AppKeys.taskBox).isOpen) {
      await Hive.openBox(AppKeys.taskList);
    }

    await TaskBox().addTaskList(taskList);
    return taskList;
  }
}
