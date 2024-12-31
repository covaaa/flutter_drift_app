import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/account/account.dart';
import 'package:flutter_drift_app/src/category/category.dart';
import 'package:flutter_drift_app/src/core/core.dart';
import 'package:flutter_drift_app/src/drift/store/store.dart' as drift;
import 'package:flutter_drift_app/src/todo/todo.dart';
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

  Todo get todo1 {
    return Todo(
      title: 'check out drift',
      category: none(),
      createdAt: dateIO,
      updatedAt: dateIO,
    );
  }

  Todo get todo2 {
    return Todo(
      title: 'fix session invalidation bug',
      category: some(1),
      createdAt: dateIO,
      updatedAt: dateIO,
    );
  }

  Todo get todo3 {
    return Todo(
      title: 'add favorite movies to home page',
      category: none(),
      createdAt: dateIO,
      updatedAt: dateIO,
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

  Todos get todos {
    return Todos([todo1, todo2, todo3]);
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

  Categories get categories {
    return Categories([category1]);
  }
}
