import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/home/home.dart';
import 'package:flutter_drift_app/src/todo/todo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../extensions/tester_x.dart';
import '../../../fakes/fakes.dart';
import '../../todo/infra/todo_service_test.dart';

void main() {
  late Fakes fakes;
  late Todos todos;
  late MockTodoService mockTodoService;

  setUp(
    () {
      fakes = Fakes();
      todos = fakes.todos;
      mockTodoService = MockTodoService();
    },
  );

  Stream<Todos> mockEmitsTodos() => mockTodoService.emitsTodos();

  testWidgets(
    'should render home page',
    (tester) async {
      when(mockEmitsTodos).thenAnswer((i) => Stream.value(todos));
      await tester.pumpApp(
        overrides: [
          todoServiceProvider.overrideWithValue(mockTodoService),
        ],
        child: const HomePage(),
      );
      await tester.pumpAndSettle();
      verify(mockEmitsTodos).called(1);
      expect(find.byType(TodoCard), findsNWidgets(3));
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
      expect(find.byType(TodoCard), findsNWidgets(3));
      await tester.tap(find.byIcon(Icons.add_outlined));
      await tester.pumpAndSettle();
      // TODO(cova): add assertions for todo create sheet
    },
  );
}
