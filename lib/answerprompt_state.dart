part of 'answerprompt_cubit.dart';

@immutable
abstract class AnswerpromptState {
  final String textToPrompt;
  const AnswerpromptState({this.textToPrompt="Empty"});
}
class AnswerpromptIsEmpty extends AnswerpromptState {

  const AnswerpromptIsEmpty():super(textToPrompt: "Hola");
}

class AnswerpromptIsTyping extends AnswerpromptState {
  const AnswerpromptIsTyping(): super(textToPrompt: "Typing");
}

class AnswerpromptSolved extends AnswerpromptState {
  const AnswerpromptSolved(String ans): super(textToPrompt: 'Solucion: $ans');
}