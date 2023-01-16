import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:to_do/data/impl/task_repo_impl.dart';
import 'package:to_do/domain/model/task.dart';
import 'package:to_do/domain/model/task_list.dart';
import 'package:to_do/domain/repo/task_repo.dart';

import '../../mock/data/task_database_mock.mocks.dart';

void main() {
  final database = MockTaskDBSource();
  final TaskRepo taskRepo = TaskRepoImpl(database);

  group('#getTodoList', () {
    setUp(() {
      when(database.getTaskList()).thenAnswer(
        (_) async => [
          Task("Test", "Test Description"),
        ],
      );
    });

    test('should return TodoList', () async {
      final actual = await taskRepo.getTaskList();
      final expected = TaskList(
        values: [
          Task("Test", "Test Description", status: false),
        ],
      );
      expect(actual.values.first.title, expected.values.first.title);
      verify(database.getTaskList()).called(1);
    });
  });

  group('#createTodo', () {
    setUp(
      () {
        when(database.createTask([Task("title", "description")])).thenAnswer(
          (_) async => [Task("title", "description", status: false)],
        );
      },
    );

    test('should return void', () async {
      await taskRepo.createTask(
        [
          Task("title", "description"),
        ],
      );
      verify(
        database.createTask(
          [
            Task("title", "description", status: false),
          ],
        ),
      ).called(1);
    });
  });
}
