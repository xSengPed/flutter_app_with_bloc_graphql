part of 'counter_bloc.dart';

@immutable
class CounterState {}

class CounterInitial extends CounterState {
  final int value;
  CounterInitial({required this.value});
}

class CounterCurrent extends CounterState {
  final int value;
  CounterCurrent(this.value);
}
