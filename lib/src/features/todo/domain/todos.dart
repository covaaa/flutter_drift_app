import 'package:flutter_drift_app/src/features/category/category.dart';
import 'package:flutter_drift_app/src/features/todo/domain/todo.dart';
import 'package:fpdart/fpdart.dart';

extension type const DriftTodos._(List<DriftTodo> _list)
    implements List<DriftTodo> {
  factory DriftTodos(Iterable<DriftTodo> iterable) {
    return DriftTodos._(List.unmodifiable(iterable));
  }

  DriftTodos whereCategory(Option<Category> option) {
    return option.match(
      () => this,
      (category) => DriftTodos(
        _list.where((todo) => todo.value.category == some(category.id)),
      ),
    );
  }
}
