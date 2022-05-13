// To parse this JSON data, do
//
//     final cityItem = cityItemFromJson(jsonString);

import 'dart:convert';

CityItem cityItemFromJson(String str) => CityItem.fromJson(json.decode(str));

String cityItemToJson(CityItem data) => json.encode(data.toJson());

class CityItem {
  CityItem({
    this.data,
    this.error,
  });

  final Data? data;
  final dynamic error;

  factory CityItem.fromJson(Map<String, dynamic> json) => CityItem(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data!.toJson(),
    "error": error,
  };
}

class Data {
  Data({
    this.result,
    this.message,
    this.items,
  });

  final bool? result;
  final String? message;
  final List<Item>? items;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.name,
    this.code,
    this.divisionType,
    this.codename,
    this.phoneCode,
    this.districts,
  });

  final String? name;
  final int? code;
  final String? divisionType;
  final String? codename;
  final int? phoneCode;
  final List<dynamic>? districts;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: json["name"] == null ? null : json["name"],
    code: json["code"] == null ? null : json["code"],
    divisionType: json["division_type"] == null ? null : json["division_type"],
    codename: json["codename"] == null ? null : json["codename"],
    phoneCode: json["phone_code"] == null ? null : json["phone_code"],
    districts: json["districts"] == null ? null : List<dynamic>.from(json["districts"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "code": code == null ? null : code,
    "division_type": divisionType == null ? null : divisionType,
    "codename": codename == null ? null : codename,
    "phone_code": phoneCode == null ? null : phoneCode,
    "districts": districts == null ? null : List<dynamic>.from(districts!.map((x) => x)),
  };
}
