import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'answerprompt_state.dart';

//Despues de mil vueltas, creo que la cosa mas sencilla y util de implementar
//pa entender los cubits es hacer que el prompt de respuesta cambie ligeramente
//en funcion del estado del proceso, osea, unas caracteristicas pa cuando esta
//vacio, pa cuando se escribe y pa cuando se soluciona.
class AnswerPromptCubit extends Cubit<AnswerpromptState> {

  AnswerPromptCubit() : super(AnswerpromptIsEmpty());

  void typing() {
    emit(AnswerpromptIsTyping(state));
  }

  void solved(String ans) {
    emit(AnswerpromptSolved(ans, state));
  }

  void allClear() {
    emit(AnswerpromptIsEmpty());
  }

  void toggleApproximation() {
    if (state.withApproximation) {
      emit(ApproximationIsOff(state));
    } else {
      emit(ApproximationIsOn(state));
    }
  }
}






