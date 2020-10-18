import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:ristorbi/Models/Table.dart';
import 'package:ristorbi/Repository/TableRepository.dart';
import 'package:ristorbi/locator.dart';
import 'table_state.dart';
import 'table_event.dart';



class TableBloc extends Bloc<TableEvents, TableState> {
  final TableRepository _tableRepository = locator<TableRepository>();

  TableBloc() : super(TableInitial());

  @override
  Stream<TableState> mapEventToState(
      TableEvents event,
  ) async* {
    switch(event){
      case TableEvents.getTables:
      yield TableLoadingState();
      try {

        final tables = await _tableRepository.getTables();

        yield TableLoadedState(tables: tables);


      } catch (error) {
       // debugPrint(error);
        //yield TableErrorState();

      }
    }
  }
}


