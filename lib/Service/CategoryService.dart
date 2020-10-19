import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ristorbi/Models/Category.dart';

import '../constants.dart';


class CategoryService {


      Future<List<Category>> getCategories() async{
        final categoriesUrl = baseUrl + 'categories/getall';
        final response = await http.get(categoriesUrl);
           print('CATEGORY SERVİCE HTTP GET -->');
           print(response.body);

           if(response.statusCode != 200){
             throw Exception('CATEGORY SERVİCE BAĞLANTISI SAĞLANAMADI');
           }

           final responseJson = jsonDecode(response.body);

           return (responseJson as List).map((category) => Category.fromJson(category)).toList();
      }
}