// To parse this JSON data, do
//
//     final signUpPostOtd = signUpPostOtdFromJson(jsonString);

import 'dart:convert';

SignUpPostOtd signUpPostOtdFromJson(String str) =>
    SignUpPostOtd.fromJson(json.decode(str));

String signUpPostOtdToJson(SignUpPostOtd data) => json.encode(data.toJson());

class SignUpPostOtd {
  SignUpPostOtd({
    this.name,
    this.phone,
    this.password,
    this.email,
    this.direction,
    this.provincial,
    this.district,
    this.homeAddress,
    this.permission,
    this.reason,
    this.info,
  });

  String? name;
  String? phone;
  String? password;
  String? email;
  String? direction;
  String? provincial;
  String? district;
  String? homeAddress;
  String? permission;
  String? reason;
  String? info;

  factory SignUpPostOtd.fromJson(Map<String, dynamic> json) => SignUpPostOtd(
        name: json["name"],
        phone: json["phone"],
        password: json["password"],
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
        "name": name,
        "phone": phone,
        "password": password,
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
