import 'dart:convert';

import 'package:dio/dio.dart';

class Campaign {
  Campaign({
    required this.img,
    required this.name,
    required this.content,
    required this.dateRegistration,
    required this.dateCharity,
    required this.dateApprove,
    required this.dateDisbur,
    required this.checkList,
  });

  String img;
  final String name;
  final String content;
  final int dateRegistration;
  final int dateCharity;
  final int dateApprove;
  final int dateDisbur;
  final List<CheckList> checkList;

  String toJson() => json.encode(toMap());

  Future<Map<String, dynamic>> toMap() async => {
        "img": await MultipartFile.fromFile(img, filename: 'upload.png'),
        "name": name,
        "content": content,
        "date_registration": dateRegistration,
        "date_charity": dateCharity,
        "date_approve": dateApprove,
        "date_disbur": dateDisbur,
        "check_list": List<dynamic>.from(checkList.map((x) => x.toMap())),
      };
}

class CheckList {
  CheckList({
    this.name,
    required this.phone,
    required this.content,
    required this.type,
  });
  String? name;
  final String phone;
  final String content;
  final String type;

  factory CheckList.fromJson(String str) => CheckList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CheckList.fromMap(Map<String, dynamic> json) => CheckList(
        phone: json["phone"],
        content: json["content"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "phone": phone,
        "content": content,
        "type": type,
      };
}
