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

  store.PreferencesCompanion toDrift() {
    return store.PreferencesCompanion(
      id: const Value(1),
      mode: Value(mode),
      color: Value(color),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }
}
