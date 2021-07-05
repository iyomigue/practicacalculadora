import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practicacalculadora/prompter_answer.dart';

part 'answerprompt_state.dart';
//Despues de mil vueltas, creo que la cosa mas sencilla y util de implementar
//pa entender los cubits es hacer que el prompt de respuesta cambie ligeramente
//en funcion del estado del proceso, osea, unas caracteristicas pa cuando esta
//vacio, pa cuando se escribe y pa cuando se soluciona.
class AnswerPromptCubit extends Cubit<AnswerpromptState> {

  AnswerPromptCubit() : super(AnswerpromptIsEmpty());

  Future<void> getExpression() async {
      emit(AnswerpromptIsEmpty());
      //Aqui habria que ver cuando se empieza a escribir, marronako
      emit(AnswerpromptIsTyping());
      //Aqui cuando se pulsa =, doble marronako
  }

  void typing() {
    emit(AnswerpromptIsTyping());
  }

  void solved(String ans) {
    emit(AnswerpromptSolved(ans));
  }
}


