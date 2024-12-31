import 'package:flutter_drift_app/src/features/todo/domain/todo.dart';
import 'package:flutter_drift_app/src/features/todo/infra/todo_service.dart';
import 'package:flutter_drift_app/src/shared/core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'delete.g.dart';

@riverpod
class DeleteTodo extends _$DeleteTodo with Loads {
  late TodoService _service;

  @override
  FutureOr<Option<Unit>> build() async {
    _service = ref.watch(todoServiceProvider);
    return none();
  }

  Future<Unit> run(DriftTodo todo) async {
    return super.load(
      Task(() async => _service.deleteTodo(todo)).map((_) => some(unit)),
    );
  }
}
