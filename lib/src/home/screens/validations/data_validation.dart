import 'dart:async';

import 'package:app_flutter_thientin/src/home/models/campaign_model.dart';
import 'package:rxdart/rxdart.dart';

class DataValidation {
  final _campaign = BehaviorSubject<CampaignModel>();
  final _listCampaign = BehaviorSubject<List<CampaignModel>>();

  dispose() {
    _campaign.close();
    _listCampaign.close();
  }

  //Get
  Stream<CampaignModel> get streamCampaign =>
      _campaign.stream.transform(validateCampaign);
  Stream<List<CampaignModel>> get streamListCampaign =>
      _listCampaign.stream.transform(validateListCampaign);

  // Set
  Function(CampaignModel) get addCampaign => _campaign.sink.add;
  Function(List<CampaignModel>) get addListCampaign => _listCampaign.sink.add;
  // Tranformers
  final validateCampaign =
      StreamTransformer<CampaignModel, CampaignModel>.fromHandlers(
          handleData: ((data, sink) {
    if (data.info.isDisbur) {
      sink.addError("Chiến dịch nổi bật đã kết thúc");
    } else {
      sink.add(data);
    }
  }));

  // Tranformers
  final validateListCampaign =
      StreamTransformer<List<CampaignModel>, List<CampaignModel>>.fromHandlers(
          handleData: ((data, sink) {
    if (data.length == 0) {
      sink.addError("Hiện tại chưa có chiến dịch nào");
    } else {
      sink.add(data);
    }
  }));
}
