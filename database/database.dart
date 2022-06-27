//Imports that are necessary to the code generator of floor
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:city_app/database/typeConverters/dateTimeConverter.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

//Here, we are importing the entities and the daos of the database
import 'daos/DayInfosDaos.dart';
import 'entities/dayinfos.dart';
import 'daos/YeasterdaySleepDaos.dart';
import 'entities/yeasterdaysleep.dart';

//The generated code will be in database.g.dart
part 'database.g.dart';

//Here we are saying that this is the first version of the Database and it has just 1 entity, i.e., Todo
@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [Day_infos, Yeasterday_sleep])
abstract class AppDatabase extends FloorDatabase {
  //Add all the daos as getters here
  DayInfosDao get dayinfosDao;
  YeasterdaySleepDao get yeasterdaysleepDao;
}//AppDatabase