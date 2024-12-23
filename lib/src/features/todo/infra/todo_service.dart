import 'package:drift/drift.dart';
import 'package:flutter_drift_app/src/features/todo/domain/todo.dart';
import 'package:flutter_drift_app/src/features/todo/domain/todo_creatable.dart';
import 'package:flutter_drift_app/src/features/todo/domain/todos.dart';
import 'package:flutter_drift_app/src/shared/drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'todo_service.g.dart';

@riverpod
TodoService todoService(Ref ref) {
  return TodoService(ref.watch(todoStoreProvider));
}

class TodoService {
  const TodoService(this.store);

  final TodoStore store;

  $TodosDataTable get _todos => store.todosData;

  Future<int> createTodo(TodoCreatable todo) {
    return store.into(_todos).insert(todo);
  }

  Future<void> updateTodo(Todo todo) {
    return _todos.replaceOne(todo.toData());
  }

  Future<bool> deleteTodo(Todo todo) {
    return _todos.deleteOne(todo.toData());
  }

  Stream<Todos> emitsTodos() {
    final query = store.select(_todos);
    return query.watch().map((todos) => Todos(todos.map(Todo.fromData)));
  }
}
