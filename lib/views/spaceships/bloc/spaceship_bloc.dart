import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tech_x_preparation/api/graphql_client.dart';
import 'package:tech_x_preparation/views/spaceships/models/spaceship.dart';

part 'spaceship_event.dart';
part 'spaceship_state.dart';

class SpaceshipBloc extends Bloc<SpaceshipEvent, SpaceshipState> {
  int _pageOffset = 0;
  SpaceshipBloc() : super(SpaceshipInitial()) {
    on<SpaceshipEvent>((event, emit) async {
      log(event.toString());
      if (event is OnInit) {
        /* do something*/
        await _handleOnInit(emit);
      }
      if (event is OnBack) {
        /* do something*/
        await _handleOnBack(emit);
      }
      if (event is OnForward) {
        /* do something*/
        await _handleOnForward(emit);
      }
    });

    add(OnInit());
  }
  Future<void> _handleOnInit(Emitter emit) async {
    emit(SpaceshipLoading());
    final r = await QlClient.getSpaceships(0);
    emit(SpaceshipLoaded(r, 0));
  }

  Future<void> _handleOnBack(Emitter emit) async {
    if (_pageOffset > 0) {
      _pageOffset--;
      emit(SpaceshipLoading());
      final r = await QlClient.getSpaceships(_pageOffset);
      emit(SpaceshipLoaded(r, _pageOffset));
    }
  }

  Future<void> _handleOnForward(Emitter emit) async {
    _pageOffset++;
    emit(SpaceshipLoading());
    final r = await QlClient.getSpaceships(_pageOffset);
    if (r.isNotEmpty) {
      emit(SpaceshipLoaded(r, _pageOffset));
    }
  }
}
