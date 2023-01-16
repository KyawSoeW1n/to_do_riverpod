import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/presentation/viewmodel/task_list_viewmodel.dart';

final todoFormViewModelProvider =
    Provider.autoDispose.family<AddTaskViewModel, void>((ref, task) {
  final taskListViewModel =
      ref.watch(taskListViewModelStateNotifierProvider.notifier);
  return AddTaskViewModel(taskListViewModel);
});

class AddTaskViewModel {
  final TaskListViewModel _taskListViewModel;
  var _title = '';
  var _description = '';

  AddTaskViewModel(this._taskListViewModel);

  addTask() {
    _taskListViewModel.addTask(_title, _description);
  }

  setTitle(final String value) => _title = value;

  setDescription(final String value) => _description = value;
}
