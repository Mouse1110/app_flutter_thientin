// To parse this JSON data, do
//
//     final userPostOtd = userPostOtdFromJson(jsonString);

import 'dart:convert';

UserPostOtd userPostOtdFromJson(String str) =>
    UserPostOtd.fromJson(json.decode(str));

String userPostOtdToJson(UserPostOtd data) => json.encode(data.toJson());

class UserPostOtd {
  UserPostOtd({
    required this.id,
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

  factory UserPostOtd.fromJson(Map<String, dynamic> json) => UserPostOtd(
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
