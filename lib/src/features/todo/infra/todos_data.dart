import 'package:drift/drift.dart';
import 'package:flutter_drift_app/src/shared/local/local.dart';

@DataClassName('TodoData')
class TodosData extends Table with AutoIncrementingPrimaryKey {
  TextColumn get body => text()();
}
