import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/constant/type/task_filter_type.dart';
import 'package:to_do/domain/model/task_list.dart';
import 'package:to_do/domain/usecase/get_task_use_case.dart';
import 'package:to_do/domain/usecase/update_task_use_case.dart';
import 'package:to_do/presentation/viewmodel/task_filter_provider.dart';

import '../../domain/domain_module.dart';
import '../../domain/model/task.dart';
import '../../domain/usecase/create_task_use_case.dart';
import '../state/state.dart';

final filterTaskProvider = Provider.autoDispose<State<TaskList>>((ref) {
  final filterKind = ref.watch(filterKindViewModelStateNotifierProvider);
  final todoListState = ref.watch(taskListViewModelStateNotifierProvider);

  return todoListState.when(
    init: () => const State.init(),
    success: (taskList) {
      switch (filterKind) {
        case TaskFilterType.pending:
          return State.success(taskList.filterByPending());
        case TaskFilterType.done:
          return State.success(taskList.filterByCompleted());
      }
    },
    loading: () => const State.loading(),
    error: (exception) => State.error(exception),
  );
});

final taskListViewModelStateNotifierProvider =
    StateNotifierProvider.autoDispose<TaskListViewModel, State<TaskList>>(
        (ref) {
  return TaskListViewModel(
    ref.watch(addTaskUseCaseProvider),
    ref.watch(getTaskUseCaseProvider),
    ref.watch(updateTaskUseCaseProvider),
  );
});

class TaskListViewModel extends StateNotifier<State<TaskList>> {
  final CreateTaskUseCase _createTaskUseCase;
  final GetTaskUseCase _getPendingTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;

  TaskListViewModel(
    this._createTaskUseCase,
    this._getPendingTaskUseCase,
    this._updateTaskUseCase,
  ) : super(const State.init()) {
    _getTaskList();
  }

  _getTaskList() async {
    try {
      state = const State.loading();
      final taskList = await _getPendingTaskUseCase.getTaskList();
      state = State.success(taskList);
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  addTask(
    final String title,
    final String description,
  ) async {
    try {
      final newTaskList = await _createTaskUseCase.createTask(
        Task(title, description),
      );
      state = State.success(state.data!.addTask(newTaskList));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  updateTask(Task task) async {
    task.status = true;
    final updateTaskList =
        await _updateTaskUseCase.updateTask(state.data!.values);
    state = State.success(state.data!.updateTaskList(updateTaskList));
  }
}
