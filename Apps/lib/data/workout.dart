import 'package:flutter/cupertino.dart';
import 'data.dart';

//enum WorkoutType { TRX, Running, HITT }

class Workout {
  int workoutId; // 1,
  String workoutName; // 2,
  //WorkoutType workoutType; //WorkoutType.HITT,
  String workoutCoach; // "Meital",
  Icon workoutIcon; //"icon.svg",
  bool workoutIsOnline; //false,
  Location workoutLocation; //"some address",
  double workoutDurationTime; //1.5

  Workout(
      this.workoutId,
      this.workoutName,
      //this.workoutType,
      this.workoutCoach,
      this.workoutIcon,
      this.workoutDurationTime,
      this.workoutIsOnline,
      this.workoutLocation);

  Workout.fromJson(Map<String, dynamic> json) {
    workoutId = json['workoutId'];
    workoutName = json['workoutName'];
    //workoutType = json['workoutType'];
    workoutCoach = json['workoutCoach'];
    workoutIcon = json['workoutIcon'];
    workoutDurationTime = json['workoutDurationTime'];
    workoutIsOnline = json['workoutIsOnline'];
    workoutLocation = json['workoutLocation'];
  }
}
