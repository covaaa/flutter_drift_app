import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/home/home.dart';
import 'package:flutter_drift_app/src/features/todo/todo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../extensions/tester_x.dart';
import '../../../../fakes/fakes.dart';
import '../../todo/infra/todo_service_test.dart';

void main() {
  late Fakes fakes;
  late Todos todos;
  late MockTodoService mockTodoService;

  setUp(
    () {
      fakes = Fakes();
      todos = fakes.todosNonCategorized;
      mockTodoService = MockTodoService();
    },
  );

  Stream<Todos> mockEmitsTodos() => mockTodoService.emitsTodos();

  testWidgets(
    'should render',
    (tester) async {
      when(mockEmitsTodos).thenAnswer((i) => Stream.value(todos));
      await tester.pumpApp(
        scaffold: false,
        overrides: [todoServiceProvider.overrideWithValue(mockTodoService)],
        child: const HomePage(),
      );
      await tester.pumpAndSettle();
      verify(mockEmitsTodos).called(1);
      expect(find.byType(TodoCard), findsNWidgets(2));
      expect(find.byType(FloatingActionButton), findsOneWidget);
    },
  );

  testWidgets(
    'should show todo create sheet',
    (tester) async {
      when(mockEmitsTodos).thenAnswer((i) => Stream.value(todos));
      await tester.pumpApp(
        scaffold: false,
        overrides: [todoServiceProvider.overrideWithValue(mockTodoService)],
        child: const HomePage(),
      );
      await tester.pumpAndSettle();
      verify(mockEmitsTodos).called(1);
      expect(find.byType(TodoCard), findsNWidgets(2));
      await tester.tap(find.byIcon(Icons.add_outlined));
      await tester.pumpAndSettle();
      expect(find.byType(TodoCreateSheet), findsOneWidget);
    },
  );
}
