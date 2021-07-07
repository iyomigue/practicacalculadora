part of 'answerprompt_cubit.dart';

@immutable
abstract class AnswerpromptState {
  final String textToPrompt;
  final bool withApproximation;
  final String expression;
  final String answer;

  AnswerpromptState({this.textToPrompt = "Empty", this.withApproximation = false, this.expression = '', this.answer = ''});
}

class AnswerpromptIsEmpty extends AnswerpromptState {
  AnswerpromptIsEmpty() : super(textToPrompt: "Hola");
}

class AnswerpromptIsTyping extends AnswerpromptState {
  AnswerpromptIsTyping(AnswerpromptState state, String expression) : super(textToPrompt: "Typing", withApproximation: state.withApproximation, expression: expression);
}

class AnswerpromptSolved extends AnswerpromptState {
  AnswerpromptSolved(String ans, AnswerpromptState state) : super(textToPrompt: 'Solucion: $ans', withApproximation: state.withApproximation);
}

class ApproximationIsOn extends AnswerpromptState {
  ApproximationIsOn(AnswerpromptState state, String expression) : super(textToPrompt: state.textToPrompt, withApproximation: true, expression: expression);
}

class ApproximationIsOff extends AnswerpromptState {
  ApproximationIsOff(AnswerpromptState state, String expression) : super(textToPrompt: state.textToPrompt, withApproximation: false, expression: expression);
}

class AnswerPromptCleared extends AnswerpromptState{
  AnswerPromptCleared(AnswerpromptState state, String expression):super(textToPrompt: 'Limpiado', expression: '', withApproximation: state.withApproximation);
}
