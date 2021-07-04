import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'mywidgets.dart';
import 'package:math_expressions/math_expressions.dart';
import 'myhomepage.dart';

part 'answerprompt_state.dart';

class Answerprompt extends Cubit<AnswerpromptState> {
  Answerprompt() : super(AnswerpromptInitial());
  void onApprox(){
    //Aqui deberia llamar al getter del flag pa comprobar el estado pero nojepk
    //dice que no encuentra _MyHomePageState.withApproximationGetter() :-(
    //es pq es privada diosito?
    if(withApproximation){
      emit(state);
    }
    else
      emit(state)
  }
  @override
  void emit(AnswerpromptState state) {
    // TODO: implement emit
    super.emit(state);
  }
}


