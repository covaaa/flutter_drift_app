import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/account/account.dart';
import 'package:flutter_drift_app/src/core/core.dart';
import 'package:flutter_drift_app/src/drift/store/store.dart' hide Preference;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../fakes/fakes.dart';

class MockPreferenceService extends Mock implements PreferenceService {}

void main() {
  late Fakes fakes;
  late Preference preference;
  late QueryExecutor connection;
  late ProviderContainer container;
  late PreferenceService service;

  setUp(
    () {
      fakes = Fakes();
      preference = fakes.preference;
      connection = fakes.connection;
      container = ProviderContainer(
        overrides: [driftDatabaseProvider.overrideWithValue(connection)],
      );
      service = container.read(preferenceServiceProvider);
    },
  );

  tearDown(() => container.dispose());

  test(
    'should create preference',
    () {
      expect(service.createPreference(preference), completion(2));
    },
  );

  test(
    'should update preference',
    () async {
      await service.createPreference(preference);
      expect(service.updatePreference(preference), completion(2));
    },
  );

  test(
    'should emits some preference',
    () async {
      expect(
        service.emitsPreference(),
        emits(
          isA<Preference>().having(
            (preference) => [preference.mode, preference.color],
            'should be system, deep purple',
            [ThemeMode.system, ColorSeed.deepPurple],
          ),
        ),
      );
    },
  );
}
