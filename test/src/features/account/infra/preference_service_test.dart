import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/account/account.dart';
import 'package:flutter_drift_app/src/shared/core/core.dart';
import 'package:flutter_drift_app/src/shared/drift/store/store.dart'
    hide Preference;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../fakes/fakes.dart';

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
    'should update preference',
    () {
      expect(service.updatePreference(preference), completion(isA<void>()));
    },
  );

  test(
    'should emits some preference',
    () {
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
