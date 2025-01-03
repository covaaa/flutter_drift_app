import 'package:flutter_drift_app/src/features/category/category.dart';
import 'package:flutter_drift_app/src/features/todo/domain/todos.dart';
import 'package:flutter_drift_app/src/features/todo/infra/todo_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'read.g.dart';

@riverpod
Stream<DriftTodos> readDriftTodos(Ref ref) {
  final option = ref.watch(readCategoryProvider);
  return ref.watch(
    todoServiceProvider.select(
      (service) => service.emitsDriftTodos().map((todos) {
        return todos.whereCategory(option);
      }),
    ),
  );
}
