import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/data/data_module.dart';
import 'package:to_do/domain/usecase/create_task_use_case.dart';
import 'package:to_do/domain/usecase/create_task_use_case_impl.dart';
import 'package:to_do/domain/usecase/get_task_use_case.dart';
import 'package:to_do/domain/usecase/get_task_use_case_impl.dart';
import 'package:to_do/domain/usecase/update_task_use_case.dart';
import 'package:to_do/domain/usecase/update_task_use_case_impl.dart';

final addTaskUseCaseProvider = Provider<CreateTaskUseCase>(
    (ref) => CreateTaskUseCaseImpl(ref.watch(todosRepositoryProvider)));
final getTaskUseCaseProvider = Provider<GetTaskUseCase>(
    (ref) => GetTaskUseCaseImpl(ref.watch(todosRepositoryProvider)));
final updateTaskUseCaseProvider = Provider<UpdateTaskUseCase>(
    (ref) => UpdateTaskUseCaseImpl(ref.watch(todosRepositoryProvider)));
