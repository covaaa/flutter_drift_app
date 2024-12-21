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
      todo = fakes.todo;
      mockTodoService = MockTodoService();
    },
  );

  Future<bool> mockDeleteTodo() => mockTodoService.deleteTodo(todo);

  testWidgets(
    'should cancel delete',
    (tester) async {
      await tester.pumpApp(
        overrides: [todoServiceProvider.overrideWithValue(mockTodoService)],
        child: TodoDeleteDialog(todo),
      );
      await tester.tap(find.text('Cancel'));
      verifyNever(mockDeleteTodo);
    },
  );

  testWidgets(
    'should delete',
    (tester) async {
      when(mockDeleteTodo).thenAnswer((i) async => true);
      await tester.pumpApp(
        overrides: [todoServiceProvider.overrideWithValue(mockTodoService)],
        child: TodoDeleteDialog(todo),
      );
      await tester.tap(find.text('Delete'));
      verify(mockDeleteTodo).called(1);
    },
  );
}
