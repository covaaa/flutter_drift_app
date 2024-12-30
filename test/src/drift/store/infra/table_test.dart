import 'package:flutter_drift_app/src/drift/store/store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Preferences preferences;

  setUp(() => preferences = Preferences());

  test(
    'should get props',
    () {
      expect(() => preferences.id, throwsUnsupportedError);
      expect(() => preferences.mode, throwsUnsupportedError);
      expect(() => preferences.color, throwsUnsupportedError);
      expect(() => preferences.createdAt, throwsUnsupportedError);
      expect(() => preferences.updatedAt, throwsUnsupportedError);
    },
  );
}
