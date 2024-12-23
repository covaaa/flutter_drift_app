import 'package:drift/drift.dart';
import 'package:flutter_drift_app/src/shared/drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../fakes/fakes.dart';

void main() {
  late Fakes fakes;
  late QueryExecutor connection;
  late ProviderContainer container;

  setUp(
    () {
      fakes = Fakes();
      connection = fakes.connection;
      container = ProviderContainer(
        overrides: [localStoreExecutionProvider.overrideWithValue(connection)],
      );
    },
  );

  tearDown(() => container.dispose());

  test(
    'should provide instance',
    () async {
      expect(container.read(localStoreProvider), isA<LocalStore>());
    },
  );
}
