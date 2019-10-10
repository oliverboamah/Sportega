// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sportega_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorSportegaDB {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SportegaDBBuilder databaseBuilder(String name) =>
      _$SportegaDBBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SportegaDBBuilder inMemoryDatabaseBuilder() =>
      _$SportegaDBBuilder(null);
}

class _$SportegaDBBuilder {
  _$SportegaDBBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$SportegaDBBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$SportegaDBBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<SportegaDB> build() async {
    final database = _$SportegaDB();
    database.database = await database.open(
      name ?? ':memory:',
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$SportegaDB extends SportegaDB {
  _$SportegaDB([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  NewsDao _newsDaoInstance;

  Future<sqflite.Database> open(String name, List<Migration> migrations,
      [Callback callback]) async {
    final path = join(await sqflite.getDatabasesPath(), name);

    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `NewsEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `image` TEXT, `title` TEXT, `content` TEXT, `category` TEXT, `datetime` TEXT, `url` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  NewsDao get newsDao {
    return _newsDaoInstance ??= _$NewsDao(database, changeListener);
  }
}

class _$NewsDao extends NewsDao {
  _$NewsDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _newsEntityInsertionAdapter = InsertionAdapter(
            database,
            'NewsEntity',
            (NewsEntity item) => <String, dynamic>{
                  'id': item.id,
                  'image': item.image,
                  'title': item.title,
                  'content': item.content,
                  'category': item.category,
                  'datetime': item.datetime,
                  'url': item.url
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _newsEntityMapper = (Map<String, dynamic> row) => NewsEntity(
      row['id'] as int,
      row['image'] as String,
      row['title'] as String,
      row['content'] as String,
      row['category'] as String,
      row['datetime'] as String,
      row['url'] as String);

  final InsertionAdapter<NewsEntity> _newsEntityInsertionAdapter;

  @override
  Future<List<NewsEntity>> getAllNews() async {
    return _queryAdapter.queryList('SELECT * FROM NewsEntity',
        mapper: _newsEntityMapper);
  }

  @override
  Future<void> deleteAllNews() async {
    await _queryAdapter.queryNoReturn('DELETE FROM NewsEntity');
  }

  @override
  Future<void> insertNews(NewsEntity newsEntity) async {
    await _newsEntityInsertionAdapter.insert(
        newsEntity, sqflite.ConflictAlgorithm.abort);
  }
}
