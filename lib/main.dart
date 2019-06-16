import 'package:flutter/material.dart';
import 'FirstTransition.dart';

void main() => runApp(Velio());
Color white = Colors.white;

class Velio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, backgroundColor: Colors.black),
      home: FirstTransition(),
    );
  }
}
