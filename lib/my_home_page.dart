import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:practicacalculadora/answerprompt_cubit.dart';
import 'package:practicacalculadora/prompter_answer.dart';
import 'package:practicacalculadora/single_button.dart';
import 'package:practicacalculadora/prompter_expression.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _expression = '';
  List<String> _history;

  void click(String texto, BuildContext context) {
    _expression += texto;
    context.read<AnswerPromptCubit>().typing(_expression);
  }

  void clear(String texto, BuildContext context) {
    _expression = '';
    context.read<AnswerPromptCubit>().clear(_expression);
  }

  void allClear(String texto, BuildContext context) {
    _expression = '';
    context.read<AnswerPromptCubit>().allClear();
  }

  void aproximacion(String texto, BuildContext context) {
    context.read<AnswerPromptCubit>().toggleApproximation(_expression);
  }

  void solucionar(String expr, BuildContext context) {
    String _ans = '';
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    _ans = exp.evaluate(EvaluationType.REAL, cm).toString();
    if (_ans.substring(_ans.length - 2, _ans.length) == ".0") {
      _ans = _ans.substring(0, _ans.length - 2);
    }
    _expression = '';
    if (context.read<AnswerPromptCubit>().state.withApproximation) {
      if (_ans.length > 5) {
        if (int.parse(_ans.substring(4, 5)) > 5) {
          _ans = _ans.substring(0, 6);
          double number = double.parse(_ans) + 0.0001;
          _ans = number.toString();
        } else {
          _ans = _ans.substring(0, 6);
          double number = double.parse(_ans);
          _ans = number.toString();
        }
      }
    }

    context.read<AnswerPromptCubit>().solved(_ans);
  }

  @override
  Widget build(BuildContext context) {
    final fondoNegroPeroMenos = Colors.black.withAlpha(20);
    return BlocProvider(
      create: (context) => AnswerPromptCubit(),
      child: BlocBuilder<AnswerPromptCubit, AnswerpromptState>(
        builder: (context, state) {
          return Scaffold(
              body: Container(
                  padding: EdgeInsets.all(12),
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          color: Colors.black, height: 50, width: 300, alignment: Alignment.centerLeft, child: FittedBox(alignment: Alignment.topLeft, child: PrompterAnswer(state.textToPrompt))),
                      Container(
                          color: Colors.greenAccent,
                          height: 100,
                          width: 300,
                          alignment: Alignment.centerRight,
                          child: FittedBox(alignment: Alignment.topRight, child: PrompterExpression(state.expression))),
                      Container(
                          color: Colors.black,
                          height: 100,
                          width: 300,
                          alignment: Alignment.center,
                          child: FittedBox(alignment: Alignment.center, child: buildApproxButton(state.withApproximation, context))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SingleButton("AC", allClear, colorFondo: fondoNegroPeroMenos),
                          SingleButton("C", clear, colorFondo: fondoNegroPeroMenos),
                          SingleButton(
                            "(",
                            click,
                            colorFondo: fondoNegroPeroMenos,
                          ),
                          SingleButton(
                            ")",
                            click,
                            colorFondo: fondoNegroPeroMenos,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[SingleButton('1', click), SingleButton('2', click), SingleButton("3", click), SingleButton("+", click, colorFondo: fondoNegroPeroMenos)],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[SingleButton('4', click), SingleButton('5', click), SingleButton("6", click), SingleButton("-", click, colorFondo: fondoNegroPeroMenos)],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[SingleButton('7', click), SingleButton('8', click), SingleButton("9", click), SingleButton("/", click, colorFondo: fondoNegroPeroMenos)],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
                        SingleButton("=", solucionar, ancho: 153, colorFondo: Colors.black.withAlpha(70)),
                        SingleButton(
                          "0",
                          click,
                        ),
                        SingleButton(
                          "*",
                          click,
                          colorFondo: fondoNegroPeroMenos,
                        ),
                      ]),
                    ],
                  )));
        },
      ),
    );
  }

  Widget buildApproxButton(_withApproximation, BuildContext context) {
    if (_withApproximation) {
      return SingleButton(
        "Aproximar",
        aproximacion,
        ancho: 200,
        largo: 50,
        colorFondo: Colors.blue,
      );
    }
    return SingleButton(
      "Aproximar",
      aproximacion,
      ancho: 200,
      largo: 50,
      colorFondo: Colors.black.withAlpha(100),
    );
  }
}
