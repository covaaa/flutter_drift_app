import 'package:flutter_drift_app/src/todo/domain/todo.dart';

extension type const Todos._(List<Todo> _list) implements List<Todo> {
  factory Todos(Iterable<Todo> iterable) {
    return Todos._(List.unmodifiable(iterable));
  }
}
