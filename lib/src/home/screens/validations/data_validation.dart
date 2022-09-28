import 'dart:async';

import 'package:app_flutter_thientin/src/home/models/campaign_model.dart';
import 'package:rxdart/rxdart.dart';

class DataValidation {
  List<CampaignModel> campaigns = [];
  final _campaign = BehaviorSubject<CampaignModel>();
  final _listCampaign = BehaviorSubject<List<CampaignModel>>();
  final _statusCampaigns = BehaviorSubject<bool>();
  dispose() {
    _campaign.close();
    _listCampaign.close();
    _statusCampaigns.close();
  }

  //Get
  Stream<CampaignModel> get streamCampaign =>
      _campaign.stream.transform(validateCampaign);
  Stream<List<CampaignModel>> get streamListCampaign =>
      _listCampaign.stream.transform(validateListCampaign);
  Stream<bool> get streamStatusCampaigns => _statusCampaigns.stream;

  // Set
  Function(CampaignModel) get addCampaign => _campaign.sink.add;
  void addListCampaign(List<CampaignModel> list) {
    campaigns = list;
    statusCampaigns(true);
    addStatusCampaigns(true);
  }

  Function(bool) get addStatusCampaigns => _statusCampaigns.sink.add;

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

  final validateListCampaign =
      StreamTransformer<List<CampaignModel>, List<CampaignModel>>.fromHandlers(
          handleData: ((data, sink) {
    if (data.length == 0) {
      sink.addError("Hiện tại chưa có chiến dịch nào");
    } else {
      sink.add(data);
    }
  }));

  // Event
  Future<void> statusCampaigns(bool isRun) async {
    List<CampaignModel> list =
        campaigns.where((e) => e.info.isDisbur != isRun).toList();
    _listCampaign.sink.add(list);
    addStatusCampaigns(isRun);
  }
}
