import 'package:flutter_drift_app/src/todo/domain/todo.dart';

extension type const Todos._(List<Todo> _list) implements List<Todo> {
  factory Todos(Iterable<Todo> iterable) {
    return Todos._(List.unmodifiable(iterable));
  }
}

extension type const DriftTodos._(List<DriftTodo> _list)
    implements List<DriftTodo> {
  factory DriftTodos(Iterable<DriftTodo> iterable) {
    return DriftTodos._(List.unmodifiable(iterable));
  }
}
