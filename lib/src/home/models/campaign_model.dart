// To parse this JSON data, do
//
//     final campaign = campaignFromMap(jsonString);

import 'dart:convert';

class CampaignModel {
  CampaignModel({
    required this.idCaimpain,
    required this.owner,
    required this.user,
    required this.listUserDonate,
    required this.listUserReceiver,
    required this.image,
    required this.countDonate,
    required this.checkList,
    required this.info,
  });

  int idCaimpain;
  String owner;
  User user;
  List<ListUser> listUserDonate;
  List<ListUser> listUserReceiver;
  String image;
  int countDonate;
  List<CheckList> checkList;
  Info info;

  factory CampaignModel.fromJson(String str) =>
      CampaignModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CampaignModel.fromMap(Map<String, dynamic> json) => CampaignModel(
        idCaimpain: json["id_caimpain"],
        owner: json["owner"],
        user: User.fromMap(json["user"]),
        listUserDonate: List<ListUser>.from(
            json["list_user_donate"].map((x) => ListUser.fromMap(x))),
        listUserReceiver: List<ListUser>.from(
            json["list_user_receiver"].map((x) => ListUser.fromMap(x))),
        image: json["image"],
        countDonate: json["count_donate"],
        checkList: List<CheckList>.from(
            json["check_list"].map((x) => CheckList.fromMap(x))),
        info: Info.fromMap(json["info"]),
      );

  Map<String, dynamic> toMap() => {
        "id_caimpain": idCaimpain,
        "owner": owner,
        "user": user.toMap(),
        "list_user_donate":
            List<dynamic>.from(listUserDonate.map((x) => x.toMap())),
        "list_user_receiver":
            List<dynamic>.from(listUserReceiver.map((x) => x.toMap())),
        "image": image,
        "count_donate": countDonate,
        "check_list": List<dynamic>.from(checkList.map((x) => x.toMap())),
        "info": info.toMap(),
      };
}

class CheckList {
  CheckList({
    required this.phone,
    required this.content,
    required this.type,
    required this.id,
  });

  String phone;
  String content;
  String type;
  String id;

  factory CheckList.fromJson(String str) => CheckList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CheckList.fromMap(Map<String, dynamic> json) => CheckList(
        phone: json["phone"],
        content: json["content"],
        type: json["type"],
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "phone": phone,
        "content": content,
        "type": type,
        "_id": id,
      };
}

class Info {
  Info({
    required this.name,
    required this.lowPrice,
    required this.regStart,
    required this.charityStart,
    required this.approveStart,
    required this.disburStart,
    required this.content,
    required this.total,
    required this.isDisbur,
  });

  String name;
  String lowPrice;
  int regStart;
  int charityStart;
  int approveStart;
  int disburStart;
  String content;
  String total;
  bool isDisbur;

  factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        name: json["name"],
        lowPrice: json["low_price"],
        regStart: json["reg_start"],
        charityStart: json["charity_start"],
        approveStart: json["approve_start"],
        disburStart: json["disbur_start"],
        content: json["content"],
        total: json["total"],
        isDisbur: json["is_disbur"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "low_price": lowPrice,
        "reg_start": regStart,
        "charity_start": charityStart,
        "approve_start": approveStart,
        "disbur_start": disburStart,
        "content": content,
        "total": total,
        "is_disbur": isDisbur,
      };
}

class ListUser {
  ListUser({
    required this.name,
    required this.phone,
    required this.amount,
  });

  String name;
  String phone;
  String amount;

  factory ListUser.fromJson(String str) => ListUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListUser.fromMap(Map<String, dynamic> json) => ListUser(
        name: json["name"],
        phone: json["phone"],
        amount: json["amount"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "phone": phone,
        "amount": amount,
      };
}

class User {
  User({
    required this.phone,
    required this.name,
    required this.avatar,
  });

  String phone;
  String name;
  String avatar;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        phone: json["phone"],
        name: json["name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toMap() => {
        "phone": phone,
        "name": name,
        "avatar": avatar,
      };
}
