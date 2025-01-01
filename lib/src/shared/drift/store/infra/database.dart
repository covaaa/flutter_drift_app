import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart' as drift_flutter;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'database.g.dart';

@riverpod
QueryExecutor driftDatabase(Ref ref) {
  return drift_flutter.driftDatabase(name: 'flutter_drift_app');
}
