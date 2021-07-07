import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'answerprompt_state.dart';

//Despues de mil vueltas, creo que la cosa mas sencilla y util de implementar
//pa entender los cubits es hacer que el prompt de respuesta cambie ligeramente
//en funcion del estado del proceso, osea, unas caracteristicas pa cuando esta
//vacio, pa cuando se escribe y pa cuando se soluciona.
class AnswerPromptCubit extends Cubit<AnswerpromptState> {

  AnswerPromptCubit() : super(AnswerpromptIsEmpty());

  void typing(String expression) {
    emit(AnswerpromptIsTyping(state, expression));
  }

  void solved(String ans) {
    emit(AnswerpromptSolved(ans, state));
  }

  void allClear() {
    emit(AnswerpromptIsEmpty());
  }
  void clear(String expression){
    emit(AnswerPromptCleared(state, expression));
  }

  void toggleApproximation(String expression) {
    if (state.withApproximation) {
      emit(ApproximationIsOff(state, expression));
    } else {
      emit(ApproximationIsOn(state, expression));
    }
  }
}







