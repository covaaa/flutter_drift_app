import 'package:flutter_drift_app/src/features/todo/domain/todo.dart';

extension type Todos._(List<Todo> _list) implements List<Todo> {
  factory Todos(Iterable<Todo> iterable) {
    return Todos._(List.unmodifiable(iterable));
  }
}
