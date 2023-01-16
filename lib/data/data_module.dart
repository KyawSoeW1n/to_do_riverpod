import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/data/datasource/task_db_source.dart';
import 'package:to_do/data/impl/task_repo_impl.dart';
import 'package:to_do/domain/repo/task_repo.dart';

import 'datasource/task_db_source_impl.dart';

final taskDatabaseProvider =
    Provider<TaskDBSource>((_) => TaskDataSourceImpl());
final todosRepositoryProvider =
    Provider<TaskRepo>((ref) => TaskRepoImpl(ref.watch(taskDatabaseProvider)));
