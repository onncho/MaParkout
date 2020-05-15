import 'package:MaParkOut/data/workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkoutDetails extends StatelessWidget {
  final Workout _workout;
  get iconOnlineColor =>
      _workout.workoutIsOnline ? Colors.green[500] : Colors.grey[200];
  WorkoutDetails(this._workout);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_workout.workoutName),
        ),
        body: Column(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  verticalDirection: VerticalDirection.down,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(_workout.coachImage),
                    ),
                    Text(_workout.workoutCoach)
                  ],
                )),
            Flexible(
              flex: 4,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                      child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Text("Zoom? "),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child:
                            Icon(Icons.movie_creation, color: iconOnlineColor),
                      )
                    ],
                  )),
                  Flexible(
                    child: Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Text("זמן אימון"),
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: Text(_workout.workoutTime))
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(child: Text('צבע בתוכניה')),
                          Container(
                            alignment: Alignment.center,
                            child:
                                Icon(Icons.bookmark, color: Colors.green[300]),
                          )
                        ]),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(child: Text('זמן עבודה')),
                          Container(
                            alignment: Alignment.center,
                            child: Row(
                              children: <Widget>[
                                Text("(זמן בשעות)"),
                                Text(_workout.workoutDurationTime.toString())
                              ],
                            ),
                          )
                        ]),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(child: Text('מיקום')),
                          Container(
                              child: InkWell(
                                  highlightColor: Colors.blue,
                                  child: Text("מפה",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.blue)),
                                  onTap: () async {
                                    if (await canLaunch(
                                        _workout.workoutLocation)) {
                                      await launch(_workout.workoutLocation);
                                    }
                                  }))
                        ]),
                  ),
                  Flexible(
                    child: Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              child: Text(
                                  '${_workout.workoutDayOfTheWeek} כל יום')),
                          Container(
                            alignment: Alignment.center,
                            child: Icon(Icons.calendar_today,
                                color: Colors.yellow[500]),
                          )
                        ]),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
