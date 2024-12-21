import 'package:flutter_drift_app/src/features/todo/domain/todo.dart';
import 'package:flutter_drift_app/src/features/todo/infra/todo_service.dart';
import 'package:flutter_drift_app/src/shared/core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'deletes.g.dart';

@riverpod
class DeleteTodo extends _$DeleteTodo with Loads {
  late TodoService service;

  @override
  FutureOr<Option<Unit>> build() async {
    service = ref.watch(todoServiceProvider);
    return none();
  }

  Future<Unit> run(Todo todo) async {
    return super.load(
      Task(() async => service.deleteTodo(todo)).map((_) => some(unit)),
    );
  }
}
