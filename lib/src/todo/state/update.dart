import 'package:flutter_drift_app/src/core/core.dart';
import 'package:flutter_drift_app/src/todo/domain/todo.dart';
import 'package:flutter_drift_app/src/todo/infra/todo_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'update.g.dart';

@riverpod
class UpdateTodo extends _$UpdateTodo with Loads {
  late TodoService _service;

  @override
  FutureOr<Option<Unit>> build() async {
    _service = ref.watch(todoServiceProvider);
    return none();
  }

  Future<Unit> run(DriftTodo todo) async {
    return super.load(
      Task(() async => _service.updateTodo(todo)).map((_) => some(unit)),
    );
  }
}
