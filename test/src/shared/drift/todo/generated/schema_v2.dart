// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class TodosData extends Table with TableInfo<TodosData, TodosDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TodosData(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> due = GeneratedColumn<DateTime>(
      'due', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, body, due];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todos_data';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodosDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodosDataData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      due: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due']),
    );
  }

  @override
  TodosData createAlias(String alias) {
    return TodosData(attachedDatabase, alias);
  }
}

class TodosDataData extends DataClass implements Insertable<TodosDataData> {
  final int id;
  final String body;
  final DateTime? due;
  const TodosDataData({required this.id, required this.body, this.due});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['body'] = Variable<String>(body);
    if (!nullToAbsent || due != null) {
      map['due'] = Variable<DateTime>(due);
    }
    return map;
  }

  TodosDataCompanion toCompanion(bool nullToAbsent) {
    return TodosDataCompanion(
      id: Value(id),
      body: Value(body),
      due: due == null && nullToAbsent ? const Value.absent() : Value(due),
    );
  }

  factory TodosDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodosDataData(
      id: serializer.fromJson<int>(json['id']),
      body: serializer.fromJson<String>(json['body']),
      due: serializer.fromJson<DateTime?>(json['due']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'body': serializer.toJson<String>(body),
      'due': serializer.toJson<DateTime?>(due),
    };
  }

  TodosDataData copyWith(
          {int? id,
          String? body,
          Value<DateTime?> due = const Value.absent()}) =>
      TodosDataData(
        id: id ?? this.id,
        body: body ?? this.body,
        due: due.present ? due.value : this.due,
      );
  TodosDataData copyWithCompanion(TodosDataCompanion data) {
    return TodosDataData(
      id: data.id.present ? data.id.value : this.id,
      body: data.body.present ? data.body.value : this.body,
      due: data.due.present ? data.due.value : this.due,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodosDataData(')
          ..write('id: $id, ')
          ..write('body: $body, ')
          ..write('due: $due')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, body, due);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodosDataData &&
          other.id == this.id &&
          other.body == this.body &&
          other.due == this.due);
}

class TodosDataCompanion extends UpdateCompanion<TodosDataData> {
  final Value<int> id;
  final Value<String> body;
  final Value<DateTime?> due;
  const TodosDataCompanion({
    this.id = const Value.absent(),
    this.body = const Value.absent(),
    this.due = const Value.absent(),
  });
  TodosDataCompanion.insert({
    this.id = const Value.absent(),
    required String body,
    this.due = const Value.absent(),
  }) : body = Value(body);
  static Insertable<TodosDataData> custom({
    Expression<int>? id,
    Expression<String>? body,
    Expression<DateTime>? due,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (body != null) 'body': body,
      if (due != null) 'due': due,
    });
  }

  TodosDataCompanion copyWith(
      {Value<int>? id, Value<String>? body, Value<DateTime?>? due}) {
    return TodosDataCompanion(
      id: id ?? this.id,
      body: body ?? this.body,
      due: due ?? this.due,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (due.present) {
      map['due'] = Variable<DateTime>(due.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosDataCompanion(')
          ..write('id: $id, ')
          ..write('body: $body, ')
          ..write('due: $due')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV2 extends GeneratedDatabase {
  DatabaseAtV2(QueryExecutor e) : super(e);
  late final TodosData todosData = TodosData(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todosData];
  @override
  int get schemaVersion => 2;
}
