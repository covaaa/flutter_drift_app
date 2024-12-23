import 'package:flutter_drift_app/src/features/todo/todo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'should get props',
    () {
      final data = TodosData();
      expect(() => data.id, throwsUnsupportedError);
      expect(() => data.body, throwsUnsupportedError);
      expect(() => data.due, throwsUnsupportedError);
    },
  );
}
