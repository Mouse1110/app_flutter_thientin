import '../models/campaign_model.dart';
import '../service/api_service.dart';

class ApiHomeRepository {
  ApiHomeRepository();
  final ApiService apiService = ApiService();
  Future<CampaignModel?> campaign({required String accessToken}) async {
    final response = await apiService.getCampaign(accessToken: accessToken);
    if (response != null) {
      print(response.data);
      final data = response.data as dynamic;
      return CampaignModel.fromMap(data);
    }
    return null;
  }

  Future<List<CampaignModel>?> listcampaign(
      {required String accessToken}) async {
    final response = await apiService.getListCampaign(accessToken: accessToken);
    if (response != null) {
      print(response.data);
      final data = response.data as List;
      return data.map((e) => CampaignModel.fromMap(e)).toList();
    }
    return null;
  }
}
