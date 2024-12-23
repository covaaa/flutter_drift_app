import 'package:drift/drift.dart';
import 'package:flutter_drift_app/src/shared/drift/drift.dart';

extension type TodoCreatable._(Insertable<TodoData> _insertable)
    implements Insertable<TodoData> {
  factory TodoCreatable({required String body, DateTime? due}) {
    return TodoCreatable._(
      TodosDataCompanion.insert(body: body, due: Value(due)),
    );
  }
}
