import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'mywidgets.dart';
import 'package:math_expressions/math_expressions.dart';
import 'myhomepage.dart';

part 'answerprompt_state.dart';
//Despues de mil vueltas, creo que la cosa mas sencilla y util de implementar
//pa entender los cubits es hacer que el prompt de respuesta cambie ligeramente
//en funcion del estado del proceso, osea, unas caracteristicas pa cuando esta
//vacio, pa cuando se escribe y pa cuando se soluciona.
class Answerprompt extends Cubit<AnswerpromptState> {
  final prompter_ans _prompter;

  Answerprompt(this._prompter) : super(AnswerpromptIsEmpty());

  Future<void> getExpression() async {
      emit(AnswerpromptIsEmpty());
      //Aqui habria que ver cuando se empieza a escribir, marronako
      emit(AnswerpromptIsTyping());
      //Aqui cuando se pulsa ans, doble marronako
      emit(AnswerpromptSolved());
  }
}


