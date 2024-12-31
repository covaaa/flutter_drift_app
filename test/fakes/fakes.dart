import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/account/account.dart';
import 'package:flutter_drift_app/src/category/category.dart';
import 'package:flutter_drift_app/src/core/core.dart';
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
      id: 1,
      title: 'check out drift',
      category: none(),
      createdAt: date,
      updatedAt: date,
    );
  }

  Todo get todo2 {
    return Todo(
      id: 2,
      title: 'fix session invalidation bug',
      category: some(1),
      createdAt: date,
      updatedAt: date,
    );
  }

  Todo get todo3 {
    return Todo(
      id: 3,
      title: 'add favorite movies to home page',
      category: none(),
      createdAt: date,
      updatedAt: date,
    );
  }

  Todo get todo4 {
    return Todo(
      id: 4,
      title: 'new todo',
      category: none(),
      createdAt: date,
      updatedAt: date,
    );
  }

  Todos get todos {
    return Todos([todo1, todo2, todo3]);
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
