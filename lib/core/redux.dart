// Define actions
import 'package:redux/redux.dart';

enum ActionType { increment, decrement }

// Define reducers
int counterReducer(int state, dynamic action) {
  if (action == ActionType.increment) {
    return state + 1;
  } else if (action == ActionType.decrement) {
    return state - 1;
  }
  return state;
}

// Define actions
class IncrementAction {}

class DecrementAction {}

// Create a Redux store
final store = Store<int>(
  counterReducer,
  initialState: 0,
);