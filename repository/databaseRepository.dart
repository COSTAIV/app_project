import 'package:city_app/database/database.dart';
import 'package:city_app/database/entities/daysteps.dart';
import 'package:flutter/material.dart';

class DatabaseRepository extends ChangeNotifier {
  //The state of the database is just the AppDatabase
  final AppDatabase database;

  //Default constructor
  DatabaseRepository({required this.database});

  //This method wraps the findAllTodos() method of the DAO
  Future<List<Day_steps>> findAllDaySteps() async {
    final results = await database.daystepsDao.findAllDaySteps();
    return results;
  } //findAllTodos

  //This method wraps the insertTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> insertDaySteps(Day_steps day_steps) async {
    await database.daystepsDao.insertDaySteps(day_steps);
    notifyListeners();
  } //insert day steps

 
  //Then, it notifies the listeners that something changed.
  Future<void> removeDaySteps(Day_steps day_steps) async {
    await database.daystepsDao.removeDaySteps(day_steps);
    notifyListeners();
  } //removeDaySteps

} //DatabaseRepository
