// coverage:ignore-file

import 'package:drift/drift.dart';
import 'package:flutter/material.dart' hide Table;
import 'package:flutter_drift_app/src/shared/core/core.dart';

mixin SharedColumn on Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

class Preferences extends Table with SharedColumn {
  TextColumn get mode => textEnum<ThemeMode>().clientDefault(
        () => ThemeMode.system.name,
      )();
  TextColumn get color => textEnum<ColorSeed>().clientDefault(
        () => ColorSeed.deepPurple.name,
      )();
}

class Todos extends Table with SharedColumn {
  TextColumn get title => text()();
  IntColumn get category => integer().nullable().references(
        Categories,
        #id,
        onDelete: KeyAction.setNull,
      )();
  DateTimeColumn get due => dateTime().nullable()();
}

@DataClassName('Category')
class Categories extends Table with SharedColumn {
  TextColumn get title => text()();
  TextColumn get color => textEnum<ColorAccent>()();
}
