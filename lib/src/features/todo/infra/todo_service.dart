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
  return TodoService(ref.watch(localStoreProvider));
}

class TodoService {
  const TodoService(this.local);
  final LocalStore local;

  Future<int> createTodo(TodoCreatable todo) {
    return local.into(local.todosData).insert(todo);
  }

  Future<void> updateTodo(Todo todo) async {
    return local.todosData.replaceOne(todo.toData());
  }

  Future<bool> deleteTodo(Todo todo) {
    return local.todosData.deleteOne(todo.toData());
  }

  Stream<Todos> emitsTodos() {
    final todos = local.todosData;
    final query = local.select(todos);
    return query.watch().map((todos) => Todos(todos.map(Todo.fromData)));
  }
}
