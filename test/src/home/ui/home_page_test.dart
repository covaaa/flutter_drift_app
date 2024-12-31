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
  late DriftTodos driftTodos;
  late MockTodoService mockTodoService;

  setUp(
    () {
      fakes = Fakes();
      driftTodos = fakes.driftTodos;
      mockTodoService = MockTodoService();
    },
  );

  Stream<DriftTodos> mockEmitsDriftTodos() => mockTodoService.emitsDriftTodos();

  testWidgets(
    'should render home page',
    (tester) async {
      when(mockEmitsDriftTodos).thenAnswer((i) => Stream.value(driftTodos));
      await tester.pumpApp(
        scaffold: false,
        overrides: [todoServiceProvider.overrideWithValue(mockTodoService)],
        child: const HomePage(),
      );
      await tester.pumpAndSettle();
      verify(mockEmitsDriftTodos).called(1);
      expect(find.byType(TodoCard), findsNWidgets(3));
      expect(find.byType(FloatingActionButton), findsOneWidget);
    },
  );

  testWidgets(
    'should show todo create sheet',
    (tester) async {
      when(mockEmitsDriftTodos).thenAnswer((i) => Stream.value(driftTodos));
      await tester.pumpApp(
        scaffold: false,
        overrides: [todoServiceProvider.overrideWithValue(mockTodoService)],
        child: const HomePage(),
      );
      await tester.pumpAndSettle();
      verify(mockEmitsDriftTodos).called(1);
      expect(find.byType(TodoCard), findsNWidgets(3));
      expect(find.byType(FloatingActionButton), findsOneWidget);
      await tester.tap(find.byIcon(Icons.add_outlined));
      await tester.pumpAndSettle();
      expect(find.byType(TodoCreateSheet), findsOneWidget);
    },
  );
}
