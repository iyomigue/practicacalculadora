part of 'answerprompt_cubit.dart';

@immutable
abstract class AnswerpromptState {
  const AnswerpromptState();
}
class AnswerpromptIsEmpty extends AnswerpromptState {
  const AnswerpromptIsEmpty();
}

class AnswerpromptIsTyping extends AnswerpromptState {
  const AnswerpromptIsTyping();
}

class AnswerpromptSolved extends AnswerpromptState {
  const AnswerpromptSolved();
}