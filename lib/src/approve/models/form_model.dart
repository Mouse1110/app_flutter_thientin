class FormModel {
  FormModel({
    required this.idUser,
    required this.idCampaign,
    required this.name,
    required this.phone,
    this.checkSet,
    required this.checkList,
  });

  String idUser;
  String idCampaign;
  String name;
  String phone;
  List<CheckSet>? checkSet;
  List<CheckListFormModel> checkList;

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        idUser: json["id_user"],
        idCampaign: json["id_campaign"],
        name: json["name"],
        phone: json["phone"],
        checkSet: json["check_set"] != null
            ? List<CheckSet>.from(
                json["check_set"].map((x) => CheckSet.fromJson(x)))
            : [],
        checkList: List<CheckListFormModel>.from(
            json["check_list"].map((x) => CheckListFormModel.fromJson(x))),
      );
}

class CheckListFormModel {
  CheckListFormModel({
    required this.type,
    required this.data,
  });

  String type;
  String data;

  factory CheckListFormModel.fromJson(Map<String, dynamic> json) =>
      CheckListFormModel(
        type: json["type"],
        data: json["data"],
      );
}

class CheckSet {
  CheckSet({
    required this.content,
    required this.type,
  });

  String content;
  String type;

  factory CheckSet.fromJson(Map<String, dynamic> json) => CheckSet(
        content: json["content"],
        type: json["type"],
      );
}
