part of 'counter_bloc.dart';

@immutable
class CounterEvent {}

class OnIncrement extends CounterEvent {}

class OnDecrement extends CounterEvent {}

class OnReset extends CounterEvent {}
