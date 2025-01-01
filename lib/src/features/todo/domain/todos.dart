import 'package:flutter_drift_app/src/features/todo/domain/todo.dart';

extension type const DriftTodos._(List<DriftTodo> _list)
    implements List<DriftTodo> {
  factory DriftTodos(Iterable<DriftTodo> iterable) {
    return DriftTodos._(List.unmodifiable(iterable));
  }
}
