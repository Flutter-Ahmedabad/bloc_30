import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'couter_event.dart';
part 'couter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial());

  int counter = 0;
  int counterPlus2 = 0;

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is IncrementCounterEvent) {
      counter++;
      counterPlus2 += 2;
      yield CouterLoaded(counter, counterPlus2);
    } else if (event is ResetCounterEvent) {
      counter = 0;
      counterPlus2 = 0;
      yield CouterLoaded(counter, counterPlus2);
    }
  }

  @override
  void onTransition(Transition<CounterEvent, CounterState> transition) {
    print(
        'prevState: ${transition.currentState} event: ${transition.event} nextState: ${transition.nextState}');
    super.onTransition(transition);
  }
}
