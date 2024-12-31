import 'package:flutter_drift_app/src/shared/drift/store/store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'should get props',
    () {
      expect(const DriftIdOf(id: 1, value: 'fake').props, isA<List<Object?>>());
    },
  );
}
