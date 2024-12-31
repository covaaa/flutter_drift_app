import 'package:flutter_drift_app/src/features/todo/domain/todos.dart';
import 'package:flutter_drift_app/src/features/todo/infra/todo_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'read.g.dart';

@riverpod
Stream<DriftTodos> readDriftTodos(Ref ref) {
  return ref.watch(
    todoServiceProvider.select((service) => service.emitsDriftTodos()),
  );
}
