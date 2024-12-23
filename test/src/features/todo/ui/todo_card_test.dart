import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/todo/todo.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../extensions/tester_x.dart';
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

  testWidgets(
    'should show edit sheet',
    (tester) async {
      await tester.pumpApp(child: TodoCard(todo));
      await tester.tap(find.byIcon(Icons.more_vert_outlined));
      await tester.pumpAndSettle();
      expect(find.byType(TodoEditSheet), findsOneWidget);
    },
  );
}
