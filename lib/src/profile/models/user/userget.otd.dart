// To parse this JSON data, do
//
//     final userOtd = userOtdFromJson(jsonString);

import 'dart:convert';

UserOtd userOtdFromJson(String str) => UserOtd.fromJson(json.decode(str));

String userOtdToJson(UserOtd data) => json.encode(data.toJson());

class UserOtd {
  UserOtd({
    required this.accessToken,
    required this.data,
  });

  String accessToken;
  Data data;

  factory UserOtd.fromJson(Map<String, dynamic> json) => UserOtd(
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
    required this.dataId,
    required this.name,
    required this.phone,
    required this.email,
    required this.direction,
    required this.provincial,
    required this.district,
    required this.homeAddress,
    required this.permission,
    required this.reason,
    required this.info,
  });

  String id;
  String dataId;
  String name;
  String phone;
  String email;
  String direction;
  String provincial;
  String district;
  String homeAddress;
  int permission;
  String reason;
  String info;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        dataId: json["id"],
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
        "_id": id,
        "id": dataId,
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
