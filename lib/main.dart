import 'package:flutter/material.dart';
import './splashscreen.dart';
import './workouts.dart';
import 'package:workout/workouts/abs.dart';
import 'package:workout/workouts/back.dart';
import 'package:workout/workouts/biceps.dart';
import 'package:workout/workouts/leg.dart';
import 'package:workout/workouts/shoulders.dart';
import 'package:workout/workouts/triceps.dart';
import 'package:flutter/services.dart';


void main(){ 
  
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light
 ));
  
  
  runApp(Home());}

    class Home extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WorkOut',
      initialRoute: '/',
      routes: {
          '/': (context) =>SplashScreen(),
          '/workout': (context) => WorkOuts(),
          '/abs': (context) => Abs(),
          '/back': (context) => Back(),
          '/biceps': (context) => Biceps(),
          '/leg': (context) => Leg(),
          '/shoulder': (context) => Shoulders(),
          '/triceps': (context) => Triceps()
      },
    );
      }
    }