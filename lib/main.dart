import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.amber,
                height: 100,
                width: 300,
              alignment: Alignment.center,
              child: FittedBox(
              alignment: Alignment.centerRight,
            )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
            Boton(
              simbolo: "AC",
            ),
            Boton(
              simbolo: "C",
            ),
            Boton(
              simbolo: "(",
            ),
            Boton(
              simbolo: ")",
            )
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Boton(
                  simbolo: '1',
                ),
                Boton(
                  simbolo: '2',
                ),
                Boton(
                  simbolo: "3",
                ),
                Boton(
                  simbolo: "+",
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Boton(
                  simbolo: '4',
                ),
                Boton(
                  simbolo: '5',
                ),
                Boton(
                  simbolo: "6",
                ),
                Boton(
                  simbolo: "-",
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Boton(
                  simbolo: '7',
                ),
                Boton(
                  simbolo: '8',
                ),
                Boton(
                  simbolo: "9",
                ),
                Boton(
                  simbolo: "/",
                )
              ],
            ),
          ],
        )
      )
    );
  }
}
class Boton extends StatelessWidget {
  final String simbolo;
  final int color;
  final int colorTxt;

  const Boton({
    Key key,
    this.simbolo,
    this.color=0xFFFF9000,
    this.colorTxt
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: IconButton(
          )
          )
          ]
          ),
        ),
      ),
    );
  }
}

