import 'package:city_app/database/entities/daysteps.dart';
import 'package:floor/floor.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class DayStepsDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Day_steps table
  @Query('SELECT * FROM Day_steps')
  Future<List<Day_steps>> findAllDaySteps();

  //Query #2: INSERT -> this allows to add a Todo in the table
 // @Insert (onConflict: OnConflictStrategy.rollback)
  @Insert (onConflict: OnConflictStrategy.ignore)
  //Future<void> insertDaySteps(Day_steps day_steps);
  Future<void> insertDaySteps(Day_steps day_steps);

  //Query #3: DELETE -> this allows to delete a Todo from the table
  @delete
  Future<void> removeDaySteps(Day_steps task);
}//TodoDao