import 'dart:convert';
List<TableModel> tableModelFromJson(String str) => List<TableModel>.from(json.decode(str).map((x) => TableModel.fromJson(x)));

String tableModelToJson(List<TableModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TableModel {
  TableModel({
    this.id,
    this.name,
    this.areaId,
    this.status,
    this.createdDate,
    this.updatedDate,
  });

  int id;
  String name;
  int areaId;
  bool status;
  dynamic createdDate;
  dynamic updatedDate;

  factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
    id: json["id"],
    name: json["name"],
    areaId: json["areaId"],
    status: json["status"],
    createdDate: json["createdDate"],
    updatedDate: json["updatedDate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "areaId": areaId,
    "status": status,
    "createdDate": createdDate,
    "updatedDate": updatedDate,
  };
}
