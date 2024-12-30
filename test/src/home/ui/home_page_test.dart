import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/account/account.dart';
import 'package:flutter_drift_app/src/home/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../extensions/tester_x.dart';
import '../../../fakes/fakes.dart';
import '../../account/infra/preference_service_test.dart';

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
    'counter increments smoke test',
    (tester) async {
      when(mockEmitsPreference).thenAnswer((i) => Stream.value(preference));
      await tester.pumpApp(
        overrides: [
          preferenceServiceProvider.overrideWithValue(mockPreferenceService),
        ],
        child: const HomePage(title: 'Flutter Demo Home Page'),
      );
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    },
  );
}
