import 'package:hive/hive.dart';
import 'package:to_do/constant/keys/app_keys.dart';

import 'task.dart';

class TaskBox {
  getTaskList() {
    return Hive.box(AppKeys.taskBox).get(AppKeys.taskList, defaultValue: []);
  }

  addTaskList(List<Task> taskList) async {
    await Hive.box(AppKeys.taskBox).put(AppKeys.taskList, taskList);
  }
}
