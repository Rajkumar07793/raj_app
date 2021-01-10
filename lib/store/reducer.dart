import 'actions.dart';

int reducer(int previousState, dynamic action) {

  if(action == actions.increment) {
    return previousState + 1; 
  }
  else if (action == actions.decrement){
    return previousState -1;
  }

  return previousState;
}