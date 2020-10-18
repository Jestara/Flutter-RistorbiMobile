import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ristorbi/Models/Area.dart';
import 'package:ristorbi/constants.dart';

class AreaService{
  Future<List<Area>> getAreas() async{
    final areaUrl = baseUrl + "areas/getall";
    final response = await http.get(areaUrl);

    if(response.statusCode == 200){
      print("AREA HTTP GET RESPONSE --> ");
      print(response.body);
      final responseJson = jsonDecode(response.body);
      return (responseJson as List).map((area) => Area.fromJson(area)).toList();
    }
}
}