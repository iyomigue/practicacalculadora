import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mywidgets.dart';
import 'package:math_expressions/math_expressions.dart';
import 'myhomepage.dart';

void main() {
  runApp(Calculadora());
}

class Calculadora extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Calculadora en Flutter'),
    );
  }
}

