import 'dart:convert';

List<Category> productCategoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String productCategoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    this.id,
    this.name,
    this.description,
    this.createdDate,
    this.updatedDate,
  });

  int id;
  String name;
  String description;
  dynamic createdDate;
  dynamic updatedDate;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    createdDate: json["createdDate"],
    updatedDate: json["updatedDate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "createdDate": createdDate,
    "updatedDate": updatedDate,
  };
}
