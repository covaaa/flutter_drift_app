import 'package:flutter_drift_app/src/shared/core/domain/failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'should get props',
    () => expect(const Failure('fake message').props, isA<List<Object?>>()),
  );
}
