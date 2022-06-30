import 'package:floor/floor.dart';
import 'package:flutter/rendering.dart';

@Entity(primaryKeys: ['id'])
class Yesterday_sleep {
  final int? id; //primarykey, will be the date in milliseconds since epoch
  final DateTime dateTime; //date of the day
  final String level; //level of sleep (wake, deep, rem, light)
  final DateTime entryDateTime; //date of the datapoint

  //Default constructor
  Yesterday_sleep(this.id, this.dateTime, this.level, this.entryDateTime);
} //Meal
