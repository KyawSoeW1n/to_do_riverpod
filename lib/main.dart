import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'constant/keys/app_keys.dart';
import 'domain/model/task.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(TaskAdapter());
  await Hive.openBox(AppKeys.taskBox);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
