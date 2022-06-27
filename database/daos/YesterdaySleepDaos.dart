import 'package:city_app/database/entities/yesterdaysleep.dart';
import 'package:floor/floor.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class YesterdaySleepDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Day_steps table
  @Query('SELECT * FROM Yesterday_sleep ORDER BY Yesterday_sleep.entryDateTime ASC')     //trovato su sql_query examples
  Future<List<Yesterday_sleep>> findAllYesterdaySleep();

  //Query #2: INSERT -> this allows to add a Todo in the table
 // @Insert (onConflict: OnConflictStrategy.rollback)
  @Insert (onConflict: OnConflictStrategy.ignore)
  //Future<void> insertDaySteps(Day_steps day_steps);
  Future<void> insertYesterdaySleep(Yesterday_sleep yesterday_sleep);

  //Query #3: DELETE -> this allows to delete a Todo from the table
  @delete
  Future<void> removeYesterdaySleep(Yesterday_sleep task);
}