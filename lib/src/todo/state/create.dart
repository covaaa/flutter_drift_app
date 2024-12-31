import 'package:flutter_drift_app/src/core/core.dart';
import 'package:flutter_drift_app/src/todo/domain/todo.dart';
import 'package:flutter_drift_app/src/todo/infra/todo_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'create.g.dart';

@riverpod
class CreateTodo extends _$CreateTodo with Loads {
  late TodoService _service;

  @override
  FutureOr<Option<Unit>> build() async {
    _service = ref.watch(todoServiceProvider);
    return none();
  }

  Future<Unit> run(Todo todo) async {
    return super.load(
      Task(() async => _service.createTodo(todo)).map((_) => some(unit)),
    );
  }
}
