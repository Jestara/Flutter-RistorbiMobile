import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:ristorbi/Blocs/Table/table_bloc.dart';
import 'dart:convert';

import 'package:ristorbi/Models/Table.dart';

import '../constants.dart';

class TableService {

Future<List<TableModel>> getTables() async{
   final tablesURL = baseUrl + 'tables/getall';
   final response = await http.get(tablesURL);
    debugPrint('TABLE SERVİCE HTTP GET -->');
    debugPrint(response.body);
   if(response.statusCode == 200){
     final responseJson = jsonDecode(response.body);
     return (responseJson as List).map((t) => TableModel.fromJson(t)).toList();

   }else {
     print('PRİNT STATUS 200 DEĞİL');
     throw Exception('Service Bağlantısı Sağlanamadı !!!!');

   }



}

}
