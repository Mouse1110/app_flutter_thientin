import 'dart:io';

import 'package:dio/dio.dart';

class CampaignRequestModel {
  CampaignRequestModel({
    required this.img,
    required this.name,
    required this.content,
    required this.dateRegistration,
    required this.dateCharity,
    required this.dateApprove,
    required this.dateDisbur,
    required this.checkList,
  });

  File img;
  String name;
  String content;
  int dateRegistration;
  int dateCharity;
  int dateApprove;
  int dateDisbur;
  CheckList checkList;

  Future<Map<String, dynamic>> toJson() async => {
        "img": await MultipartFile.fromFile(img.path, filename: 'upload.txt'),
        "name": name,
        "content": content,
        "date_registration": dateRegistration,
        "date_charity": dateCharity,
        "date_approve": dateApprove,
        "date_disbur": dateDisbur,
        "check_list": checkList.toJson(),
      };
}

class CheckList {
  CheckList({
    required this.person,
    required this.body,
  });

  List<String> person;
  List<BodyApproveModel> body;

  Map<String, dynamic> toJson() => {
        "person": List<String>.from(person.map((x) => x)),
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
      };
}

class BodyApproveModel {
  BodyApproveModel({
    required this.content,
    required this.tag,
  });

  String content;
  String tag;

  Map<String, dynamic> toJson() => {
        "content": content,
        "type": tag,
      };
}
