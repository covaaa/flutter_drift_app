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
  late Todo newTodo;
  late MockTodoService mockTodoService;

  setUp(
    () {
      fakes = Fakes();
      todo = fakes.todo;
      newTodo = todo.copyWith(body: 'New todo');
      mockTodoService = MockTodoService();
    },
  );

  Future<void> mockUpdateTodo() => mockTodoService.updateTodo(newTodo);

  testWidgets(
    'should cancel',
    (tester) async {
      when(mockUpdateTodo).thenAnswer((i) async => true);
      await tester.pumpApp(
        overrides: [todoServiceProvider.overrideWithValue(mockTodoService)],
        child: TodoUpdateSheet(todo),
      );
      await tester.enterText(find.byType(TextField), newTodo.body);
      await tester.tap(find.text('Cancel'));
      verifyNever(mockUpdateTodo);
    },
  );

  testWidgets(
    'should update',
    (tester) async {
      when(mockUpdateTodo).thenAnswer((i) async => true);
      await tester.pumpApp(
        overrides: [todoServiceProvider.overrideWithValue(mockTodoService)],
        child: TodoUpdateSheet(todo),
      );
      await tester.enterText(find.byType(TextField), newTodo.body);
      await tester.tap(find.byIcon(Icons.send_outlined));
      verify(mockUpdateTodo).called(1);
    },
  );
}
