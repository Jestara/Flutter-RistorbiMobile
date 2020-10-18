import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ristorbi/Models/Table.dart';

abstract class TableState extends Equatable {
  const TableState();
}

class TableInitial extends TableState {
  @override
  List<Object> get props => [];

}

class TableLoadingState extends TableState{
  @override
  List<Object> get props => throw UnimplementedError();

}

class TableLoadedState extends TableState{

  List<TableModel> tables;
  TableLoadedState({@required this.tables});

  @override
  List<Object> get props => [tables];

}

class TableErrorState extends TableState{
  @override
  List<Object> get props => throw UnimplementedError('TABLE ERROR STATE');

}