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
  String _expresion='';
  String _ans='';
  void click(String texto){
    setState(()=> _expresion += texto);
  }
  void clear(String texto){
    setState((){
      _expresion='';
    });
  }
  void allClear(String texto){
    setState((){
      _expresion='';
      _ans='';
    });
  }
  void solucionar(String expr){
    Parser p = Parser();
    Expression exp = p.parse(_expresion);
    ContextModel cm = ContextModel();
    setState(() {
        _ans = exp.evaluate(EvaluationType.REAL, cm).toString();
        _expresion = '';
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
                    _expresion,
                    style: TextStyle(color: Colors.black, fontSize:40),
                  ),
                )
            ),
            Container(
                color: Colors.black,
                height: 100,
                width: 300,
                alignment: Alignment.centerRight,
                child: FittedBox(
                  alignment: Alignment.topRight,
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
            Boton(
              simbolo: "AC", colorFondo :0xDD000000, funcion:allClear
            ),
            Boton(
              simbolo: "C", colorFondo :0xDD000000, funcion:clear
            ),
            Boton(
              simbolo: "(", colorFondo :0xDD000000, funcion:click
            ),
            Boton(
              simbolo: ")", colorFondo :0xDD000000, funcion:click
            )
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Boton(
                  simbolo: '1', funcion:click
                ),
                Boton(
                  simbolo: '2', funcion:click
                ),
                Boton(
                  simbolo: "3", funcion:click
                ),
                Boton(
                  simbolo: "+", colorFondo :0xDD000000, funcion:click
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Boton(
                  simbolo: '4',funcion:click
                ),
                Boton(
                  simbolo: '5',funcion:click
                ),
                Boton(
                  simbolo: "6",funcion:click
                ),
                Boton(
                  simbolo: "-", colorFondo :0xDD000000, funcion:click
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Boton(
                  simbolo: '7', funcion:click
                ),
                Boton(
                  simbolo: '8', funcion:click
                ),
                Boton(
                  simbolo: "9", funcion:click
                ),
                Boton(
                  simbolo: "/", colorFondo :0xDD000000, funcion:click
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Boton(
                  simbolo:"=",
                  funcion:solucionar,
                    colorFondo :0xAA000000,
                  ancho: 153
                ),
                Boton(
                    simbolo:"0",
                    funcion:click,
                ),
                Boton(
                  simbolo:"*",
                  funcion:click,
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
class Boton extends StatelessWidget {
  final String simbolo;
  final int colorFondo;
  final double ancho;
  final double largo;
  final int colorTxt;
  final Function funcion;

  const Boton({
    Key key,
    this.simbolo,
    this.ancho=65,
    this.largo=65,
    this.colorFondo=0xFF000000,
    this.colorTxt=0xFF69F0AE,
    this.funcion,
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
      )
    );
  }
}

