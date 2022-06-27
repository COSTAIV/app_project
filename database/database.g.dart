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

  DayInfosDao? _dayinfosDaoInstance;

  YesterdaySleepDao? _yesterdaysleepDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `Day_infos` (`id` INTEGER, `dateTime` INTEGER NOT NULL, `d_steps` REAL NOT NULL, `sleep_minutes` REAL NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Yesterday_sleep` (`id` INTEGER, `dateTime` INTEGER NOT NULL, `level` TEXT NOT NULL, `entryDateTime` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  DayInfosDao get dayinfosDao {
    return _dayinfosDaoInstance ??= _$DayInfosDao(database, changeListener);
  }

  @override
  YesterdaySleepDao get yesterdaysleepDao {
    return _yesterdaysleepDaoInstance ??=
        _$YesterdaySleepDao(database, changeListener);
  }
}

class _$DayInfosDao extends DayInfosDao {
  _$DayInfosDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _day_infosInsertionAdapter = InsertionAdapter(
            database,
            'Day_infos',
            (Day_infos item) => <String, Object?>{
                  'id': item.id,
                  'dateTime': _dateTimeConverter.encode(item.dateTime),
                  'd_steps': item.d_steps,
                  'sleep_minutes': item.sleep_minutes
                }),
        _day_infosDeletionAdapter = DeletionAdapter(
            database,
            'Day_infos',
            ['id'],
            (Day_infos item) => <String, Object?>{
                  'id': item.id,
                  'dateTime': _dateTimeConverter.encode(item.dateTime),
                  'd_steps': item.d_steps,
                  'sleep_minutes': item.sleep_minutes
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Day_infos> _day_infosInsertionAdapter;

  final DeletionAdapter<Day_infos> _day_infosDeletionAdapter;

  @override
  Future<List<Day_infos>> findAllDayInfos() async {
    return _queryAdapter.queryList(
        'SELECT * FROM Day_infos ORDER BY Day_infos.dateTime ASC',
        mapper: (Map<String, Object?> row) => Day_infos(
            row['id'] as int?,
            _dateTimeConverter.decode(row['dateTime'] as int),
            row['d_steps'] as double,
            row['sleep_minutes'] as double));
  }

  @override
  Future<void> insertDayInfos(Day_infos day_infos) async {
    await _day_infosInsertionAdapter.insert(
        day_infos, OnConflictStrategy.ignore);
  }

  @override
  Future<void> removeDayInfos(Day_infos task) async {
    await _day_infosDeletionAdapter.delete(task);
  }
}

class _$YesterdaySleepDao extends YesterdaySleepDao {
  _$YesterdaySleepDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _yesterday_sleepInsertionAdapter = InsertionAdapter(
            database,
            'Yesterday_sleep',
            (Yesterday_sleep item) => <String, Object?>{
                  'id': item.id,
                  'dateTime': _dateTimeConverter.encode(item.dateTime),
                  'level': item.level,
                  'entryDateTime': _dateTimeConverter.encode(item.entryDateTime)
                }),
        _yesterday_sleepDeletionAdapter = DeletionAdapter(
            database,
            'Yesterday_sleep',
            ['id'],
            (Yesterday_sleep item) => <String, Object?>{
                  'id': item.id,
                  'dateTime': _dateTimeConverter.encode(item.dateTime),
                  'level': item.level,
                  'entryDateTime': _dateTimeConverter.encode(item.entryDateTime)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Yesterday_sleep> _yesterday_sleepInsertionAdapter;

  final DeletionAdapter<Yesterday_sleep> _yesterday_sleepDeletionAdapter;

  @override
  Future<List<Yesterday_sleep>> findAllYesterdaySleep() async {
    return _queryAdapter.queryList(
        'SELECT * FROM Yesterday_sleep ORDER BY Yesterday_sleep.entryDateTime ASC',
        mapper: (Map<String, Object?> row) => Yesterday_sleep(
            row['id'] as int?,
            _dateTimeConverter.decode(row['dateTime'] as int),
            row['level'] as String,
            _dateTimeConverter.decode(row['entryDateTime'] as int)));
  }

  @override
  Future<void> insertYesterdaySleep(Yesterday_sleep yesterday_sleep) async {
    await _yesterday_sleepInsertionAdapter.insert(
        yesterday_sleep, OnConflictStrategy.ignore);
  }

  @override
  Future<void> removeYesterdaySleep(Yesterday_sleep task) async {
    await _yesterday_sleepDeletionAdapter.delete(task);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
