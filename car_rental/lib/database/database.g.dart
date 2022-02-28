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

  CarDAO? _carDAOInstance;

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
            'CREATE TABLE IF NOT EXISTS `LoadCar` (`sId` TEXT, `name` TEXT, `image` TEXT, `capacity` INTEGER, `fuelType` TEXT, `rentPerHour` INTEGER, `createdAt` TEXT, `updatedAt` TEXT, `iV` INTEGER, PRIMARY KEY (`sId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CarDAO get carDAO {
    return _carDAOInstance ??= _$CarDAO(database, changeListener);
  }
}

class _$CarDAO extends CarDAO {
  _$CarDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _loadCarInsertionAdapter = InsertionAdapter(
            database,
            'LoadCar',
            (LoadCar item) => <String, Object?>{
                  'sId': item.sId,
                  'name': item.name,
                  'image': item.image,
                  'capacity': item.capacity,
                  'fuelType': item.fuelType,
                  'rentPerHour': item.rentPerHour,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt,
                  'iV': item.iV
                },
            changeListener),
        _loadCarUpdateAdapter = UpdateAdapter(
            database,
            'LoadCar',
            ['sId'],
            (LoadCar item) => <String, Object?>{
                  'sId': item.sId,
                  'name': item.name,
                  'image': item.image,
                  'capacity': item.capacity,
                  'fuelType': item.fuelType,
                  'rentPerHour': item.rentPerHour,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt,
                  'iV': item.iV
                },
            changeListener),
        _loadCarDeletionAdapter = DeletionAdapter(
            database,
            'LoadCar',
            ['sId'],
            (LoadCar item) => <String, Object?>{
                  'sId': item.sId,
                  'name': item.name,
                  'image': item.image,
                  'capacity': item.capacity,
                  'fuelType': item.fuelType,
                  'rentPerHour': item.rentPerHour,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt,
                  'iV': item.iV
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<LoadCar> _loadCarInsertionAdapter;

  final UpdateAdapter<LoadCar> _loadCarUpdateAdapter;

  final DeletionAdapter<LoadCar> _loadCarDeletionAdapter;

  @override
  Stream<List<LoadCar>> getAllItemInCarBySid(String sid) {
    return _queryAdapter.queryListStream('SELECT * FROM CAR WHERE sid=?1',
        mapper: (Map<String, Object?> row) => LoadCar(
            sId: row['sId'] as String?,
            name: row['name'] as String?,
            image: row['image'] as String?,
            capacity: row['capacity'] as int?,
            fuelType: row['fuelType'] as String?,
            rentPerHour: row['rentPerHour'] as int?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?,
            iV: row['iV'] as int?),
        arguments: [sid],
        queryableName: 'LoadCar',
        isView: false);
  }

  @override
  Stream<List<LoadCar>> getItemInCarBySid(String sid, String id) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM CAR WHERE sid=?1 AND id=?2',
        mapper: (Map<String, Object?> row) => LoadCar(
            sId: row['sId'] as String?,
            name: row['name'] as String?,
            image: row['image'] as String?,
            capacity: row['capacity'] as int?,
            fuelType: row['fuelType'] as String?,
            rentPerHour: row['rentPerHour'] as int?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?,
            iV: row['iV'] as int?),
        arguments: [sid, id],
        queryableName: 'LoadCar',
        isView: false);
  }

  @override
  Stream<List<LoadCar>> clearCarBySid(String sid) {
    return _queryAdapter.queryListStream('DELETE FROM CAR where sid=?1',
        mapper: (Map<String, Object?> row) => LoadCar(
            sId: row['sId'] as String?,
            name: row['name'] as String?,
            image: row['image'] as String?,
            capacity: row['capacity'] as int?,
            fuelType: row['fuelType'] as String?,
            rentPerHour: row['rentPerHour'] as int?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?,
            iV: row['iV'] as int?),
        arguments: [sid],
        queryableName: 'LoadCar',
        isView: false);
  }

  @override
  Future<void> insertCar(LoadCar DisplayCar) async {
    await _loadCarInsertionAdapter.insert(DisplayCar, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCar(LoadCar DisplayCar) async {
    await _loadCarUpdateAdapter.update(DisplayCar, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCar(LoadCar DisplayCar) async {
    await _loadCarDeletionAdapter.delete(DisplayCar);
  }
}
