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

  DriftTodo copyWith({String? title, DateTime? due}) {
    return DriftTodo._(
      store.DriftIdOf(id: id, value: value.copyWith(title: title, due: due)),
    );
  }

  store.TodosCompanion toDrift() {
    return store.TodosCompanion(
      id: Value(id),
      title: Value(value.title),
      category: Value(value.category.toNullable()),
      due: Value(value.due.toNullable()),
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
    this.due = const None(),
  });

  factory Todo.fromDrift(store.Todo todo) {
    return Todo(
      title: todo.title,
      category: optionOf(todo.category),
      due: optionOf(todo.due),
      createdAt: todo.createdAt,
      updatedAt: todo.updatedAt,
    );
  }

  final String title;
  final Option<int> category;
  final Option<DateTime> due;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [title, category, due, createdAt, updatedAt];

  Todo copyWith({String? title, DateTime? due}) {
    return Todo(
      title: title ?? this.title,
      category: category,
      due: optionOf(due).match(() => this.due, some),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  store.TodosCompanion toDrift() {
    return store.TodosCompanion(
      title: Value(title),
      category: Value(category.toNullable()),
      due: Value(due.toNullable()),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }
}
