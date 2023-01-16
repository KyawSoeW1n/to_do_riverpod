import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do/domain/model/task.dart';
import 'package:to_do/domain/model/task_list.dart';

void main() {
  group('[] operator', () {
    group('when index value is valid', () {
      test('should return specified Task', () {
        final Task actual = TaskList(values: [
          _buildTodo(0),
          _buildTodo(1),
          _buildTodo(2),
        ])[2];
        final expected = _buildTodo(2);
        expect(actual.title, expected.title);
      });
    });

    group('when index value is invalid', () {
      test('should throw exception', () {
        final todoList = TaskList(values: [
          _buildTodo(0),
          _buildTodo(1),
          _buildTodo(2),
          _buildTodo(3),
        ]);
        expect(() => todoList[4], throwsRangeError);
      });
    });
  });

  group('length getter', () {
    group('when todo list is empty', () {
      test('should return 0', () {
        final actual = const TaskList(values: []).length;
        expect(actual, 0);
      });
    });

    group('when todo list is not empty', () {
      test('should return 2', () {
        final actual = TaskList(values: [
          _buildTodo(1),
          _buildTodo(2),
        ]).length;
        expect(actual, 2);
      });
    });
  });
}

Task _buildTodo(final int id) {
  return Task(
    'title$id',
    'description$id',
  );
}
