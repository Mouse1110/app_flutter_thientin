import 'dart:async';

import 'package:app_flutter_thientin/src/home/models/campaign_model.dart';
import 'package:rxdart/rxdart.dart';

class DataValidation {
  List<CampaignModel> campaigns = [];
  final _campaign = BehaviorSubject<CampaignModel>();
  final _listCampaign = BehaviorSubject<List<CampaignModel>>();
  final _statusCampaigns = BehaviorSubject<bool>();
  final _buttonCreateCampaign = BehaviorSubject<int?>();
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
  Stream<bool> get streamButtonCreateCampaign =>
      _buttonCreateCampaign.stream.transform(validateButtonCreateCampaign);
  // Set
  Function(CampaignModel) get addCampaign => _campaign.sink.add;
  void addListCampaign(List<CampaignModel> list) {
    campaigns = list;
    statusCampaigns(true);
    addStatusCampaigns(true);
  }

  Function(bool) get addStatusCampaigns => _statusCampaigns.sink.add;
  Function(int?) get addButtonCreateCampaign => _buttonCreateCampaign.sink.add;
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

  final validateButtonCreateCampaign =
      StreamTransformer<int?, bool>.fromHandlers(handleData: ((data, sink) {
    print(data);
    if (data == 2) {
      sink.add(true);
    } else {
      sink.addError("Bạn không có quyền khởi tạo chiến dịch");
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
