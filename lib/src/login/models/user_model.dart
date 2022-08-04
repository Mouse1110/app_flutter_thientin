import 'dart:convert';

class User {
  User({
    required this.accessToken,
    required this.data,
  });

  String accessToken;
  Data data;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  factory User.fromMap(Map<String, dynamic> json) => User(
        accessToken: json["accessToken"],
        data: Data.fromMap(json["user"]),
      );
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
    this.avatar,
  });

  String id;
  String name;
  String phone;
  String email;
  String? direction;
  String? provincial;
  String? district;
  String? homeAddress;
  String? permission;
  String? reason;
  String? avatar;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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
      avatar: json["avatar"]);
}
