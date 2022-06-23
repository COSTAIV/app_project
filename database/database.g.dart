// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  DayStepsDao? _daystepsDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Day_steps` (`id` INTEGER, `dateTime` INTEGER NOT NULL, `d_steps` REAL NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  DayStepsDao get daystepsDao {
    return _daystepsDaoInstance ??= _$DayStepsDao(database, changeListener);
  }
}

class _$DayStepsDao extends DayStepsDao {
  _$DayStepsDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _day_stepsInsertionAdapter = InsertionAdapter(
            database,
            'Day_steps',
            (Day_steps item) => <String, Object?>{
                  'id': item.id,
                  'dateTime': _dateTimeConverter.encode(item.dateTime),
                  'd_steps': item.d_steps
                }),
        _day_stepsDeletionAdapter = DeletionAdapter(
            database,
            'Day_steps',
            ['id'],
            (Day_steps item) => <String, Object?>{
                  'id': item.id,
                  'dateTime': _dateTimeConverter.encode(item.dateTime),
                  'd_steps': item.d_steps
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Day_steps> _day_stepsInsertionAdapter;

  final DeletionAdapter<Day_steps> _day_stepsDeletionAdapter;

  @override
  Future<List<Day_steps>> findAllDaySteps() async {
    return _queryAdapter.queryList('SELECT * FROM Day_steps',
        mapper: (Map<String, Object?> row) => Day_steps(
            row['id'] as int?,
            _dateTimeConverter.decode(row['dateTime'] as int),
            row['d_steps'] as double));
  }

  @override
  Future<void> insertDaySteps(Day_steps day_steps) async {
    await _day_stepsInsertionAdapter.insert(
        day_steps, OnConflictStrategy.ignore);
  }

  @override
  Future<void> removeDaySteps(Day_steps task) async {
    await _day_stepsDeletionAdapter.delete(task);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
