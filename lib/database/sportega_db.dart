// required package imports to make generated code work
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:sportega/database/news/news_dao.dart';
import 'package:sportega/database/news/news_entity.dart';

part 'sportega_db.g.dart'; // the generated code will be there

@Database(version: 1, entities: [NewsEntity])
abstract class SportegaDB extends FloorDatabase {
  NewsDao newsDao;
}
