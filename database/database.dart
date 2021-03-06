//Imports that are necessary to the code generator of floor
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:city_app/database/typeConverters/dateTimeConverter.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

//Here, we are importing the entities and the daos of the database
import 'daos/DayInfosDaos.dart';
import 'entities/dayinfos.dart';
import 'daos/YesterdaySleepDaos.dart';
import 'entities/yesterdaysleep.dart';

//The generated code will be in database.g.dart
part 'database.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [Day_infos, Yesterday_sleep])
abstract class AppDatabase extends FloorDatabase {
  //Add all the daos as getters here
  DayInfosDao get dayinfosDao;
  YesterdaySleepDao get yesterdaysleepDao;
}//AppDatabase