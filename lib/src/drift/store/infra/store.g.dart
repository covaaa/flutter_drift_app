// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore

// coverage:ignore-file

part of 'store.dart';

// ignore_for_file: type=lint
class $PreferencesTable extends Preferences
    with TableInfo<$PreferencesTable, Preference> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreferencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _modeMeta = const VerificationMeta('mode');
  @override
  late final GeneratedColumnWithTypeConverter<ThemeMode, String> mode =
      GeneratedColumn<String>('mode', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              clientDefault: () => ThemeMode.system.name)
          .withConverter<ThemeMode>($PreferencesTable.$convertermode);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumnWithTypeConverter<ColorSeed, String> color =
      GeneratedColumn<String>('color', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              clientDefault: () => ColorSeed.deepPurple.name)
          .withConverter<ColorSeed>($PreferencesTable.$convertercolor);
  @override
  List<GeneratedColumn> get $columns => [id, createdAt, updatedAt, mode, color];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'preferences';
  @override
  VerificationContext validateIntegrity(Insertable<Preference> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    context.handle(_modeMeta, const VerificationResult.success());
    context.handle(_colorMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Preference map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Preference(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      mode: $PreferencesTable.$convertermode.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mode'])!),
      color: $PreferencesTable.$convertercolor.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!),
    );
  }

  @override
  $PreferencesTable createAlias(String alias) {
    return $PreferencesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ThemeMode, String, String> $convertermode =
      const EnumNameConverter<ThemeMode>(ThemeMode.values);
  static JsonTypeConverter2<ColorSeed, String, String> $convertercolor =
      const EnumNameConverter<ColorSeed>(ColorSeed.values);
}

class Preference extends DataClass implements Insertable<Preference> {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ThemeMode mode;
  final ColorSeed color;
  const Preference(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.mode,
      required this.color});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    {
      map['mode'] =
          Variable<String>($PreferencesTable.$convertermode.toSql(mode));
    }
    {
      map['color'] =
          Variable<String>($PreferencesTable.$convertercolor.toSql(color));
    }
    return map;
  }

  PreferencesCompanion toCompanion(bool nullToAbsent) {
    return PreferencesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      mode: Value(mode),
      color: Value(color),
    );
  }

  factory Preference.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Preference(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      mode: $PreferencesTable.$convertermode
          .fromJson(serializer.fromJson<String>(json['mode'])),
      color: $PreferencesTable.$convertercolor
          .fromJson(serializer.fromJson<String>(json['color'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'mode': serializer
          .toJson<String>($PreferencesTable.$convertermode.toJson(mode)),
      'color': serializer
          .toJson<String>($PreferencesTable.$convertercolor.toJson(color)),
    };
  }

  Preference copyWith(
          {int? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          ThemeMode? mode,
          ColorSeed? color}) =>
      Preference(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        mode: mode ?? this.mode,
        color: color ?? this.color,
      );
  Preference copyWithCompanion(PreferencesCompanion data) {
    return Preference(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      mode: data.mode.present ? data.mode.value : this.mode,
      color: data.color.present ? data.color.value : this.color,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Preference(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('mode: $mode, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, updatedAt, mode, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Preference &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.mode == this.mode &&
          other.color == this.color);
}

class PreferencesCompanion extends UpdateCompanion<Preference> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<ThemeMode> mode;
  final Value<ColorSeed> color;
  const PreferencesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.mode = const Value.absent(),
    this.color = const Value.absent(),
  });
  PreferencesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.mode = const Value.absent(),
    this.color = const Value.absent(),
  })  : createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Preference> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? mode,
    Expression<String>? color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (mode != null) 'mode': mode,
      if (color != null) 'color': color,
    });
  }

  PreferencesCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<ThemeMode>? mode,
      Value<ColorSeed>? color}) {
    return PreferencesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      mode: mode ?? this.mode,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (mode.present) {
      map['mode'] =
          Variable<String>($PreferencesTable.$convertermode.toSql(mode.value));
    }
    if (color.present) {
      map['color'] = Variable<String>(
          $PreferencesTable.$convertercolor.toSql(color.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreferencesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('mode: $mode, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftStore extends GeneratedDatabase {
  _$DriftStore(QueryExecutor e) : super(e);
  $DriftStoreManager get managers => $DriftStoreManager(this);
  late final $PreferencesTable preferences = $PreferencesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [preferences];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$PreferencesTableCreateCompanionBuilder = PreferencesCompanion
    Function({
  Value<int> id,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<ThemeMode> mode,
  Value<ColorSeed> color,
});
typedef $$PreferencesTableUpdateCompanionBuilder = PreferencesCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<ThemeMode> mode,
  Value<ColorSeed> color,
});

class $$PreferencesTableFilterComposer
    extends Composer<_$DriftStore, $PreferencesTable> {
  $$PreferencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ThemeMode, ThemeMode, String> get mode =>
      $composableBuilder(
          column: $table.mode,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<ColorSeed, ColorSeed, String> get color =>
      $composableBuilder(
          column: $table.color,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$PreferencesTableOrderingComposer
    extends Composer<_$DriftStore, $PreferencesTable> {
  $$PreferencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mode => $composableBuilder(
      column: $table.mode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));
}

class $$PreferencesTableAnnotationComposer
    extends Composer<_$DriftStore, $PreferencesTable> {
  $$PreferencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ThemeMode, String> get mode =>
      $composableBuilder(column: $table.mode, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ColorSeed, String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);
}

class $$PreferencesTableTableManager extends RootTableManager<
    _$DriftStore,
    $PreferencesTable,
    Preference,
    $$PreferencesTableFilterComposer,
    $$PreferencesTableOrderingComposer,
    $$PreferencesTableAnnotationComposer,
    $$PreferencesTableCreateCompanionBuilder,
    $$PreferencesTableUpdateCompanionBuilder,
    (Preference, BaseReferences<_$DriftStore, $PreferencesTable, Preference>),
    Preference,
    PrefetchHooks Function()> {
  $$PreferencesTableTableManager(_$DriftStore db, $PreferencesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PreferencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PreferencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PreferencesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<ThemeMode> mode = const Value.absent(),
            Value<ColorSeed> color = const Value.absent(),
          }) =>
              PreferencesCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            mode: mode,
            color: color,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<ThemeMode> mode = const Value.absent(),
            Value<ColorSeed> color = const Value.absent(),
          }) =>
              PreferencesCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            mode: mode,
            color: color,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PreferencesTableProcessedTableManager = ProcessedTableManager<
    _$DriftStore,
    $PreferencesTable,
    Preference,
    $$PreferencesTableFilterComposer,
    $$PreferencesTableOrderingComposer,
    $$PreferencesTableAnnotationComposer,
    $$PreferencesTableCreateCompanionBuilder,
    $$PreferencesTableUpdateCompanionBuilder,
    (Preference, BaseReferences<_$DriftStore, $PreferencesTable, Preference>),
    Preference,
    PrefetchHooks Function()>;

class $DriftStoreManager {
  final _$DriftStore _db;
  $DriftStoreManager(this._db);
  $$PreferencesTableTableManager get preferences =>
      $$PreferencesTableTableManager(_db, _db.preferences);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$driftStoreHash() => r'b1c3ec4cafa05cc4d31fb68304ff7f8360c8c0d9';

/// See also [driftStore].
@ProviderFor(driftStore)
final driftStoreProvider = AutoDisposeProvider<DriftStore>.internal(
  driftStore,
  name: r'driftStoreProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$driftStoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DriftStoreRef = AutoDisposeProviderRef<DriftStore>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
