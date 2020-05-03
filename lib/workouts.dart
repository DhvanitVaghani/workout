import 'package:flutter/material.dart';

import 'package:workout/workouts/abs.dart';

class WorkOuts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WorkOuts();
  }
}

class _WorkOuts extends State<WorkOuts> {
  List<String> wo = [
    'Biceps',
    'Triceps',
    'SixPackABS',
    'Shoulders',
    'Back',
    'Leg'
  ];
  List<String> route = [
    '/biceps',
    '/triceps',
    '/abs',
    '/shoulder',
    '/back',
    '/leg'
  ];

  List<String> ima = [
    'images/biback.jpg',
    'images/triback.jpg',
    'images/absback.jpg',
    'images/shback.jpg',
    'images/backback.jpg',
    'images/legback.jpg'
  ];

  void getroute(index) {
    Navigator.pushNamed(context, route[index]);
  }

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  int color1 = _getColorFromHex("#ffb700");
  int color2 = _getColorFromHex("#2475B0");
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea(
          child: Scaffold(
              body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'), fit: BoxFit.cover)),
        child: ListView.builder(
          itemCount: wo.length,
          itemBuilder: (context, index) {
            return AnimatedContainer(duration: Duration(seconds: 4),
              curve: Curves.ease,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ima[index]), fit: BoxFit.cover),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.red, width: 4.0),
              ),
              height: 300,
              width: 350,
              child: ListTile(
                title: Text(wo[index],
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                onTap: () {
                  getroute(index);
                  setState(() {
                    selected = !selected;
                  });
                },
              ),
            );
          },
        ),
      ))),
      onWillPop: ()=>_onBackPressed(),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }
//   Route _createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => ,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       var begin = Offset(0.0, 1.0);
//       var end = Offset.zero;
//       var curve = Curves.ease;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }

}
