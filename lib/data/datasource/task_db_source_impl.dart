import 'package:hive/hive.dart';
import 'package:to_do/data/datasource/task_db_source.dart';

import '../../constant/keys/app_keys.dart';
import '../../domain/model/task.dart';
import '../../domain/model/task_box.dart';

class TaskDataSourceImpl implements TaskDBSource {
  @override
  Future<void> createTask(List<Task> taskList) async {
    if (!Hive.box(AppKeys.taskBox).isOpen) {
      await Hive.openBox(AppKeys.taskList);
    }

    await Hive.box(AppKeys.taskBox).put(AppKeys.taskList, taskList);
  }

  @override
  Future<List<Task>> getTaskList() {
    return TaskBox().getTaskList();
  }
}
