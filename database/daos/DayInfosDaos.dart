import 'package:city_app/database/entities/dayinfos.dart';
import 'package:floor/floor.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class DayInfosDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Day_steps table
  @Query('SELECT * FROM Day_infos ORDER BY Day_infos.dateTime ASC')
  Future<List<Day_infos>> findAllDayInfos();

  //Query #2: INSERT -> this allows to add a Day_infos in the table
  @Insert(
      onConflict: OnConflictStrategy
          .ignore) //to avoid to insert a two days with the same date
  Future<void> insertDayInfos(Day_infos day_infos);

  //Query #3: DELETE -> this allows to delete a Day_infos from the table
  @delete
  Future<void> removeDayInfos(Day_infos task);
}
