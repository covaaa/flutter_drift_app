import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/shared/core/core.dart';
import 'package:flutter_drift_app/src/shared/drift/store/store.dart' as store;

final class Preference extends Equatable {
  const Preference({
    required this.mode,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Preference.fromDrift(store.Preference preference) {
    return Preference(
      mode: preference.mode,
      color: preference.color,
      createdAt: preference.createdAt,
      updatedAt: preference.updatedAt,
    );
  }

  final ThemeMode mode;
  final ColorSeed color;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [mode, color, createdAt, updatedAt];

  store.PreferencesCompanion create(
    store.PreferencesCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> id,
      Value<ThemeMode> mode,
      Value<ColorSeed> color,
    }) companion,
  ) {
    final date = DateTime.now();
    return companion(
      mode: Value(mode),
      color: Value(color),
      createdAt: date,
      updatedAt: date,
    );
  }

  store.PreferencesCompanion update(
    store.PreferencesCompanion Function({
      Value<int> id,
      Value<ThemeMode> mode,
      Value<ColorSeed> color,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    }) companion,
  ) {
    return companion(
      mode: Value(mode),
      color: Value(color),
      updatedAt: Value(DateTime.now()),
    );
  }
}
