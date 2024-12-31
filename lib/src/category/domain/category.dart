import 'package:drift/drift.dart' as drift;
import 'package:equatable/equatable.dart';
import 'package:flutter_drift_app/src/core/core.dart';
import 'package:flutter_drift_app/src/drift/store/store.dart' as store;

final class Category extends Equatable {
  const Category({
    required this.id,
    required this.title,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromDrift(store.Category category) {
    return Category(
      id: category.id,
      title: category.title,
      color: category.color,
      createdAt: category.createdAt,
      updatedAt: category.updatedAt,
    );
  }

  final int id;
  final String title;
  final ColorAccent color;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [id, title, color, createdAt, updatedAt];

  store.CategoriesCompanion toDrift() {
    return store.CategoriesCompanion(
      id: drift.Value(id),
      title: drift.Value(title),
      color: drift.Value(color),
      createdAt: drift.Value(createdAt),
      updatedAt: drift.Value(updatedAt),
    );
  }

  store.CategoriesCompanion create(
    store.CategoriesCompanion Function({
      required String title,
      required ColorAccent color,
      required DateTime createdAt,
      required DateTime updatedAt,
      drift.Value<int> id,
    }) companion,
  ) {
    final date = DateTime.now();
    return companion(
      title: title,
      color: color,
      createdAt: date,
      updatedAt: date,
    );
  }

  store.CategoriesCompanion update(
    store.CategoriesCompanion Function({
      drift.Value<int> id,
      drift.Value<String> title,
      drift.Value<ColorAccent> color,
      drift.Value<DateTime> createdAt,
      drift.Value<DateTime> updatedAt,
    }) companion,
  ) {
    return companion(
      title: drift.Value(title),
      color: drift.Value(color),
      updatedAt: drift.Value(DateTime.now()),
    );
  }
}
