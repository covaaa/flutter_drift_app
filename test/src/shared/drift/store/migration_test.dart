import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:flutter/material.dart' hide Table;
import 'package:flutter_drift_app/src/shared/core/core.dart';
import 'package:flutter_drift_app/src/shared/drift/store/store.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../fakes/fakes.dart';
import 'generated/schema.dart';
import 'generated/schema_v1.dart' as v1;
import 'generated/schema_v2.dart' as v2;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late Fakes fakes;
  late DateTime date;
  late SchemaVerifier verifier;

  setUpAll(() {
    fakes = Fakes();
    date = fakes.date;
    verifier = SchemaVerifier(GeneratedHelper());
  });

  group('simple database migrations', () {
    // 単純な (データなしの) 移行によるスキーマ更新を検証
    // これでスキーマが適切に変更されること確認できる
    const versions = GeneratedHelper.versions;
    for (final (i, fromVersion) in versions.indexed) {
      group('from $fromVersion', () {
        for (final toVersion in versions.skip(i + 1)) {
          test('to $toVersion', () async {
            final schema = await verifier.schemaAt(fromVersion);
            final db = DriftStore(schema.newConnection());
            await verifier.migrateAndValidate(db, toVersion);
            await db.close();
          });
        }
      });
    }
  });

  // 移行で既存のデータが保持されるかどうかのテストを記述する方法
  // 既存の列を変更する移行 (たとえば列の型や制約を変更する) に役立つ
  // テーブルや列を追加するだけの移行ではこれらのテストは必要ない
  // 参考: https://drift.simonbinder.eu/migrations/tests/#verifying-data-integrity
  test('migration from v1 to v2 does not corrupt data', () async {
    // 古いデータベースに挿入するデータ
    final oldPreferencesData = <v1.PreferencesData>[
      v1.PreferencesData(
        id: 1,
        mode: ThemeMode.system.name,
        color: ColorSeed.deepPurple.name,
        createdAt: date,
        updatedAt: date,
      ),
    ];
    // 移行後に予想される行
    final expectedNewPreferencesData = <v2.PreferencesData>[
      v2.PreferencesData(
        id: 1,
        mode: ThemeMode.system.name,
        color: ColorSeed.deepPurple.name,
        createdAt: date,
        updatedAt: date,
      ),
    ];

    final oldTodosData = <v1.TodosData>[
      v1.TodosData(
        id: 1,
        title: 'fake todo 1',
        createdAt: date,
        updatedAt: date,
      ),
      v1.TodosData(
        id: 2,
        title: 'fake todo 2',
        createdAt: date,
        updatedAt: date,
      ),
    ];
    final expectedNewTodosData = <v2.TodosData>[
      v2.TodosData(
        id: 1,
        title: 'fake todo 1',
        createdAt: date,
        updatedAt: date,
      ),
      v2.TodosData(
        id: 2,
        title: 'fake todo 2',
        createdAt: date,
        updatedAt: date,
      ),
    ];

    final oldCategoriesData = <v1.CategoriesData>[
      v1.CategoriesData(
        id: 1,
        title: 'fake category',
        color: ColorAccent.red.name,
        createdAt: date,
        updatedAt: date,
      ),
    ];
    final expectedNewCategoriesData = <v2.CategoriesData>[
      v2.CategoriesData(
        id: 1,
        title: 'fake category',
        color: ColorAccent.red.name,
        createdAt: date,
        updatedAt: date,
      ),
    ];

    await verifier.testWithDataIntegrity(
      oldVersion: 1,
      newVersion: 2,
      createOld: v1.DatabaseAtV1.new,
      createNew: v2.DatabaseAtV2.new,
      openTestedDatabase: DriftStore.new,
      createItems: (batch, oldDb) {
        batch
          ..insertAll(oldDb.preferences, oldPreferencesData)
          ..insertAll(oldDb.todos, oldTodosData)
          ..insertAll(oldDb.categories, oldCategoriesData);
      },
      validateItems: (newDb) async {
        expect(
          expectedNewPreferencesData,
          await newDb.select(newDb.preferences).get(),
        );
        expect(expectedNewTodosData, await newDb.select(newDb.todos).get());
        expect(
          expectedNewCategoriesData,
          await newDb.select(newDb.categories).get(),
        );
      },
    );
  });
}
