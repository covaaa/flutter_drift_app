import 'package:flutter_drift_app/src/features/todo/todo.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../fakes/fakes.dart';

void main() {
  late Fakes fakes;
  late Todo todo;

  setUp(
    () {
      fakes = Fakes();
      todo = fakes.todo;
    },
  );

  test(
    'should copy with',
    () {
      expect(todo.copyWith(), todo);
    },
  );
}
