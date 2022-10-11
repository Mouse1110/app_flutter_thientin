import 'dart:async';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import '../../../home/models/campaign_model.dart';

class ApplyFormValidation {
  final checkList = BehaviorSubject<CampaignModel>();

  void addCheckList(CampaignModel data) {
    checkList.sink.add(data);
    input = data.checkList.body.map((e) => BehaviorSubject<String>()).toList();
    streamInput = input.map((e) => e.stream).toList();
  }

  Stream<CampaignModel> get streamCheckList => checkList.stream;

  List<BehaviorSubject<String>> input = [];
  List<Stream<String>> streamInput = [];

  Stream<int> get streamButton => Rx.combineLatest2(
      streamInput[0], streamInput[0], (a, b) => checkList.value.idCaimpain);

  Future<List<MultipartFile>> getFile() async {
    List<MultipartFile> list = [];
    for (int i = 0; i < checkList.value.checkList.body.length; i++) {
      if (checkList.value.checkList.body[i].type != "txt") {
        list.add(await MultipartFile.fromFile(input[i].value,
            filename: 'files.png'));
      }
    }
    return list;
  }

  List<Map<String, dynamic>> geneData(List<dynamic> data) {
    List<Map<String, dynamic>> list = [];
    for (int i = 0; i < checkList.value.checkList.body.length; i++) {
      if (checkList.value.checkList.body[i].type == "txt") {
        list.add({
          "data": input[i].value,
          "type": checkList.value.checkList.body[i].type
        });
      } else {
        list.add({
          "data": '${data[0]}',
          "type": checkList.value.checkList.body[i].type
        });
        data.removeAt(0);
      }
    }
    return list;
  }
}
