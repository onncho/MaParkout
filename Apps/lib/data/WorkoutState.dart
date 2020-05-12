import 'package:MaParkOut/data/workout.dart';
import 'package:flutter/foundation.dart';

class WorkoutState with ChangeNotifier {
  List<Workout> _maWorkouts = new List<Workout>();
  List<Workout> get allWorkouts => _maWorkouts;
  // set List<Workout> allWorkouts(List<Workout> newWorkouts) {
  //   _maWorkouts = newWorkouts;
  // }
}
