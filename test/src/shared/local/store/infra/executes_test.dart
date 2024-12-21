import 'package:drift/drift.dart';
import 'package:flutter_drift_app/src/shared/local/local.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ProviderContainer container;

  setUp(
    () {
      container = ProviderContainer();
    },
  );

  test(
    'should provide instance',
    () async {
      expect(container.read(localStoreExecutionProvider), isA<QueryExecutor>());
    },
  );
}
