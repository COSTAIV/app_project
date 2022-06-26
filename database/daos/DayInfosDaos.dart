import 'package:city_app/database/entities/dayinfos.dart';
import 'package:floor/floor.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class DayInfosDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Day_steps table
  @Query('SELECT * FROM Day_infos ORDER BY Day_infos.dateTime ASC')     //trovato su sql_query examples
  Future<List<Day_infos>> findAllDayInfos();

  //Query #2: INSERT -> this allows to add a Todo in the table
 // @Insert (onConflict: OnConflictStrategy.rollback)
  @Insert (onConflict: OnConflictStrategy.ignore)
  //Future<void> insertDaySteps(Day_steps day_steps);
  Future<void> insertDayInfos(Day_infos day_infos);

  //Query #3: DELETE -> this allows to delete a Todo from the table
  @delete
  Future<void> removeDayInfos(Day_infos task);
}