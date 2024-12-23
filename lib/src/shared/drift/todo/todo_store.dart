import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_drift_app/src/features/todo/todo.dart';
import 'package:flutter_drift_app/src/shared/drift/connects/connects.dart';
import 'package:flutter_drift_app/src/shared/drift/todo/todo_executes.dart';
import 'package:flutter_drift_app/src/shared/drift/todo/todo_store.steps.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'todo_store.g.dart';

@riverpod
TodoStore todoStore(Ref ref) {
  final store = TodoStore(ref.watch(todoStoreExecutionProvider));
  ref.onDispose(store.close);
  return store;
}

@DriftDatabase(tables: [TodosData])
class TodoStore extends _$TodoStore {
  TodoStore(super.e);
  @override
  int get schemaVersion => 2;
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: stepByStep(
        from1To2: (migrator, schema) async {
          await migrator.addColumn(schema.todosData, schema.todosData.due);
        },
      ),
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
        if (details.wasCreated) {
          await batch(
            (Batch instance) {
              instance.insertAll(
                todosData,
                [
                  TodosDataCompanion.insert(body: 'Check out drift'),
                  TodosDataCompanion.insert(
                    body: 'Add favorite movies to home page',
                  ),
                ],
              );
            },
          );
        }
        if (kDebugMode) {
          // この検証は他の場所で必要無いかなりの量のコードが取り込まれる
          // よって　デバッグでのみ実行
          await validateDatabaseSchema(this);
        }
      },
    );
  }
}
