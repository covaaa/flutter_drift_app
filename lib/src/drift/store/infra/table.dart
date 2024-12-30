import 'package:drift/drift.dart';
import 'package:flutter/material.dart' hide Table;
import 'package:flutter_drift_app/src/core/core.dart';
import 'package:flutter_drift_app/src/drift/store/infra/table_x.dart';

class Preferences extends Table with SharedColumn {
  TextColumn get mode =>
      textEnum<ThemeMode>().clientDefault(() => ThemeMode.system.name)();
  TextColumn get color =>
      textEnum<ColorSeed>().clientDefault(() => ColorSeed.deepPurple.name)();
}
