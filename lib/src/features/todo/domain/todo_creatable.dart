import 'package:drift/drift.dart';
import 'package:flutter_drift_app/src/shared/local/local.dart';

extension type TodoCreatable._(Insertable<TodoData> _insertable)
    implements Insertable<TodoData> {
  factory TodoCreatable({required String body}) {
    return TodoCreatable._(
      TodosDataCompanion.insert(body: body),
    );
  }
}
