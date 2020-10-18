import 'dart:convert';

List<Area> areaFromJson(String str) => List<Area>.from(json.decode(str).map((x) => Area.fromJson(x)));

String areaToJson(List<Area> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Area {
  Area({
    this.id,
    this.name,
    this.createdDate,
    this.updatedDate,
  });

  int id;
  String name;
  dynamic createdDate;
  dynamic updatedDate;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    id: json["id"],
    name: json["name"],
    createdDate: json["createdDate"],
    updatedDate: json["updatedDate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "createdDate": createdDate,
    "updatedDate": updatedDate,
  };
}