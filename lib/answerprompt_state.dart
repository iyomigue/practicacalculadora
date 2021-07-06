part of 'answerprompt_cubit.dart';

@immutable
abstract class AnswerpromptState {
  final String textToPrompt;
  final bool withApproximation;

   AnswerpromptState({this.textToPrompt = "Empty", this.withApproximation = false});
}

class AnswerpromptIsEmpty extends AnswerpromptState {
   AnswerpromptIsEmpty() : super(textToPrompt: "Hola");
}

class AnswerpromptIsTyping extends AnswerpromptState {
  AnswerpromptIsTyping(AnswerpromptState state) : super(textToPrompt: "Typing", withApproximation: state.withApproximation);
}

class AnswerpromptSolved extends AnswerpromptState {
  AnswerpromptSolved(String ans, AnswerpromptState state) : super(textToPrompt: 'Solucion: $ans', withApproximation: state.withApproximation);
}

class ApproximationIsOn extends AnswerpromptState {
  ApproximationIsOn(AnswerpromptState state): super(textToPrompt: state.textToPrompt, withApproximation: true);
}

class ApproximationIsOff extends AnswerpromptState {
  ApproximationIsOff(AnswerpromptState state): super(textToPrompt: state.textToPrompt, withApproximation: false);
}