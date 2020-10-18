import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:ristorbi/Models/Area.dart';
import 'package:ristorbi/Repository/AreaRepository.dart';
import 'package:ristorbi/locator.dart';

import 'area_event.dart';
part 'area_state.dart';

class AreaBloc extends Bloc<AreaEvent, AreaState> {
  final AreaRepository _areaRepository = locator<AreaRepository>();
  AreaBloc() : super(AreaInitial());

  @override
  Stream<AreaState> mapEventToState (AreaEvent event,) async* {

    switch(event){
      case AreaEvent.getAreas:
        yield AreaLoadingState();
        try {

          final areas = await _areaRepository.getAreas();
            yield AreaLoadedState(areas: areas);

        } catch(error) {
          yield AreaErrorState();
        }
    }
  }
}
