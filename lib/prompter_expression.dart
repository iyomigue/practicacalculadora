import 'package:flutter/material.dart';

class PrompterExpression extends StatelessWidget {
  final String exp2prompt;
  Color colour = Colors.black;

  PrompterExpression(this.exp2prompt, {this.colour});

  @override
  Widget build(BuildContext context) {
    //
    return Text(
      exp2prompt,
      style: TextStyle(color: colour, fontSize: 40),
    );
  }
}
