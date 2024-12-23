import 'package:drift/drift.dart';
import 'package:flutter_drift_app/src/shared/drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDatabaseConnectionUser extends Mock
    implements DatabaseConnectionUser {}

class MockGeneratedDatabase extends Mock implements GeneratedDatabase {}

void main() {
  late MockDatabaseConnectionUser mockDatabaseConnectionUser;
  late MockGeneratedDatabase mockGeneratedDatabase;

  setUp(
    () {
      mockDatabaseConnectionUser = MockDatabaseConnectionUser();
      mockGeneratedDatabase = MockGeneratedDatabase();
    },
  );

  test(
    'id, body, and due getters return the correct columns',
    () {
      final schema = Schema2(database: mockDatabaseConnectionUser);
      final todosData = schema.todosData;
      expect(todosData.id.$name, 'id');
      expect(todosData.body.$name, 'body');
      expect(todosData.due.$name, 'due');
    },
  );

  test(
    'throws ArgumentError for unknown versions',
    () async {
      final migration = migrationSteps(
        from1To2: (migrator, schema) async {},
      );
      expect(
        () async => migration(3, mockGeneratedDatabase),
        throwsA(isA<ArgumentError>()),
      );
    },
  );
}
