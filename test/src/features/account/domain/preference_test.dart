import 'package:flutter_drift_app/src/features/account/account.dart';
import 'package:flutter_test/flutter_test.dart';
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

  test(
    'should get props',
    () {
      expect(preference.props, isA<List<Object?>>());
    },
  );
}
