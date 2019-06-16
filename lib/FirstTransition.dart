import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'ShowUp.dart';

class FirstTransition extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FirstTransition();
  }
}

class _FirstTransition extends State<FirstTransition> {
  Color currcol;
  int delay = 1000;
  double height = 200;
  double width = 300;
  Text keepclick = Text('Keep holding the welcome');
  Widget presshereIcon() {
    return Center(
        child: ShowUp(
            delay: delay + 500,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/arrowup.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            )));
  }

  Widget presshere() {
    return Center(
        child: ShowUp(
      delay: delay + 1000,
      child: Container(
        child: keepclick,
      ),
    ));
  }

  Widget welcome() {
    return Center(
        child: ShowUp(
            delay: delay,
            child: ColorizeAnimatedTextKit(
              colors: [
                Colors.lightBlue,
                Colors.deepOrange,
                Colors.lightBlueAccent,
                Colors.green,
                Colors.white,
                Colors.red,
                Colors.tealAccent
              ],
              duration: Duration(seconds: 2),
              text: ['Welcome .. '],
              textStyle: TextStyle(fontSize: 40.0, fontFamily: "Canterbury"),
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart,
              isRepeatingAnimation: true,
            )));
  }

  Widget welcomeContainer() {
    return Center(
        child: AnimatedContainer(
      duration: Duration(seconds: 2),
      curve: Curves.bounceInOut,
      height: height,
      width: width,
      alignment: Alignment.center,
      color: currcol,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          welcome(),
          ShowUp(
            child: Icon(
              Icons.arrow_upward,
              size: 30,

            ),
            delay: delay + 1500,
          ),
          presshere()
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onLongPress: () {
          setState(() {
            height = MediaQuery.of(context).size.height;
            width = MediaQuery.of(context).size.width;
            currcol = Colors.black;
            keepclick = Text('');
          });
        },
        child: welcomeContainer(),
      ),
    );
  }
}
