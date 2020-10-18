import 'dart:convert';

import 'Product.dart';

List<TableModel> tablesFromJson(String str) =>
    List<TableModel>.from(json.decode(str).map((x) => TableModel.fromJson(x)));

String tablesToJson(List<TableModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TableModel {
  int id;
  String name;
  List<Product> products;

  TableModel({
    this.id,
    this.name,
    this.products,
  });

  factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
        id: json["id"],
        name: json["name"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}
