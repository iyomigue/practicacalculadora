import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'single_button.dart';
import 'package:math_expressions/math_expressions.dart';
import 'my_home_page.dart';

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

