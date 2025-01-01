import 'package:drift/drift.dart';
import 'package:flutter_drift_app/src/features/todo/todo.dart';
import 'package:flutter_drift_app/src/shared/drift/store/store.dart'
    hide Todo, Todos;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../fakes/fakes.dart';

class MockTodoService extends Mock implements TodoService {}

void main() {
  late Fakes fakes;
  late Todo todo;
  late DriftTodo driftTodo;
  late DriftTodos driftTodos;
  late QueryExecutor connection;
  late ProviderContainer container;
  late TodoService service;

  setUp(
    () {
      fakes = Fakes();
      todo = fakes.todo4;
      driftTodo = fakes.driftTodo4;
      driftTodos = fakes.driftTodos;
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
      expect(service.updateTodo(driftTodo), completion(isA<void>()));
    },
  );

  test(
    'should delete todo',
    () async {
      await service.createTodo(todo);
      expect(service.deleteTodo(driftTodo), completion(isTrue));
    },
  );

  test(
    'should emits drift todos',
    () {
      expect(
        service.emitsDriftTodos(),
        emits(
          isA<DriftTodos>()
              .having(
                (todos) => todos.map((todo) => todo.id),
                'should be expected ids',
                driftTodos.map((todo) => todo.id),
              )
              .having(
                (todos) => todos.map((todo) => todo.value.title),
                'should be expected titles',
                driftTodos.map((todo) => todo.value.title),
              )
              .having(
                (todos) => todos.map((todo) => todo.value.category),
                'should be expected categories',
                driftTodos.map((todo) => todo.value.category),
              ),
        ),
      );
    },
  );
}
