import 'package:drift/drift.dart';
import 'package:flutter_drift_app/src/features/todo/todo.dart';
import 'package:flutter_drift_app/src/shared/local/local.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../fakes/fakes.dart';

class MockTodoService extends Mock implements TodoService {}

void main() {
  late Fakes fakes;
  late TodoCreatable todoCreatable;
  late Todo todo;
  late Todos todosNonCategorized;
  late QueryExecutor connection;
  late ProviderContainer container;

  setUp(
    () {
      fakes = Fakes();
      todoCreatable = fakes.todoCreatable;
      todo = fakes.todo;
      todosNonCategorized = fakes.todosNonCategorized;
      connection = fakes.connection;
      container = ProviderContainer(
        overrides: [localStoreExecutionProvider.overrideWithValue(connection)],
      );
    },
  );

  test(
    'should create todo',
    () {
      expect(
        container.read(todoServiceProvider).createTodo(todoCreatable),
        completion(3),
      );
    },
  );

  test(
    'should update todo',
    () async {
      await container.read(todoServiceProvider).createTodo(todoCreatable);
      expect(
        container.read(todoServiceProvider).updateTodo(todo),
        completion(isA<void>()),
      );
    },
  );

  test(
    'should delete todo',
    () async {
      await container.read(todoServiceProvider).createTodo(todoCreatable);
      expect(
        container.read(todoServiceProvider).deleteTodo(todo),
        completion(true),
      );
    },
  );

  test(
    'should emits non categorized todos',
    () {
      expect(
        container.read(todoServiceProvider).emitsTodos(),
        emits(todosNonCategorized),
      );
    },
  );
}
