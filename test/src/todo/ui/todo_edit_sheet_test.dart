import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/todo/todo.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../extensions/tester_x.dart';
import '../../../fakes/fakes.dart';

void main() {
  late Fakes fakes;
  late DriftTodo driftTodo;
  setUp(
    () {
      fakes = Fakes();
      driftTodo = fakes.driftTodo1;
    },
  );

  testWidgets(
    'should show update sheet',
    (tester) async {
      await tester.pumpApp(child: TodoEditSheet(driftTodo));
      await tester.tap(find.byIcon(Icons.edit_outlined));
      await tester.pumpAndSettle();
      expect(find.byType(TodoUpdateSheet), findsOneWidget);
    },
  );

  testWidgets(
    'should show delete dialog',
    (tester) async {
      await tester.pumpApp(child: TodoEditSheet(driftTodo));
      await tester.tap(find.byIcon(Icons.delete_outlined));
      await tester.pumpAndSettle();
      expect(find.byType(TodoDeleteDialog), findsOneWidget);
    },
  );
}
