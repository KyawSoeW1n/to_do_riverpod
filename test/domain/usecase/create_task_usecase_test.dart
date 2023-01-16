import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do/constant/keys/app_keys.dart';
import 'package:to_do/domain/model/task.dart';
import 'package:to_do/domain/repo/task_repo.dart';
import 'package:to_do/domain/usecase/create_task_use_case.dart';
import 'package:to_do/domain/usecase/create_task_use_case_impl.dart';

import '../../mock/domain/repo/task_repo_mock.mocks.dart';

void main() async {
  final directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(TaskAdapter());
  await Hive.openBox(AppKeys.taskBox);
  final TaskRepo repository = MockTaskRepo();
  final CreateTaskUseCase createTaskUseCase = CreateTaskUseCaseImpl(repository);

  final taskList = [
    Task("title", 'description'),
  ];

  setUp(
    () {
      when(
        repository.createTask(taskList),
      ).thenAnswer(
        (_) async => taskList,
      );
    },
  );

  test(
    'should return TaskList',
    () async {
      final expected = await createTaskUseCase.createTask(
        Task("title", "description"),
      );
      final actual = taskList;
      expect(actual.first.title, expected.first.title);
    },
  );
}
