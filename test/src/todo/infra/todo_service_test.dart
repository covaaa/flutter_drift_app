import 'package:drift/drift.dart';
import 'package:flutter_drift_app/src/drift/store/store.dart' hide Todo, Todos;
import 'package:flutter_drift_app/src/todo/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../fakes/fakes.dart';

class MockTodoService extends Mock implements TodoService {}

void main() {
  late Fakes fakes;
  late Todo todo;
  late Todos todos;
  late QueryExecutor connection;
  late ProviderContainer container;
  late TodoService service;

  setUp(
    () {
      fakes = Fakes();
      todo = fakes.todo4;
      todos = fakes.todos;
      connection = fakes.connection;
      container = ProviderContainer(
        overrides: [driftDatabaseProvider.overrideWithValue(connection)],
      );
      service = container.read(todoServiceProvider);
    },
  );

  tearDown(() => container.dispose());

  test(
    'should create todo',
    () {
      expect(service.createTodo(todo), completion(4));
    },
  );

  test(
    'should update todo',
    () async {
      await service.createTodo(todo);
      expect(service.updateTodo(todo), completion(4));
    },
  );

  test(
    'should delete todo',
    () async {
      await service.createTodo(todo);
      expect(service.deleteTodo(todo), completion(isTrue));
    },
  );

  test(
    'should emits todos',
    () {
      expect(
        service.emitsTodos(),
        emits(
          isA<Todos>()
              .having(
                (todos) => todos.map((todo) => todo.id),
                'should be expected ids',
                todos.map((todo) => todo.id),
              )
              .having(
                (todos) => todos.map((todo) => todo.title),
                'should be expected titles',
                todos.map((todo) => todo.title),
              )
              .having(
                (todos) => todos.map((todo) => todo.category),
                'should be expected categories',
                todos.map((todo) => todo.category),
              ),
        ),
      );
    },
  );
}
