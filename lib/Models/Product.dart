import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.id,
    this.name,
    this.price,
    this.description,
    this.categoryId,
    this.createdDate,
    this.updatedDate,
  });

  int id;
  String name;
  double price;
  String description;
  int categoryId;
  dynamic createdDate;
  dynamic updatedDate;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    categoryId: json["categoryId"],
    createdDate: json["createdDate"],
    updatedDate: json["updatedDate"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description,
    "categoryId": categoryId,
    "createdDate": createdDate,
    "updatedDate": updatedDate,
  };
}
