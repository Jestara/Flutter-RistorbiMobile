import 'package:flutter/cupertino.dart';
import 'package:ristorbi/Models/Table.dart';
import 'package:ristorbi/Service/TableService.dart';

import '../locator.dart';

class TableRepository{
  TableService _tableService = locator<TableService>();
  TableRepository(){}

  Future<List<TableModel>> getTables() async{
  return await _tableService.getTables();
  }
}