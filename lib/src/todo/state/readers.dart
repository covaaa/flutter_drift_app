import 'package:flutter_drift_app/src/todo/domain/todos.dart';
import 'package:flutter_drift_app/src/todo/infra/todo_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'readers.g.dart';

@riverpod
Stream<Todos> readTodos(Ref ref) {
  return ref.watch(
    todoServiceProvider.select((service) => service.emitsTodos()),
  );
}
