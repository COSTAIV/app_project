import 'package:city_app/database/entities/yeasterdaysleep.dart';
import 'package:floor/floor.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class YeasterdaySleepDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Day_steps table
  @Query('SELECT * FROM Yeasterday_sleep ORDER BY Yeasterday_sleep.entryDateTime ASC')     //trovato su sql_query examples
  Future<List<Yeasterday_sleep>> findAllYeasterdaySleep();

  //Query #2: INSERT -> this allows to add a Todo in the table
 // @Insert (onConflict: OnConflictStrategy.rollback)
  @Insert (onConflict: OnConflictStrategy.ignore)
  //Future<void> insertDaySteps(Day_steps day_steps);
  Future<void> insertYeasterdaySleep(Yeasterday_sleep yeasterday_sleep);

  //Query #3: DELETE -> this allows to delete a Todo from the table
  @delete
  Future<void> removeYeasterdaySleep(Yeasterday_sleep task);
}