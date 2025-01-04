import 'dart:io';
import 'package:drift/drift.dart';
import 'package:flutter_drift_app/src/shared/drift/store/store.dart';
import 'package:flutter_drift_app/src/shared/local/local.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import '../../../../../fakes/fakes.dart';
import '../../../local/infra/local_service_test.dart';

void main() {
  late Fakes fakes;
  late MockDirectory mockDirectory;
  late MockLocalService mockLocalService;
  late ProviderContainer container;

  setUp(
    () {
      TestWidgetsFlutterBinding.ensureInitialized();
      fakes = Fakes();
      PathProviderPlatform.instance = fakes.platform;
      mockDirectory = MockDirectory();
      mockLocalService = MockLocalService();
      container = ProviderContainer(
        overrides: [localServiceProvider.overrideWithValue(mockLocalService)],
      );
    },
  );

  tearDown(() => container.dispose());

  Future<Directory> mockFetchDirectory() => mockLocalService.fetchDirectory();

  test(
    'should provide instance',
    () {
      when(mockFetchDirectory).thenAnswer((i) async => mockDirectory);
      expect(container.read(driftDatabaseProvider), isA<QueryExecutor>());
    },
  );
}
