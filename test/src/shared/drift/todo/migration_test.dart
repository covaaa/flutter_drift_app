import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:flutter_drift_app/src/shared/drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'generated/schema.dart';
import 'generated/schema_v1.dart' as v1;
import 'generated/schema_v2.dart' as v2;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() => verifier = SchemaVerifier(GeneratedHelper()));

  // 単純な (データなしの) 移行によるスキーマ更新を検証
  // これでスキーマが適切に変更されること確認できる
  group(
    'simple database migrations',
    () {
      const versions = GeneratedHelper.versions;
      for (final (i, fromVersion) in versions.indexed) {
        group(
          'from $fromVersion',
          () {
            for (final toVersion in versions.skip(i + 1)) {
              test(
                'to $toVersion',
                () async {
                  final schema = await verifier.schemaAt(fromVersion);
                  final db = TodoStore(schema.newConnection());
                  await verifier.migrateAndValidate(db, toVersion);
                  await db.close();
                },
              );
            }
          },
        );
      }
    },
  );

  // 移行で既存のデータが保持されるかどうかのテストを記述する方法
  // 既存の列を変更する移行 (たとえば列の型や制約を変更する) に役立つ
  // テーブルや列を追加するだけの移行ではこれらのテストは必要ない
  // see also: https://drift.simonbinder.eu/migrations/tests/#verifying-data-integrity
  test('migration from v1 to v2 does not corrupt data', () async {
    // 古いデータベースに挿入するデータ
    final oldTodosData = <v1.TodosDataData>[
      const v1.TodosDataData(id: 1, body: 'fake body 1'),
      const v1.TodosDataData(id: 2, body: 'fake body 2'),
    ];
    // 移行後に予想される行
    final expectedNewTodosData = <v2.TodosDataData>[
      const v2.TodosDataData(id: 1, body: 'fake body 1'),
      const v2.TodosDataData(id: 2, body: 'fake body 2'),
    ];
    await verifier.testWithDataIntegrity(
      oldVersion: 1,
      newVersion: 2,
      createOld: v1.DatabaseAtV1.new,
      createNew: v2.DatabaseAtV2.new,
      openTestedDatabase: TodoStore.new,
      createItems: (batch, oldDb) {
        batch.insertAll(oldDb.todosData, oldTodosData);
      },
      validateItems: (newDb) async {
        final actualNewTodosData = await newDb.select(newDb.todosData).get();
        expect(expectedNewTodosData, actualNewTodosData);
      },
    );
  });
}
