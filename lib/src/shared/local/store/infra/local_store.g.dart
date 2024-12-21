// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore

// coverage:ignore-file

part of 'local_store.dart';

// ignore_for_file: type=lint
class $TodosDataTable extends TodosData
    with TableInfo<$TodosDataTable, TodoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodosDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, body];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todos_data';
  @override
  VerificationContext validateIntegrity(Insertable<TodoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
    );
  }

  @override
  $TodosDataTable createAlias(String alias) {
    return $TodosDataTable(attachedDatabase, alias);
  }
}

class TodoData extends DataClass implements Insertable<TodoData> {
  final int id;
  final String body;
  const TodoData({required this.id, required this.body});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['body'] = Variable<String>(body);
    return map;
  }

  TodosDataCompanion toCompanion(bool nullToAbsent) {
    return TodosDataCompanion(
      id: Value(id),
      body: Value(body),
    );
  }

  factory TodoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoData(
      id: serializer.fromJson<int>(json['id']),
      body: serializer.fromJson<String>(json['body']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'body': serializer.toJson<String>(body),
    };
  }

  TodoData copyWith({int? id, String? body}) => TodoData(
        id: id ?? this.id,
        body: body ?? this.body,
      );
  TodoData copyWithCompanion(TodosDataCompanion data) {
    return TodoData(
      id: data.id.present ? data.id.value : this.id,
      body: data.body.present ? data.body.value : this.body,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodoData(')
          ..write('id: $id, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, body);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoData && other.id == this.id && other.body == this.body);
}

class TodosDataCompanion extends UpdateCompanion<TodoData> {
  final Value<int> id;
  final Value<String> body;
  const TodosDataCompanion({
    this.id = const Value.absent(),
    this.body = const Value.absent(),
  });
  TodosDataCompanion.insert({
    this.id = const Value.absent(),
    required String body,
  }) : body = Value(body);
  static Insertable<TodoData> custom({
    Expression<int>? id,
    Expression<String>? body,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (body != null) 'body': body,
    });
  }

  TodosDataCompanion copyWith({Value<int>? id, Value<String>? body}) {
    return TodosDataCompanion(
      id: id ?? this.id,
      body: body ?? this.body,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosDataCompanion(')
          ..write('id: $id, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalStore extends GeneratedDatabase {
  _$LocalStore(QueryExecutor e) : super(e);
  $LocalStoreManager get managers => $LocalStoreManager(this);
  late final $TodosDataTable todosData = $TodosDataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todosData];
}

typedef $$TodosDataTableCreateCompanionBuilder = TodosDataCompanion Function({
  Value<int> id,
  required String body,
});
typedef $$TodosDataTableUpdateCompanionBuilder = TodosDataCompanion Function({
  Value<int> id,
  Value<String> body,
});

class $$TodosDataTableFilterComposer
    extends Composer<_$LocalStore, $TodosDataTable> {
  $$TodosDataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnFilters(column));
}

class $$TodosDataTableOrderingComposer
    extends Composer<_$LocalStore, $TodosDataTable> {
  $$TodosDataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnOrderings(column));
}

class $$TodosDataTableAnnotationComposer
    extends Composer<_$LocalStore, $TodosDataTable> {
  $$TodosDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);
}

class $$TodosDataTableTableManager extends RootTableManager<
    _$LocalStore,
    $TodosDataTable,
    TodoData,
    $$TodosDataTableFilterComposer,
    $$TodosDataTableOrderingComposer,
    $$TodosDataTableAnnotationComposer,
    $$TodosDataTableCreateCompanionBuilder,
    $$TodosDataTableUpdateCompanionBuilder,
    (TodoData, BaseReferences<_$LocalStore, $TodosDataTable, TodoData>),
    TodoData,
    PrefetchHooks Function()> {
  $$TodosDataTableTableManager(_$LocalStore db, $TodosDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TodosDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TodosDataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TodosDataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> body = const Value.absent(),
          }) =>
              TodosDataCompanion(
            id: id,
            body: body,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String body,
          }) =>
              TodosDataCompanion.insert(
            id: id,
            body: body,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TodosDataTableProcessedTableManager = ProcessedTableManager<
    _$LocalStore,
    $TodosDataTable,
    TodoData,
    $$TodosDataTableFilterComposer,
    $$TodosDataTableOrderingComposer,
    $$TodosDataTableAnnotationComposer,
    $$TodosDataTableCreateCompanionBuilder,
    $$TodosDataTableUpdateCompanionBuilder,
    (TodoData, BaseReferences<_$LocalStore, $TodosDataTable, TodoData>),
    TodoData,
    PrefetchHooks Function()>;

class $LocalStoreManager {
  final _$LocalStore _db;
  $LocalStoreManager(this._db);
  $$TodosDataTableTableManager get todosData =>
      $$TodosDataTableTableManager(_db, _db.todosData);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localStoreHash() => r'8de943ae20c1e18c7e54e562c2535b8cebddbdec';

/// See also [localStore].
@ProviderFor(localStore)
final localStoreProvider = AutoDisposeProvider<LocalStore>.internal(
  localStore,
  name: r'localStoreProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$localStoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocalStoreRef = AutoDisposeProviderRef<LocalStore>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
