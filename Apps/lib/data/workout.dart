//enum WorkoutType { TRX, Running, HITT }

class Workout {
  int workoutId; // 1,
  String workoutName; // 2,
  //WorkoutType workoutType; //WorkoutType.HITT,
  String workoutCoach; // "Meital",
  String workoutIcon; //"icon.svg",
  bool workoutIsOnline; //false,
  String workoutLocation; //"some address",
  double workoutDurationTime; //1.5
  String workoutTime; // "09:30",
  String workoutColor; //"light blue"
  String coachImage;

  Workout(
      {this.workoutId,
      this.workoutName,
      //this.workoutType,
      this.workoutCoach,
      this.workoutIcon,
      this.workoutDurationTime,
      this.workoutIsOnline,
      this.workoutLocation,
      this.workoutTime,
      this.workoutColor,
      this.coachImage});

  @override
  String toString() {
    return '{ ${this.workoutId}, ${this.workoutCoach}, ${this.workoutDurationTime}, ${this.workoutIcon}, ${this.workoutIsOnline}, ${this.workoutLocation}, ${this.workoutName}, ${this.workoutTime}, ${this.workoutColor}, ${this.coachImage} }';
  }

  factory Workout.fromJson(Map<String, dynamic> json) {
    return new Workout(
        workoutId: json['workoutId'] as int,
        workoutName: json['workoutName'] as String,
        //workoutType = json['workoutType'];
        workoutCoach: json['workoutCoach'] as String,
        workoutIcon: json['workoutIcon'] as String,
        workoutDurationTime: json['workoutDurationTime'] as double,
        workoutIsOnline: json['workoutIsOnline'] as bool,
        workoutLocation: json['workoutLocation'] as String,
        workoutTime: json['workoutTime'] as String,
        workoutColor: json['workoutColor'] as String,
        coachImage: json['coachImage'] as String);
  }
}
