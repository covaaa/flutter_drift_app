import 'package:drift/drift.dart';
import 'package:flutter_drift_app/src/shared/drift/store/store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDatabaseConnectionUser extends Mock
    implements DatabaseConnectionUser {}

class MockGeneratedDatabase extends Mock implements GeneratedDatabase {}

void main() {
  late MockDatabaseConnectionUser mockDatabaseConnectionUser;
  late MockGeneratedDatabase mockGeneratedDatabase;
  late Schema2 schema2;
  late Shape0 preferences;
  late Shape1 todos;
  late Shape2 categories;

  setUp(
    () {
      mockDatabaseConnectionUser = MockDatabaseConnectionUser();
      mockGeneratedDatabase = MockGeneratedDatabase();
      schema2 = Schema2(database: mockDatabaseConnectionUser);
      preferences = schema2.preferences;
      todos = schema2.todos;
      categories = schema2.categories;
    },
  );

  test(
    'preferences getters should have the correct column names',
    () {
      expect(preferences.id.$name, 'id');
      expect(preferences.mode.$name, 'mode');
      expect(preferences.color.$name, 'color');
      expect(preferences.createdAt.$name, 'created_at');
      expect(preferences.updatedAt.$name, 'updated_at');
    },
  );

  test(
    'todos getters should have the correct column names',
    () {
      expect(todos.id.$name, 'id');
      expect(todos.title.$name, 'title');
      expect(todos.category.$name, 'category');
      expect(todos.due.$name, 'due');
      expect(todos.createdAt.$name, 'created_at');
      expect(todos.updatedAt.$name, 'updated_at');
    },
  );

  test(
    'categories getters should have the correct column names',
    () {
      expect(categories.id.$name, 'id');
      expect(categories.title.$name, 'title');
      expect(categories.color.$name, 'color');
      expect(categories.createdAt.$name, 'created_at');
      expect(categories.updatedAt.$name, 'updated_at');
    },
  );

  test(
    'throws ArgumentError for unknown versions',
    () async {
      final migration = migrationSteps(
        from1To2: (migrator, schema) async {},
        from2To3: (migrator, schema) async {},
      );
      expect(
        () async => migration(3, mockGeneratedDatabase),
        throwsA(isA<ArgumentError>()),
      );
    },
  );
}
