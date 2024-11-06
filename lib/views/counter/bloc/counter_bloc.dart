import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int count = 0;
  CounterBloc() : super(CounterInitial(value: 0)) {
    on<CounterEvent>((event, emit) {
      if (event is OnIncrement) {
        _handleOnIncrement(emit);
      }
      if (event is OnDecrement) {
        _handleOnDecrement(emit);
      }

      if (event is OnReset) {
        _handleOnReset(emit);
      }
    });
  }

  void _handleOnIncrement(Emitter emit) {
    count++;

    emit(CounterCurrent(count));
  }

  void _handleOnDecrement(Emitter emit) {
    if (count > 0) {
      count--;
      emit(CounterCurrent(count));
    }
  }

  void _handleOnReset(Emitter emit) {
    emit(CounterInitial(value: 0));
  }
}
