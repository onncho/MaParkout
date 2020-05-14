import 'dart:convert';
import 'package:MaParkOut/data/WorkoutState.dart';
import 'package:MaParkOut/data/workout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:MaParkOut/data/MyStateScheduler.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() {
  runApp(
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
  );
}

class WorkoutApp extends StatefulWidget {
  @override
  WorkoutAppState createState() => WorkoutAppState();
}

class WorkoutAppState extends State<WorkoutApp> {
  // This widget is the root of your application.

  List<Workout> _allWorkouts = new List<Workout>();

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
  void initState() {
    fetchWorkouts().then((value) {
      setState(() {
        _allWorkouts.addAll(value);
      });
    });
    super.initState();
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
                  return Container(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  orderData(snapshot.data);
                  return new Scaffold(
                      appBar: new AppBar(
                          title: new Text("Welcome In SplashScreen Package"),
                          automaticallyImplyLeading: false),
                      body: new Center(
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                    title:
                                        Text(snapshot.data[index].workoutName));
                              })));
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              }),
        ));

    //   new SplashScreen(
    //       seconds: 6,
    //       navigateAfterSeconds: new AfterSplash(),
    //       title: new Text(
    //         'Welcome In SplashScreen',
    //         style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
    //       ),
    //       image: Image.asset('assets/ ma_repo/logo_on_white.jpeg'),
    //       backgroundColor: Colors.white,
    //       styleTextUnderTheLoader: new TextStyle(),
    //       photoSize: 100.0,
    //       onClick: () => print("user clicked"),
    //       loaderColor: Colors.black),
    // );
  }

  void orderData(json) {
    var asd = 'askdnasd';
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Welcome In SplashScreen Package"),
          automaticallyImplyLeading: false),
      body: new Center(child: new Text("BODY BODY BOOM")),
    );
  }
}
