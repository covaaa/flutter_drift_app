import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/account/account.dart';
import 'package:flutter_drift_app/src/features/category/category.dart';
import 'package:flutter_drift_app/src/features/todo/todo.dart';
import 'package:flutter_drift_app/src/shared/core/core.dart';
import 'package:flutter_drift_app/src/shared/drift/store/store.dart' as drift;
import 'package:fpdart/fpdart.dart';
import 'platforms.dart';

class Fakes {
  Fakes();
  final date = DateTime.now();
  final platform = FakePathProviderPlatform();
  final connection = DatabaseConnection(
    NativeDatabase.memory(),
    closeStreamsSynchronously: true,
  );

  IO<DateTime> get dateIO {
    return IO.of(date);
  }

  Preference get preference {
    return Preference(
      mode: ThemeMode.system,
      color: ColorSeed.deepPurple,
      createdAt: date,
      updatedAt: date,
    );
  }

  Todo get todo4 {
    return Todo(
      title: 'new todo',
      category: none(),
      createdAt: dateIO,
      updatedAt: dateIO,
    );
  }

  DriftTodo get driftTodo1 {
    return DriftTodo(
      drift.Todo(
        id: 1,
        title: 'check out drift',
        createdAt: date,
        updatedAt: date,
      ),
    );
  }

  DriftTodo get driftTodo2 {
    return DriftTodo(
      drift.Todo(
        id: 2,
        title: 'fix session invalidation bug',
        category: 1,
        createdAt: date,
        updatedAt: date,
      ),
    );
  }

  DriftTodo get driftTodo3 {
    return DriftTodo(
      drift.Todo(
        id: 3,
        title: 'add favorite movies to home page',
        createdAt: date,
        updatedAt: date,
      ),
    );
  }

  DriftTodo get driftTodo4 {
    return DriftTodo(
      drift.Todo(
        id: 4,
        title: 'new todo',
        createdAt: date,
        updatedAt: date,
      ),
    );
  }

  DriftTodos get driftTodos {
    return DriftTodos([driftTodo1, driftTodo2, driftTodo3]);
  }

  Category get category1 {
    return Category(
      id: 1,
      title: 'important',
      color: ColorAccent.red,
      createdAt: date,
      updatedAt: date,
    );
  }

  Category get category2 {
    return Category(
      id: 2,
      title: 'work',
      color: ColorAccent.blue,
      createdAt: date,
      updatedAt: date,
    );
  }

  Categories get categories {
    return Categories([category1]);
  }
}
