import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/account/account.dart';
import 'package:flutter_drift_app/src/core/core.dart';
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
}
