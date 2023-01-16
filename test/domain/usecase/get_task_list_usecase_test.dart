import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do/constant/keys/app_keys.dart';
import 'package:to_do/domain/model/task.dart';
import 'package:to_do/domain/model/task_list.dart';
import 'package:to_do/domain/repo/task_repo.dart';
import 'package:to_do/domain/usecase/get_task_use_case.dart';
import 'package:to_do/domain/usecase/get_task_use_case_impl.dart';

import '../../mock/domain/repo/task_repo_mock.mocks.dart';

void main() async{
  final directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(TaskAdapter());
  await Hive.openBox(AppKeys.taskBox);

  final TaskRepo repository = MockTaskRepo();
  final GetTaskUseCase getTaskUseCase = GetTaskUseCaseImpl(repository);

  setUp(() {
    when(repository.getTaskList()).thenAnswer(
      (_) async => TaskList(
        values: [
          Task("title", "description"),
          Task("title", "description"),
        ],
      ),
    );
  });

  test('should return TaskList', () async {
    final expected = TaskList(
      values: [
        Task("title", "description"),
        Task("title", "description"),
      ],
    );
    final actual = await getTaskUseCase.getTaskList();
    expect(expected.length, actual.length);
  });
}
