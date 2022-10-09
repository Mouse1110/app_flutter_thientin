import 'dart:async';

import 'package:app_flutter_thientin/src/home/models/campaign_model.dart';
import 'package:rxdart/rxdart.dart';

class ProofDataValidation {
  final _campaign = BehaviorSubject<CampaignModel>();
  final _initPage = BehaviorSubject<int>();

  dispose() {
    _campaign.close();
    _initPage.close();
  }

  //Get
  Stream<CampaignModel> get streamCampaign =>
      _campaign.stream.transform(validateCampaign);
  Stream<int> get streamInitPage => _initPage.stream;
  // Set
  Function(CampaignModel) get addCampaign => _campaign.sink.add;
  Function(int) get addInitPage => _initPage.sink.add;
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
}
