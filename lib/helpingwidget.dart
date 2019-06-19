import 'dart:math';

import 'package:flutter/material.dart';
import 'ShowUp.dart';

class helpingwidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _helpingwidget();
  }
}

class _helpingwidget extends State<helpingwidget> {
  bool secondhelpvis = false, doneButtonvis = false;
  Color red = Colors.red;
  String name, coursep;
  int delay = 7000;
  double blurIconSize = 50;
  Alignment helpos = Alignment.bottomRight;
  bool widg = false;
  var colors = {
    'blue': Colors.blue,
    'green': Colors.green,
    'orange': Colors.orange,
    'purple': Colors.purple,
    'pink': Colors.pink,
    'white': Colors.white,
    'yellow': Colors.yellow
  };
  var helperalignments = {
    'left': Alignment.centerLeft,
    'right': Alignment.bottomRight,
    'center': Alignment.center
  };

  Widget iconed() {
    return Icon(
      Icons.blur_on,
      color: red,
      size: blurIconSize,
    );
  }

  Widget enquiringName() {
    return AnimatedContainer(
      color: Colors.black,
      duration: Duration(),
      child: TextField(
        onChanged: (name) {
          setState(() {
            changingColors();
          });
        },
        cursorColor: red,
        style: TextStyle(color: red),
        decoration: InputDecoration(
            hintText: "Enter your Course Name!",
            hintStyle: TextStyle(color: red),
            icon: Icon(
              Icons.supervised_user_circle,
              color: red,
            )),
      ),
      alignment: Alignment.topCenter,
    );
  }

  Widget courseEpisodes() {
    return AnimatedContainer(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: Colors.black,
      duration: Duration(),
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: (coursep) {
          setState(() {
            changingColors();
          });
        },
        cursorColor: red,
        style: TextStyle(color: red),
        decoration: InputDecoration(
            hintText: "Enter The number of course episodes!",
            hintStyle: TextStyle(color: red),
            icon: Icon(
              Icons.format_list_numbered,
              color: red,
            )),
      ),
      alignment: Alignment.topCenter,
    );
  }

  Widget courseLength() {
    return AnimatedContainer(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: Colors.black,
      duration: Duration(),
      child: TextField(
        keyboardType: TextInputType.number,
        onTap: () {
          setState(() {
            doneButtonvis = true;
          });
        },
        onChanged: (coursep) {
          setState(() {
            changingColors();
          });
        },
        cursorColor: red,
        maxLines: 2,
        style: TextStyle(color: red),
        decoration: InputDecoration(
            hintText: "Enter The Length of your course! (How many total hours)",
            hintStyle: TextStyle(color: red),
            icon: Icon(
              Icons.timelapse,
              color: red,
            )),
      ),
      alignment: Alignment.topCenter,
    );
  }

  Widget secondhelper() {
    return Visibility(
        visible: secondhelpvis,
        child: ShowUp(
            delay: 1000,
            child: Column(
              children: <Widget>[
                Icon(Icons.linear_scale, size: 20, color: red),
                enquiringName(),
                courseEpisodes(),
                courseLength(),
                done()
              ],
            )));
  }

  Widget helper() {
    return AnimatedContainer(
      child: iconed(),
      curve: Curves.easeOutExpo,
      duration: Duration(seconds: 3),
      alignment: helpos,
    );
  }

  Widget done() {
    return ShowUp(
      delay: delay,
      child: Visibility(
          visible: doneButtonvis,
          child: Container(
              padding: EdgeInsets.all(100),
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    onDonePressed();
                  });
                },
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: red,
              ))),
    );
  }

  void changingColors() {
    var colorList = colors.values.toList();
    Random rand = new Random();
    int random = rand.nextInt(colors.length);
    red = colorList[random];
  }

  void onDonePressed() {
    secondhelpvis = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              return widg
                  ? {
                      widg = false,
                      helpos = Alignment.bottomRight,
                      secondhelpvis = false
                    }
                  : {
                      widg = true,
                      helpos = Alignment.topCenter,
                      secondhelpvis = true
                    };
            });
          },
          child: helper(),
        ),
        secondhelper(),
      ],
    );
  }
}
