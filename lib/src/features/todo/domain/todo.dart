import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_drift_app/src/shared/drift/store/store.dart' as store;
import 'package:fpdart/fpdart.dart';

extension type const DriftTodo._(store.DriftIdOf<Todo> _todo)
    implements store.DriftIdOf<Todo> {
  factory DriftTodo(store.Todo todo) {
    return DriftTodo._(
      store.DriftIdOf(id: todo.id, value: Todo.fromDrift(todo)),
    );
  }

  DriftTodo copyWith({String? title}) {
    return DriftTodo._(
      store.DriftIdOf(id: id, value: value.copyWith(title: title)),
    );
  }

  store.TodosCompanion toDrift() {
    return store.TodosCompanion(
      id: Value(id),
      title: Value(value.title),
      category: Value(value.category.toNullable()),
      createdAt: Value(value.createdAt),
      updatedAt: Value(value.updatedAt),
    );
  }
}

final class Todo extends Equatable {
  const Todo({
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    this.category = const None(),
  });

  factory Todo.fromDrift(store.Todo todo) {
    return Todo(
      title: todo.title,
      category: optionOf(todo.category),
      createdAt: todo.createdAt,
      updatedAt: todo.updatedAt,
    );
  }

  final String title;
  final Option<int> category;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [title, category, createdAt, updatedAt];

  Todo copyWith({String? title}) {
    return Todo(
      title: title ?? this.title,
      category: category,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  store.TodosCompanion toDrift() {
    return store.TodosCompanion(
      title: Value(title),
      category: Value(category.toNullable()),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }
}
