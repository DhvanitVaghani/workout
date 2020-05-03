import 'dart:async';

import 'package:flutter/material.dart';

class Abs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Abs();
  }
}

class _Abs extends State<Abs> {
  List<String> heros = ['first', 'second', 'third', 'four', 'five', 'six'];
  List<String> workoutname = [
    'Ab Wheel Rollout',
    'Arms-High Partial Situp',
    'Barbell Rollout',
    'Barbell Russian Twist',
    'Swiss Ball Crunch',
    'Dip/Leg Raise Combo'
  ];
  List<String> sets = [
    'Set : 1',
    'Set : 2',
    'Set : 3',
    'Set : 4',
    'Set : 5',
    'Set : 6'
  ];
  List<String> reps = [
    'Reps : 30',
    'Reps : 30',
    'Reps : 30',
    'Reps : 30',
    'Reps : 30',
    'Reps : 30'
  ];
  List<String> images = [
    'images/abs/a.jpg',
    'images/abs/b.jpg',
    'images/abs/c.jpg',
    'images/abs/d.jpg',
    'images/abs/e.jpg',
    'images/abs/f.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.deepPurple,
              floating: true,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Abs Workout"),
                background:
                    new Image.asset("images/absback.jpg", fit: BoxFit.cover),
              ),
            ),
          ];
        },
        body: ListView.builder(
          itemCount: workoutname.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return FirstHero(index);
                }));
              },
              child: Hero(
                tag: heros[index],
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.red, width: 4.0),
                    ),
                    height: 400,
                    width: 350,
                    child: Column(children: <Widget>[
                      Text(workoutname[index],
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Image.asset(
                        images[index],
                        height: 275,
                        width: 275,
                      )
                    ]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FirstHero extends StatefulWidget {
  int index;
  FirstHero(this.index);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstHeroState();
  }
}

class _FirstHeroState extends State<FirstHero> {
  List<String> heros = ['first', 'second', 'third', 'four', 'five', 'six'];
  List<String> workoutname = [
    'Ab Wheel Rollout',
    'Arms-High Partial Situp',
    'Barbell Rollout',
    'Barbell Russian Twist',
    'Swiss Ball Crunch',
    'Dip/Leg Raise Combo'
  ];
  List<String> sets = [
    'Set : 1',
    'Set : 2',
    'Set : 3',
    'Set : 4',
    'Set : 5',
    'Set : 6'
  ];
  List<String> reps = [
    'Reps : 30',
    'Reps : 30',
    'Reps : 30',
    'Reps : 30',
    'Reps : 30',
    'Reps : 30'
  ];
  List<String> images = [
    'images/abs/a.jpg',
    'images/abs/b.jpg',
    'images/abs/c.jpg',
    'images/abs/d.jpg',
    'images/abs/e.jpg',
    'images/abs/f.jpg'
  ];

  String inittime = "00:00:00";
  bool startis = true;
  bool stopis = true;
  bool resetis = true;
  var swatch = Stopwatch();
  final dur = const Duration(seconds: 1);
  void starttimer() {
    Timer(dur, keeprunning);
  }

  void keeprunning() {
    if (swatch.isRunning) {
      starttimer();
    }
    setState(() {
     if((swatch.elapsed.inSeconds).toString()=='30'){
        limitwatch();
      }else{
      inittime = swatch.elapsed.inHours.toString().padLeft(2, '0') +
          ':' +
          (swatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
          ':' +
          (swatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
      }
    });
  }

  void startwatch() {
    setState(() {
      stopis = false;
      startis = false;
    });
    swatch.start();
    starttimer();
  }

  void stopwatch() {
    setState(() {
      stopis = true;
      resetis = false;
    });
    swatch.stop();
  }

  void resetwatch() {
    setState(() {
      startis = true;
      resetis = true;
      inittime = '00:00:00';
    });
    swatch.reset();
  }

void limitwatch(){
   resetwatch();
   setState(() {
      stopis = true;
      resetis = true;
    });
    swatch.stop();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Hero(
        tag: heros[widget.index],
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.red, width: 4.0),
            ),
            height: 500,
            width: 400,
            child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                children: <Widget>[
                  Text(workoutname[widget.index],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          sets[widget.index],
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(width:50),
                        Text(
                          reps[widget.index],
                          style: TextStyle(fontSize: 20),
                        )
                      ]),
                  SizedBox(height: 10),
                  Image.asset(
                    images[widget.index],
                    height: 250,
                    width: 250,
                  ),
                   Text(
                    'You Have 30 Sec./set',
                    style: TextStyle(color: Colors.black, fontSize: 15.0,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    inittime,
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        iconSize: 35.0,
                        icon: Icon(Icons.play_arrow),
                        onPressed: startis ? startwatch : null,
                      ),
                      IconButton(
                          iconSize: 35.0,
                          icon: Icon(Icons.pause),
                          onPressed: stopis ? null : stopwatch),
                      IconButton(
                          iconSize: 35.0,
                          icon: Icon(Icons.restore),
                          onPressed: resetis ? null : resetwatch)
                    ],
                  ),
                  SizedBox(height: 10)
                ]),
          ),
        ),
      ),
    );
  }
}

