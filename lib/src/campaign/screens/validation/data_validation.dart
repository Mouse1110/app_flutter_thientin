import 'dart:async';

import 'package:app_flutter_thientin/src/home/models/campaign_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class CampaignDataValidation {
  final _campaign = BehaviorSubject<CampaignModel>();

  dispose() {
    _campaign.close();
  }

  //Get
  Stream<CampaignModel> get streamCampaign =>
      _campaign.stream.transform(validateCampaign);

  Stream<bool> get streamButtonForm =>
      Rx.combineLatest2(streamCampaign, streamCampaign, (a, b) {
        CampaignModel data = (a as CampaignModel);

        if (data.info.disburStart -
                DateTime.now().millisecondsSinceEpoch / 1000 <
            0) return false;
        return true;
      });

  Stream<bool> get streamButtonDonate =>
      Rx.combineLatest2(streamCampaign, streamCampaign, (a, b) {
        CampaignModel data = (a as CampaignModel);

        if (data.info.disburStart -
                DateTime.now().millisecondsSinceEpoch / 1000 <
            0) return false;
        return true;
      });

  Stream<bool> get streamButtonApprove =>
      Rx.combineLatest2(streamCampaign, streamCampaign, (a, b) {
        CampaignModel data = (a as CampaignModel);

        if (data.info.approveStart -
                DateTime.now().millisecondsSinceEpoch / 1000 <
            0) return true;
        return false;
      });
  // Set
  Function(CampaignModel) get addCampaign => _campaign.sink.add;
  // Tranformers
  final validateCampaign =
      StreamTransformer<CampaignModel, CampaignModel>.fromHandlers(
          handleData: ((data, sink) {
    sink.add(data);
    //10
  }));

  // Event
  String convertPhone(String phone) {
    String str = '';
    for (int i = 0; i < phone.length; i++) {
      if (str.length > 4) {
        str += 'x';
      } else {
        str += phone[i];
      }
    }
    return str;
  }

  int indexTimeline(CampaignModel data) {
    if (data.info.regStart - DateTime.now().millisecondsSinceEpoch / 1000 < 0) {
      if (data.info.charityStart -
              DateTime.now().millisecondsSinceEpoch / 1000 <
          0) {
        if (data.info.approveStart -
                DateTime.now().millisecondsSinceEpoch / 1000 <
            0) {
          if (data.info.disburStart -
                  DateTime.now().millisecondsSinceEpoch / 1000 <
              0) {
            return 4;
          }
          return 3;
        }
        return 2;
      }
    }
    return 1;
  }

  List<String> timeLine(CampaignModel data) {
    List<String> time = [];
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(data.info.regStart * 1000);
    time.add('${date.day}-${date.month}-${date.year}');
    date = DateTime.fromMillisecondsSinceEpoch(data.info.charityStart * 1000);
    time.add('${date.day}-${date.month}-${date.year}');
    date = DateTime.fromMillisecondsSinceEpoch(data.info.approveStart * 1000);
    time.add('${date.day}-${date.month}-${date.year}');
    date = DateTime.fromMillisecondsSinceEpoch(data.info.disburStart * 1000);
    time.add('${date.day}-${date.month}-${date.year}');

    return time;
  }

  String timeRemaining(int date) {
    Duration time = DateTime.fromMillisecondsSinceEpoch(date * 1000)
        .difference(DateTime.now());
    if (time.inDays > 0) return 'Còn lại: ${time.inDays} ngày';
    return 'Chờ giải ngân';
  }

  void direcProof(BuildContext context) {}
}
