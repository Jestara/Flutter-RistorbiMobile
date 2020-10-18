import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ristorbi/Models/Table.dart';

class TableService {
  final baseUrl = "https://ristorbiservice.jestara.com/api/";

Future<List<TableModel>> getTables() async{
   final tablesURL = baseUrl + 'tables/getall';
   final response = await http.get(tablesURL);
    debugPrint('TABLE SERVİCE HTTP GET -->');
    debugPrint(response.body);
   if(response.statusCode != 200){
     print('PRİNT STATUS 200 DEĞİL');
     throw Exception('Service Bağlantısı Sağlanamadı !!!!');
   }

   final responseJson = jsonDecode(response.body);

   return (responseJson as List).map((t) => TableModel.fromJson(t)).toList();

}

}
