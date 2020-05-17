import 'dart:convert';
import 'package:MaParkOut/data/WorkoutDetails.dart';
import 'package:MaParkOut/data/WorkoutState.dart';
import 'package:MaParkOut/data/workout.dart';
import 'package:MaParkOut/widgets/SimpleSplashScreen.dart';
import 'package:MaParkOut/widgets/WorkoutCalander.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:MaParkOut/data/MyStateScheduler.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() {
  initializeDateFormatting().then((_) => runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => MyStateScheduler()),
            ChangeNotifierProvider(
              create: (context) => WorkoutState(),
            )
            // Provider(create: (context) => MyStateScheduler()),
          ],
          child: WorkoutApp(),
        ),
      ));
}

class WorkoutApp extends StatefulWidget {
  @override
  WorkoutAppState createState() => WorkoutAppState();
}

class WorkoutAppState extends State<WorkoutApp> {
  // This widget is the root of your application.

  String _logo = 'assets/ ma_repo/logo_on_white.jpeg';

  Future<List<Workout>> fetchWorkouts() async {
    var url =
        'https://raw.githubusercontent.com/onncho/MaParkout/master/Apps/lib/data/workout.json';
    var response = await http.get(url);

    var workouts = List<Workout>();

    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      List<dynamic> entitlements = myMap["workouts"];
      workouts = entitlements.map((item) => Workout.fromJson(item)).toList();
    }

    return workouts;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MA Parkout',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Center(
          child: FutureBuilder(
              future: fetchWorkouts(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(child: SimpleSplashScreen(_logo));
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return new Scaffold(
                      appBar: new AppBar(
                          title: new Text("MA Parkout"),
                          automaticallyImplyLeading: false),
                      body: WorkoutCalander());
                  // body: new Center(child: darwFirstList(snapshot)));
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return SimpleSplashScreen(_logo);
              }),
        ));
  }

  ListView darwFirstList(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          var workout = snapshot.data[index];
          var iconOnlineColor =
              workout.workoutIsOnline ? Colors.green[500] : Colors.grey[200];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(workout.coachImage),
            ),
            title: Text(workout.workoutName),
            subtitle: Text(workout.workoutTime),
            trailing: Icon(Icons.movie_creation, color: iconOnlineColor),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => WorkoutDetails(workout)));
            },
          );
        });
  }
}
