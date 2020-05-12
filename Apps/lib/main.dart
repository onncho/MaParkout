import 'dart:js';

import 'package:MaParkOut/data/WorkoutState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:MaParkOut/data/MyStateScheduler.dart';

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
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MA Parkout',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new SplashScreen(
          seconds: 6,
          navigateAfterSeconds: new AfterSplash(),
          title: new Text(
            'Welcome In SplashScreen',
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          image: Image.asset('assets/ ma_repo/logo_on_white.jpeg'),
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: 100.0,
          onClick: () => print("user clicked"),
          loaderColor: Colors.black),
    );
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
