part of 'spaceship_bloc.dart';

@immutable
class SpaceshipState {}

class SpaceshipInitial extends SpaceshipState {}

class SpaceshipLoading extends SpaceshipState {
  SpaceshipLoading();
}

class SpaceshipLoaded extends SpaceshipState {
  final int pageOffset;
  final List<Spaceship> spaceships;
  SpaceshipLoaded(this.spaceships, this.pageOffset);
}

class SpaceshipPageOffset extends SpaceshipState {
  final int value;
  SpaceshipPageOffset(this.value);
}
