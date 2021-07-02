import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _expression='';
  String _ans='';
  void click(String texto){
    setState(()=> _expression += texto);
  }
  void clear(String texto){
    setState((){
      _expression='';
    });
  }
  void allClear(String texto){
    setState((){
      _expression='';
      _ans='';
    });
  }
  void aproximacion(String texto){
    setState((){
        _ans = aproxima(_ans);
    });
  }
  String aproxima(String numberToAprox) {
    if (numberToAprox.length > 5 ){
      if( int.parse(numberToAprox.substring(4,5)) > 5){
        numberToAprox = numberToAprox.substring(0, 6);
        double number= double.parse(numberToAprox) +0.0001;
        numberToAprox = number.toString();
      }
      else {
        numberToAprox = numberToAprox.substring(0, 6);
        double number= double.parse(numberToAprox);
        numberToAprox = number.toString();
      }
    }
      return numberToAprox;
    }

    void solucionar(String expr) {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();
      setState(() {
        _ans = exp.evaluate(EvaluationType.REAL, cm).toString();
        if (_ans.substring(_ans.length - 2, _ans.length) == ".0") {
          _ans = _ans.substring(0, _ans.length - 2);
        }
        _expression = '';
      });
    }
    @override
    void initState() {
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(12),
            color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.black,
                height: 50,
                width: 300,
              alignment: Alignment.centerLeft,
              child: FittedBox(
              alignment: Alignment.topLeft,
                child: Text(
                  _ans,
                  style: TextStyle(color: Colors.greenAccent, fontSize: 30),
                )
              )
            ),
            Container(
                color: Colors.greenAccent,
                height: 100,
                width: 300,
                alignment: Alignment.centerRight,
                child: FittedBox(
                  alignment: Alignment.topRight,
                  child: Text(
                    _expression,
                    style: TextStyle(color: Colors.black, fontSize:40),
                  ),
                )
            ),
            Container(
                color: Colors.black,
                height: 100,
                width: 300,
                alignment: Alignment.center,
                child: FittedBox(
                  alignment: Alignment.center,
                  child: SingleButton(
                    "Aproximar", aproximacion, ancho:200, largo:50,
                  )
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
            SingleButton
              (
               "AC", allClear,colorFondo :0xDD000000
            ),
            SingleButton
              (
              "C", clear, colorFondo :0xDD000000
            ),
            SingleButton
              (
              "(",  click, colorFondo :0xDD000000,
            ),
            SingleButton
              (
              ")",  click, colorFondo :0xDD000000,
            )
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SingleButton
                  (
                  '1', click
                ),
                SingleButton
                  (
                   '2', click
                ),
                SingleButton
                  (
                   "3", click
                ),
                SingleButton
                  (
                   "+", click, colorFondo :0xDD000000
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SingleButton
                  (
                   '4', click
                ),
                SingleButton
                  (
                   '5', click
                ),
                SingleButton
                  (
                   "6" , click
                ),
                SingleButton
                  (
                   "-", click, colorFondo :0xDD000000
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SingleButton
                  (
                   '7', click
                ),
                SingleButton
                  (
                   '8', click
                ),
                SingleButton
                  (
                   "9", click
                ),
                SingleButton
                  (
                   "/",  click, colorFondo :0xDD000000
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SingleButton
                  (
                  "=",  solucionar,
                  ancho: 153,
                  colorFondo :0xAA000000
                ),
                SingleButton
                  (
                    "0",
                   click,
                ),
                SingleButton
                  (
                  "*",  click,
                  colorFondo :0xDD000000,
                ),
            ]
            )
          ],
        )
      )
    );
  }
}
class SingleButton
    extends StatelessWidget {
  final String simbolo;
  final int colorFondo;
  final double ancho;
  final double largo;
  final int colorTxt;
  final Function funcion;

  const SingleButton
      (this.simbolo, this.funcion, {
    Key key,
    this.ancho=65,
    this.largo=65,
    this.colorFondo=0xFF000000,
    this.colorTxt=0xFF69F0AE,
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      color: Colors.greenAccent,
      child: SizedBox(
        width: ancho,
        height: largo,
        child: Card (
          color: Color(colorFondo),
          child: InkWell(
            onTap:(){
              funcion(simbolo);
            },
            child: Center(
              child:Text(
              simbolo,
              style: TextStyle(
                  color: Color(colorTxt),
                  fontSize: 20),
              textAlign: TextAlign.center
              )
            )
          )
        )
      ),
    );
  }
}

