import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/todo/todo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../extensions/tester_x.dart';
import '../../../../fakes/fakes.dart';
import '../../todo/infra/todo_service_test.dart';

void main() {
  late Fakes fakes;
  late TodoCreatable todoCreatable;
  late MockTodoService mockTodoService;

  setUp(
    () {
      fakes = Fakes();
      todoCreatable = fakes.todoCreatable;
      mockTodoService = MockTodoService();
    },
  );

  Future<int> mockCreateTodo() => mockTodoService.createTodo(todoCreatable);

  testWidgets(
    'should create',
    (tester) async {
      when(mockCreateTodo).thenAnswer((i) async => 1);
      await tester.pumpApp(
        overrides: [todoServiceProvider.overrideWithValue(mockTodoService)],
        child: const TodoCreateSheet(),
      );
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), 'fake body');
      await tester.tap(find.byIcon(Icons.send_outlined));
      verify(mockCreateTodo).called(1);
    },
  );
}
