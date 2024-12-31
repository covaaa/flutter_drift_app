import 'package:flutter_drift_app/src/features/account/account.dart';
import 'package:flutter_drift_app/src/features/home/home.dart';
import 'package:flutter_drift_app/src/shared/core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../extensions/tester_x.dart';
import '../../../../fakes/fakes.dart';
import '../../../features/account/infra/preference_service_test.dart';

void main() {
  late Fakes fakes;
  late Preference preference;
  late MockPreferenceService mockPreferenceService;

  setUp(
    () {
      fakes = Fakes();
      preference = fakes.preference;
      mockPreferenceService = MockPreferenceService();
    },
  );

  Stream<Preference> mockEmitsPreference() {
    return mockPreferenceService.emitsPreference();
  }

  testWidgets(
    'should render app',
    (tester) async {
      when(mockEmitsPreference).thenAnswer((i) => Stream.value(preference));
      await tester.pumpRiverpodWidget(
        overrides: [
          preferenceServiceProvider.overrideWithValue(mockPreferenceService),
        ],
        child: const App(),
      );
      verify(mockEmitsPreference).called(1);
      expect(find.byType(LoadingPage), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    },
  );
}
