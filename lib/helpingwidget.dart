import 'package:flutter/material.dart';
import 'ShowUp.dart';

class helpingwidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _helpingwidget();
  }
}

class _helpingwidget extends State<helpingwidget> {
  bool secondhelpvis = false;
  Widget iconed() {
    return Icon(
      Icons.blur_on,
      color: Colors.redAccent,
      size: 50,
    );
  }

  Widget secondhelper() {
    return Visibility(
        visible: secondhelpvis,
        child: ShowUp(
            delay: 1000,
            child: Column(
              children: <Widget>[
                Icon(Icons.linear_scale, size: 15, color: Colors.red),
              ],
            )));
  }

  Alignment helpos = Alignment.bottomRight;
  bool widg = false;
  Widget helper() {
    return AnimatedContainer(
      child: iconed(),
      curve: Curves.easeOutExpo,
      duration: Duration(seconds: 2),
      alignment: helpos,
    );
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
