import 'package:drift/drift.dart' as drift;
import 'package:equatable/equatable.dart';
import 'package:flutter_drift_app/src/drift/store/store.dart' as store;
import 'package:fpdart/fpdart.dart';

final class Todo extends Equatable {
  const Todo({
    required this.id,
    required this.title,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Todo.fromDrift(store.Todo todo) {
    return Todo(
      id: todo.id,
      title: todo.title,
      category: optionOf(todo.category),
      createdAt: todo.createdAt,
      updatedAt: todo.updatedAt,
    );
  }

  final int id;
  final String title;
  final Option<int> category;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [id, title, category, createdAt, updatedAt];

  store.TodosCompanion toDrift() {
    return store.TodosCompanion(
      id: drift.Value(id),
      title: drift.Value(title),
      category: drift.Value(category.toNullable()),
      createdAt: drift.Value(createdAt),
      updatedAt: drift.Value(updatedAt),
    );
  }

  store.TodosCompanion create(
    store.TodosCompanion Function({
      required String title,
      required DateTime createdAt,
      required DateTime updatedAt,
      drift.Value<int> id,
      drift.Value<int?> category,
    }) companion,
  ) {
    final date = DateTime.now();
    return companion(
      title: title,
      category: drift.Value(category.toNullable()),
      createdAt: date,
      updatedAt: date,
    );
  }

  store.TodosCompanion update(
    store.TodosCompanion Function({
      drift.Value<int> id,
      drift.Value<String> title,
      drift.Value<int?> category,
      drift.Value<DateTime> createdAt,
      drift.Value<DateTime> updatedAt,
    }) companion,
  ) {
    return companion(
      title: drift.Value(title),
      category: drift.Value(category.toNullable()),
      updatedAt: drift.Value(DateTime.now()),
    );
  }
}
