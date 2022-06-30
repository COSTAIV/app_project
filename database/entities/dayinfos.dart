import 'package:floor/floor.dart';
import 'package:flutter/rendering.dart';

//Here, we are saying to floor that this is a class that defines an entity
@Entity (primaryKeys: ['id']) 
class Day_infos {
  final int? id;      //primarykey, will be the date in milliseconds since epoch 

  final DateTime dateTime;  //date of the day 

  final double d_steps;  //number of steps in the day 

  final double sleep_minutes;   //number of minutes of sleep in the day 

  //Default constructor
  Day_infos(this.id, this.dateTime, this.d_steps, this.sleep_minutes);
  
}