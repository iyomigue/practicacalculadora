import 'package:bloc/bloc.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:meta/meta.dart';


part 'answerprompt_state.dart';

//Despues de mil vueltas, creo que la cosa mas sencilla y util de implementar
//pa entender los cubits es hacer que el prompt de respuesta cambie ligeramente
//en funcion del estado del proceso, osea, unas caracteristicas pa cuando esta
//vacio, pa cuando se escribe y pa cuando se soluciona.
class AnswerPromptCubit extends Cubit<AnswerpromptState> {

  AnswerPromptCubit() : super(AnswerpromptIsEmpty());

  void typing(String texto) {
    emit(AnswerpromptIsTyping(state, texto));
  }

  void solve() {
    String _ans = '';
    Parser p = Parser();
    Expression exp = p.parse(state.expression);
    ContextModel cm = ContextModel();

    _ans = exp.evaluate(EvaluationType.REAL, cm).toString();
    if (_ans.substring(_ans.length - 2, _ans.length) == ".0") {
      _ans = _ans.substring(0, _ans.length - 2);
    }
    if (state.withApproximation) {
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

    emit(AnswerpromptSolved(_ans, state));
  }

  void allClear() {
    emit(AnswerpromptIsEmpty());
  }
  void clear(){
    emit(AnswerPromptCleared(state));
  }

  void toggleApproximation() {
    if (state.withApproximation) {
      emit(ApproximationIsOff(state));
    } else {
      emit(ApproximationIsOn(state));
    }
  }
}







