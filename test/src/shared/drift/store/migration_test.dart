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
import 'generated/schema_v3.dart' as v3;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late Fakes fakes;
  late DateTime date;
  late List<v1.PreferencesData> preferencesDataV1;
  late List<v2.PreferencesData> preferencesDataV2;
  late List<v3.PreferencesData> preferencesDataV3;
  late List<v1.TodosData> todosDataV1;
  late List<v2.TodosData> todosDataV2;
  late List<v3.TodosData> todosDataV3;
  late List<v1.CategoriesData> categoriesDataV1;
  late List<v2.CategoriesData> categoriesDataV2;
  late List<v3.CategoriesData> categoriesDataV3;
  late SchemaVerifier verifier;

  setUp(() {
    fakes = Fakes();
    date = fakes.date;
    preferencesDataV1 = <v1.PreferencesData>[
      v1.PreferencesData(
        id: 1,
        mode: ThemeMode.system.name,
        color: ColorSeed.deepPurple.name,
        createdAt: date,
        updatedAt: date,
      ),
    ];
    // 移行後に予想される行
    preferencesDataV2 = <v2.PreferencesData>[
      v2.PreferencesData(
        id: 1,
        mode: ThemeMode.system.name,
        color: ColorSeed.deepPurple.name,
        createdAt: date,
        updatedAt: date,
      ),
    ];
    // 移行後に予想される行
    preferencesDataV3 = <v3.PreferencesData>[
      v3.PreferencesData(
        id: 1,
        mode: ThemeMode.system.name,
        color: ColorSeed.deepPurple.name,
        createdAt: date,
        updatedAt: date,
      ),
    ];
    todosDataV1 = <v1.TodosData>[
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
    todosDataV2 = <v2.TodosData>[
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
    todosDataV3 = <v3.TodosData>[
      v3.TodosData(
        id: 1,
        title: 'fake todo 1',
        createdAt: date,
        updatedAt: date,
      ),
      v3.TodosData(
        id: 2,
        title: 'fake todo 2',
        createdAt: date,
        updatedAt: date,
      ),
    ];
    categoriesDataV1 = <v1.CategoriesData>[
      v1.CategoriesData(
        id: 1,
        title: 'fake category',
        color: ColorAccent.red.name,
        createdAt: date,
        updatedAt: date,
      ),
    ];
    categoriesDataV2 = <v2.CategoriesData>[
      v2.CategoriesData(
        id: 1,
        title: 'fake category',
        color: ColorAccent.red.name,
        createdAt: date,
        updatedAt: date,
      ),
    ];
    categoriesDataV3 = <v3.CategoriesData>[
      v3.CategoriesData(
        id: 1,
        title: 'fake category',
        color: ColorAccent.red.name,
        createdAt: date,
        updatedAt: date,
      ),
    ];
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

  test('migration from v1 to v2 does not corrupt data', () async {
    await verifier.testWithDataIntegrity(
      oldVersion: 1,
      newVersion: 2,
      createOld: v1.DatabaseAtV1.new,
      createNew: v2.DatabaseAtV2.new,
      openTestedDatabase: DriftStore.new,
      createItems: (batch, oldDb) {
        batch
          ..insertAll(oldDb.preferences, preferencesDataV1)
          ..insertAll(oldDb.todos, todosDataV1)
          ..insertAll(oldDb.categories, categoriesDataV1);
      },
      validateItems: (newDb) async {
        expect(
          preferencesDataV2,
          await newDb.select(newDb.preferences).get(),
        );
        expect(
          todosDataV2,
          await newDb.select(newDb.todos).get(),
        );
        expect(
          categoriesDataV2,
          await newDb.select(newDb.categories).get(),
        );
      },
    );
  });

  test('migration from v1 to v3 does not corrupt data', () async {
    await verifier.testWithDataIntegrity(
      oldVersion: 1,
      newVersion: 3,
      createOld: v1.DatabaseAtV1.new,
      createNew: v3.DatabaseAtV3.new,
      openTestedDatabase: DriftStore.new,
      createItems: (batch, oldDb) {
        batch
          ..insertAll(oldDb.preferences, preferencesDataV1)
          ..insertAll(oldDb.todos, todosDataV1)
          ..insertAll(oldDb.categories, categoriesDataV1);
      },
      validateItems: (newDb) async {
        expect(
          preferencesDataV3,
          await newDb.select(newDb.preferences).get(),
        );
        expect(
          todosDataV3,
          await newDb.select(newDb.todos).get(),
        );
        expect(
          categoriesDataV3,
          await newDb.select(newDb.categories).get(),
        );
      },
    );
  });
}
