import 'package:drift/drift.dart';
import 'package:flutter/material.dart' hide Table;
import 'package:flutter_drift_app/src/shared/core/core.dart';
import 'package:flutter_drift_app/src/shared/drift/store/infra/table_x.dart';

class Preferences extends Table with SharedColumn {
  TextColumn get mode =>
      textEnum<ThemeMode>().clientDefault(() => ThemeMode.system.name)();
  TextColumn get color =>
      textEnum<ColorSeed>().clientDefault(() => ColorSeed.deepPurple.name)();
}

class Todos extends Table with SharedColumn {
  TextColumn get title => text()();
  IntColumn get category => integer().nullable()();
  DateTimeColumn get due => dateTime().nullable()();
}

@DataClassName('Category')
class Categories extends Table with SharedColumn {
  TextColumn get title => text()();
  TextColumn get color => textEnum<ColorAccent>()();
}
