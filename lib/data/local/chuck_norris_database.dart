import 'dart:async';

import 'package:chuck_norris_facts/data/local/dao/category_dao.dart';
import 'package:chuck_norris_facts/data/local/dao/search_dao.dart';
import 'package:chuck_norris_facts/data/local/entity/category_entity.dart';
import 'package:chuck_norris_facts/data/local/entity/search_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'chuck_norris_database.g.dart';

@Database(version: 1, entities: [SearchEntity, CategoryEntity])
abstract class ChuckNorrisDatabase extends FloorDatabase {
  SearchDao get searchDao;
  CategoryDao get categoryDao;
}