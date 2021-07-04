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
class prompter_ans extends StatelessWidget{
  final String text2prompt;

  const prompter_ans
      (this.text2prompt);
  @override
  Widget build(BuildContext context) {
    //
    return Text(
      text2prompt,
      style: TextStyle(color: Colors.greenAccent, fontSize: 30),
    );
  }
}

class prompter_exp extends StatelessWidget{
  final String exp2prompt;
  Color colour =Colors.black;

  const prompter_exp
      (this.exp2prompt,{this.colour});

  @override
  Widget build(BuildContext context) {
    //
    return Text(
      exp2prompt,
      style: TextStyle(color: colour, fontSize:40),
    );
    throw UnimplementedError();

}
