import 'package:city_app/database/database.dart';
import 'package:city_app/database/entities/dayinfos.dart';
import 'package:flutter/material.dart';

class DatabaseRepository extends ChangeNotifier {
  //The state of the database is just the AppDatabase
  final AppDatabase database;

  //Default constructor
  DatabaseRepository({required this.database});

  //This method wraps the findAllTodos() method of the DAO
  Future<List<Day_infos>> findAllDayInfos() async {
    final results = await database.dayinfosDao.findAllDayInfos();
    return results;
  } //findAllTodos

  //This method wraps the insertTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> insertDayInfos(Day_infos day_infos) async {
    await database.dayinfosDao.insertDayInfos(day_infos);
    notifyListeners();
  } 

 
  //Then, it notifies the listeners that something changed.
  Future<void> removeDayInfos(Day_infos day_infos) async {
    await database.dayinfosDao.removeDayInfos(day_infos);
    notifyListeners();
  } //removeDaySteps

} //DatabaseRepository
