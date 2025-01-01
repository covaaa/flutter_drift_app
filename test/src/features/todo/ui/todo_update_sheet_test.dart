import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/todo/todo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../extensions/tester_x.dart';
import '../../../../fakes/fakes.dart';
import '../infra/todo_service_test.dart';

void main() {
  late Fakes fakes;
  late DateTime date;
  late DriftTodo driftTodo;
  late DriftTodo newDriftTodo;
  late MockTodoService mockTodoService;

  setUp(
    () {
      fakes = Fakes();
      date = DateUtils.dateOnly(fakes.date);
      driftTodo = fakes.driftTodo1.copyWith(due: date);
      newDriftTodo = driftTodo.copyWith(
        title: 'New todo',
        due: date.add(const Duration(days: 1)),
      );
      mockTodoService = MockTodoService();
    },
  );

  Future<void> mockUpdateTodo() => mockTodoService.updateTodo(newDriftTodo);

  testWidgets(
    'should cancel update todo',
    (tester) async {
      await tester.pumpApp(
        overrides: [todoServiceProvider.overrideWithValue(mockTodoService)],
        child: TodoUpdateSheet(driftTodo),
      );
      await tester.enterText(find.byType(TextField), newDriftTodo.value.title);
      await tester.tap(find.text('Cancel'));
      verifyNever(mockUpdateTodo);
    },
  );

  testWidgets(
    'should update todo',
    (tester) async {
      when(mockUpdateTodo).thenAnswer((i) async => true);
      await tester.pumpApp(
        overrides: [todoServiceProvider.overrideWithValue(mockTodoService)],
        child: TodoUpdateSheet(driftTodo),
      );
      await tester.enterText(find.byType(TextField), newDriftTodo.value.title);
      await tester.tap(find.byIcon(Icons.calendar_today));
      await tester.pumpAndSettle();
      await tester.tap(find.text('${date.day + 1}'));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.send_outlined));
      verify(mockUpdateTodo).called(1);
    },
  );
}
