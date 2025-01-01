import 'package:flutter_drift_app/src/features/todo/todo.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../fakes/fakes.dart';

void main() {
  late Fakes fakes;
  late Todo todo;

  setUp(
    () {
      fakes = Fakes();
      todo = fakes.todo4;
    },
  );

  test(
    'should get props',
    () {
      expect(todo.props, isA<List<Object?>>());
    },
  );

  test(
    'should copy with title',
    () {
      expect(todo.copyWith().title, todo.title);
      expect(todo.copyWith().due, todo.due);
    },
  );
}
