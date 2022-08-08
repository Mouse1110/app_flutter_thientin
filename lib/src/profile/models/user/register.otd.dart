// To parse this JSON data, do
//
//     final registerOtd = registerOtdFromJson(jsonString);

import 'dart:convert';

RegisterOtd registerOtdFromJson(String str) =>
    RegisterOtd.fromJson(json.decode(str));

String registerOtdToJson(RegisterOtd data) => json.encode(data.toJson());

class RegisterOtd {
  RegisterOtd({
    required this.accessToken,
    required this.data,
  });

  String accessToken;
  Data data;

  factory RegisterOtd.fromJson(Map<String, dynamic> json) => RegisterOtd(
        accessToken: json["accessToken"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    this.direction,
    this.provincial,
    this.district,
    this.homeAddress,
    this.permission,
    this.reason,
    this.info,
  });

  String id;
  String name;
  String phone;
  String email;
  String? direction;
  String? provincial;
  String? district;
  String? homeAddress;
  int? permission;
  String? reason;
  String? info;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        direction: json["direction"],
        provincial: json["provincial"],
        district: json["district"],
        homeAddress: json["home_address"],
        permission: json["permission"],
        reason: json["reason"],
        info: json["info"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "direction": direction,
        "provincial": provincial,
        "district": district,
        "home_address": homeAddress,
        "permission": permission,
        "reason": reason,
        "info": info,
      };
}
