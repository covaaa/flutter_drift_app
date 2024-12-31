import 'package:drift/drift.dart';
import 'package:flutter_drift_app/src/features/todo/domain/todo.dart';
import 'package:flutter_drift_app/src/features/todo/domain/todos.dart';
import 'package:flutter_drift_app/src/shared/drift/store/store.dart'
    hide Todo, Todos;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'todo_service.g.dart';

@riverpod
TodoService todoService(Ref ref) {
  return TodoService(ref.watch(driftStoreProvider));
}

class TodoService {
  const TodoService(this.store);

  final DriftStore store;

  $DriftStoreManager get _managers => store.managers;

  Future<int> createTodo(Todo todo) {
    return _managers.todos.create(todo.create);
  }

  Future<int> updateTodo(DriftTodo todo) {
    return _managers.todos.update(todo.update);
  }

  Future<bool> deleteTodo(DriftTodo todo) {
    return store.todos.deleteOne(todo.delete());
  }

  Stream<Todos> emitsTodos() {
    return _managers.todos.watch().map((list) {
      return Todos(list.map(Todo.fromDrift));
    });
  }

  Stream<DriftTodos> emitsDriftTodos() {
    return _managers.todos.watch().map((list) {
      return DriftTodos(list.map(DriftTodo.new));
    });
  }
}
