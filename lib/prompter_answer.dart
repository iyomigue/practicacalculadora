import 'package:flutter/material.dart';

class PrompterAnswer extends StatelessWidget {
  final String text2prompt;

  const PrompterAnswer(this.text2prompt);

  @override
  Widget build(BuildContext context) {
    //
    return Text(
      text2prompt,
      style: TextStyle(color: Colors.greenAccent, fontSize: 30),
    );
  }
}
