import 'package:flutter_drift_app/src/features/account/account.dart';
import 'package:flutter_drift_app/src/features/home/home.dart';
import 'package:flutter_drift_app/src/shared/core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../extensions/tester_x.dart';
import '../../../../fakes/fakes.dart';

void main() {
  late Fakes fakes;
  late Preference preference;

  setUp(
    () {
      fakes = Fakes();
      preference = fakes.preference;
    },
  );

  testWidgets(
    'should render preference app',
    (tester) async {
      await tester.pumpRiverpodWidget(child: App(Right(preference)));
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    },
  );

  testWidgets(
    'should render failure app',
    (tester) async {
      await tester.pumpRiverpodWidget(
        child: const App(Left(Failure('some exception'))),
      );
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsNothing);
    },
  );
}
