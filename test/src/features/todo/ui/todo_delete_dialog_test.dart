import 'package:flutter_drift_app/src/features/todo/todo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../extensions/tester_x.dart';
import '../../../../fakes/fakes.dart';
import '../infra/todo_service_test.dart';

void main() {
  late Fakes fakes;
  late DriftTodo driftTodo;
  late MockTodoService mockTodoService;

  setUp(
    () {
      fakes = Fakes();
      driftTodo = fakes.driftTodo1;
      mockTodoService = MockTodoService();
    },
  );

  Future<bool> mockDeleteTodo() => mockTodoService.deleteTodo(driftTodo);

  testWidgets(
    'should cancel delete todo',
    (tester) async {
      await tester.pumpApp(
        overrides: [todoServiceProvider.overrideWithValue(mockTodoService)],
        child: TodoDeleteDialog(driftTodo),
      );
      await tester.tap(find.text('Cancel'));
      verifyNever(mockDeleteTodo);
    },
  );

  testWidgets(
    'should delete todo',
    (tester) async {
      when(mockDeleteTodo).thenAnswer((i) async => true);
      await tester.pumpApp(
        overrides: [todoServiceProvider.overrideWithValue(mockTodoService)],
        child: TodoDeleteDialog(driftTodo),
      );
      await tester.tap(find.text('Delete'));
      verify(mockDeleteTodo).called(1);
    },
  );
}
