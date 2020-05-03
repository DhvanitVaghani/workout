import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  void screen() async {
    Timer(Duration(seconds: 4), () => Navigator.pushNamedAndRemoveUntil(context, '/workout',(_)=>false));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/spalsh.jpg'), fit: BoxFit.cover)),
      // child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text('Loading....',
      //           style: TextStyle(
      //               fontSize: 30.0,
      //               color: Colors.white,
      //               fontWeight: FontWeight.bold)),
      //       SizedBox(height: 20.0),
      //       SpinKitWave(
      //         size: 70.0,
      //         itemBuilder: (BuildContext context, int index) {
      //           return DecoratedBox(
      //             decoration: BoxDecoration(
      //               color: index.isEven ? Colors.red : Colors.green,
      //             ),
      //           );
      //         },
      //       )
      //     ]),
    ));
  }
}
