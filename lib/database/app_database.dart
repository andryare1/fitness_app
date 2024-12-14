import 'package:fitness/database/dao/exercise_dao.dart';
import 'package:fitness/database/models/exercise.dart';
import 'package:floor/floor.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'app_database.g.dart'; // Генерация файла базы данных

@Database(version: 1, entities: [Exercise])
abstract class AppDatabase extends FloorDatabase {
  ExerciseDao get exerciseDao;
}
