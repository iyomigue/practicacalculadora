import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleButton
    extends StatelessWidget {
  final String simbolo;
  final Color colorFondo;
  final double ancho;
  final double largo;
  final int colorTxt;
  final Function funcion;

  const SingleButton
      (this.simbolo, this.funcion, {
    Key key,
    this.ancho=65,
    this.largo=65,
    this.colorFondo=Colors.black,
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
          color: colorFondo,
          child: InkWell(
            onTap:(){
              funcion(simbolo, context);
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

