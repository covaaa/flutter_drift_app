import 'package:flutter_drift_app/src/features/account/account.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../fakes/fakes.dart';
import '../../../features/account/infra/preference_service_test.dart';

void main() {
  late Fakes fakes;
  late Preference preference;
  late MockPreferenceService mockPreferenceService;
  late ProviderContainer container;

  setUp(
    () {
      fakes = Fakes();
      preference = fakes.preference;
      mockPreferenceService = MockPreferenceService();
      container = ProviderContainer(
        overrides: [
          preferenceServiceProvider.overrideWithValue(mockPreferenceService),
        ],
      );
    },
  );

  Stream<Preference> mockEmitsPreference() {
    return mockPreferenceService.emitsPreference();
  }

  test(
    'should read preference',
    () {
      when(mockEmitsPreference).thenAnswer((i) => Stream.value(preference));
      expect(
        container.read(readPreferenceProvider.future),
        completion(preference),
      );
    },
  );
}
