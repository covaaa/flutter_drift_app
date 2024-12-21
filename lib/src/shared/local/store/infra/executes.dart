import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'executes.g.dart';

@riverpod
QueryExecutor localStoreExecution(Ref ref) {
  return driftDatabase(name: 'flutter-drift-app');
}
