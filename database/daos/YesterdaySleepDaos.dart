import 'package:city_app/database/entities/yesterdaysleep.dart';
import 'package:floor/floor.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class YesterdaySleepDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Yesterday_sleep table
  @Query(
      'SELECT * FROM Yesterday_sleep ORDER BY Yesterday_sleep.entryDateTime ASC')
  Future<List<Yesterday_sleep>> findAllYesterdaySleep();

  //Query #2: INSERT -> this allows to add a Yesterday_sleep in the table
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertYesterdaySleep(Yesterday_sleep yesterday_sleep);

  //Query #3: DELETE -> this allows to delete a Yesterday_sleep from the table
  @delete
  Future<void> removeYesterdaySleep(Yesterday_sleep task);
}
