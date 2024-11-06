import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tech_x_preparation/views/counter/bloc/counter_bloc.dart';

void main() {
  group('Counter Bloc OnIncrement', () {
    blocTest<CounterBloc, CounterState>(
      'emits [] when nothing is added.',
      build: () => CounterBloc(),
      expect: () => [],
    );
    blocTest<CounterBloc, CounterState>(
      'emits [CounterBloc] when OnIncrement is added.',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(OnIncrement()),
      expect: () => [
        // in case after OnIncrement() is added, the state is CounterCurrent(1)
        isA<CounterCurrent>().having((state) => state.value, 'is a 1', 1),
      ],
    );
    blocTest<CounterBloc, CounterState>(
      'emits [CounterBloc] when OnIncrement is added.',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(OnIncrement()),
      expect: () => [
        // in case after OnIncrement() is added, the state is CounterCurrent(1) (not negative)
        isA<CounterCurrent>()
            .having((state) => state.value, 'is a 1', greaterThan(0)),
      ],
    );
  });
  group('Counter Bloc OnDecrement', () {
    blocTest<CounterBloc, CounterState>(
      'emits [OnDecrement] when MyEvent is added.',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(OnDecrement()),
      expect: () => [],
    );

    blocTest<CounterBloc, CounterState>(
      'emits [OnDecrement] when MyEvent is added.',
      build: () => CounterBloc(),
      act: (bloc) => {
        bloc.add(OnIncrement()),
        bloc.add(OnDecrement()),
      },
      expect: () => [
        isA<CounterCurrent>().having((state) => state.value, 'is a ', 1),
        isA<CounterCurrent>().having((state) => state.value, 'is a 0', 0),
      ],
    );
  });
  group('Counter Bloc OnReset', () {
    //

    blocTest<CounterBloc, CounterState>(
      'emits [OnReset] when MyEvent is added.',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(OnReset()),
      expect: () => [
        isA<CounterInitial>().having((state) => state.value, 'is a 0', 0),
      ],
    );
  });
}
