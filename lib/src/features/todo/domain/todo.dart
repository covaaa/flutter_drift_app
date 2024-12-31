import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_drift_app/src/shared/drift/store/store.dart' as drift;
import 'package:fpdart/fpdart.dart';

extension type const DriftTodo._(drift.DriftIdOf<Todo> _todo)
    implements drift.DriftIdOf<Todo> {
  factory DriftTodo(drift.Todo todo) {
    return DriftTodo._(
      drift.DriftIdOf(id: todo.id, value: Todo.fromDrift(todo)),
    );
  }

  DriftTodo copyWith({String? title}) {
    return DriftTodo._(
      drift.DriftIdOf(id: id, value: value.copyWith(title: title)),
    );
  }

  drift.TodosCompanion update(
    drift.TodosCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<int?> category,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    }) companion,
  ) {
    return companion(
      title: Value(value.title),
      category: Value(value.category.toNullable()),
      updatedAt: Value(DateTime.now()),
    );
  }

  drift.TodosCompanion delete() {
    return drift.TodosCompanion(
      id: Value(id),
      title: Value(value.title),
      category: Value(value.category.toNullable()),
      createdAt: Value(value.createdAt.run()),
      updatedAt: Value(value.updatedAt.run()),
    );
  }
}

final class Todo extends Equatable {
  const Todo({
    required this.title,
    this.category = const None(),
    this.createdAt = const IO(DateTime.now),
    this.updatedAt = const IO(DateTime.now),
  });

  factory Todo.fromDrift(drift.Todo todo) {
    return Todo(
      title: todo.title,
      category: optionOf(todo.category),
      createdAt: IO.of(todo.createdAt),
      updatedAt: IO.of(todo.updatedAt),
    );
  }

  final String title;
  final Option<int> category;
  final IO<DateTime> createdAt;
  final IO<DateTime> updatedAt;

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

  drift.TodosCompanion create(
    drift.TodosCompanion Function({
      required String title,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> id,
      Value<int?> category,
    }) companion,
  ) {
    return companion(
      title: title,
      category: Value(category.toNullable()),
      createdAt: createdAt.run(),
      updatedAt: updatedAt.run(),
    );
  }
}
