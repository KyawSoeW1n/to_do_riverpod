import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do/features/task_list/screen/task_list_screen.dart';

import 'constant/routes/app_routes.dart';
import 'features/task_list/screen/add_task_screen.dart';


final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: "/",
      builder: (BuildContext context, GoRouterState state) {
        return TaskListScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: Routes.addTask,
          builder: (BuildContext context, GoRouterState state) {
            return const AddTaskScreen();
          },
        ),
      ],
    ),
  ],
);


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
