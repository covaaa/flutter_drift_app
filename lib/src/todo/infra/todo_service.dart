import 'package:drift/drift.dart';
import 'package:flutter_drift_app/src/drift/store/store.dart' as drift;
import 'package:flutter_drift_app/src/todo/domain/todo.dart';
import 'package:flutter_drift_app/src/todo/domain/todos.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'todo_service.g.dart';

@riverpod
TodoService todoService(Ref ref) {
  return TodoService(ref.watch(drift.driftStoreProvider));
}

class TodoService {
  const TodoService(this.store);

  final drift.DriftStore store;

  drift.$DriftStoreManager get _managers => store.managers;

  Future<int> createTodo(Todo todo) {
    return _managers.todos.create(todo.create);
  }

  Future<int> updateTodo(Todo todo) {
    return _managers.todos.update(todo.update);
  }

  Future<bool> deleteTodo(Todo todo) {
    return store.todos.deleteOne(todo.toDrift());
  }

  Stream<Todos> emitsTodos() {
    return _managers.todos.watch().map((list) {
      return Todos(list.map(Todo.fromDrift));
    });
  }
}
