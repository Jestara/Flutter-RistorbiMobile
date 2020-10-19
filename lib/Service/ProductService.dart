import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ristorbi/Models/Product.dart';
import 'package:ristorbi/constants.dart';

class ProductService {

  Future<List<Product>> getProductsByCategoryId(int categoryId) async {
    final productUrl = baseUrl + "products/getbycategoryid?categoryid=${categoryId}";
    final response = await http.get(productUrl);
    if(response.statusCode == 200){
      print(response.body);
      final responseJson = jsonDecode(response.body);
      return (responseJson as List).map((product) => Product.fromJson(product)).toList();
    }else {
      //throw Exception('GET PRODUCT BY CATEGORY ID ERROR');
    }


  }

}