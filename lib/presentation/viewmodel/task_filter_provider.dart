
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/constant/type/task_filter_type.dart';

final filterKindViewModelStateNotifierProvider =
StateNotifierProvider.autoDispose<FilterKindViewModel, TaskFilterType>((_) => FilterKindViewModel());

class FilterKindViewModel extends StateNotifier<TaskFilterType> {
  FilterKindViewModel() : super(TaskFilterType.pending);

  filterByPending() => state = TaskFilterType.pending;

  filterByCompleted() => state = TaskFilterType.done;

  bool isFilteredByCompleted() => state == TaskFilterType.done;

  bool isFilteredByPending() => state == TaskFilterType.pending;
}
