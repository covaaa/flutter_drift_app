import 'package:flutter_drift_app/src/features/todo/domain/todo_creatable.dart';
import 'package:flutter_drift_app/src/features/todo/infra/todo_service.dart';
import 'package:flutter_drift_app/src/shared/core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'creates.g.dart';

@riverpod
class CreateTodo extends _$CreateTodo with Loads {
  late TodoService service;

  @override
  FutureOr<Option<Unit>> build() async {
    service = ref.watch(todoServiceProvider);
    return none();
  }

  Future<Unit> run(TodoCreatable todo) async {
    return super.load(
      Task(() async => service.createTodo(todo)).map((_) => some(unit)),
    );
  }
}
