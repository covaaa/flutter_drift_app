import 'package:drift/drift.dart';
import 'package:flutter_drift_app/src/shared/drift/store/store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import '../../../../../fakes/fakes.dart';

void main() {
  late Fakes fakes;
  late ProviderContainer container;

  setUp(
    () {
      TestWidgetsFlutterBinding.ensureInitialized();
      fakes = Fakes();
      PathProviderPlatform.instance = fakes.platform;
      container = ProviderContainer();
    },
  );

  tearDown(() => container.dispose());

  test(
    'should provide instance',
    () => expect(container.read(driftDatabaseProvider), isA<QueryExecutor>()),
  );
}
