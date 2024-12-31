import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/todo/todo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../extensions/tester_x.dart';
import '../../../../fakes/fakes.dart';
import '../infra/todo_service_test.dart';

void main() {
  late Fakes fakes;
  late Todo todo;
  late MockTodoService mockTodoService;

  setUp(
    () {
      fakes = Fakes();
      todo = fakes.todo4;
      mockTodoService = MockTodoService();
      registerFallbackValue(todo);
    },
  );

  Future<int> mockCreateTodo() {
    return mockTodoService.createTodo(
      any(
        that: isA<Todo>().having(
          (todo) => todo.title,
          'should be expected title',
          todo.title,
        ),
      ),
    );
  }

  testWidgets(
    'should cancel create todo',
    (tester) async {
      await tester.pumpApp(
        overrides: [todoServiceProvider.overrideWithValue(mockTodoService)],
        child: const TodoCreateSheet(),
      );
      await tester.enterText(find.byType(TextField), todo.title);
      await tester.tap(find.text('Cancel'));
      verifyNever(mockCreateTodo);
    },
  );

  testWidgets(
    'should create todo',
    (tester) async {
      when(mockCreateTodo).thenAnswer((i) async => 1);
      await tester.pumpApp(
        overrides: [todoServiceProvider.overrideWithValue(mockTodoService)],
        child: const TodoCreateSheet(),
      );

      await tester.enterText(find.byType(TextField), todo.title);
      await tester.tap(find.byIcon(Icons.send_outlined));
      verify(mockCreateTodo).called(1);
    },
  );
}
