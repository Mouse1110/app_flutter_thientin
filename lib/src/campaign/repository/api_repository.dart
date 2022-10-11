import '../../home/models/campaign_model.dart';
import '../services/api_service.dart';

class CampaignApiRepository {
  CampaignApiRepository();
  final ApiService apiService = ApiService();
  Future<CampaignModel?> campaign({
    required String accessToken,
    required String id,
  }) async {
    final response =
        await apiService.getCampaign(accessToken: accessToken, id: id);
    if (response != null) {
      print(response.data);
      final data = response.data as dynamic;
      return CampaignModel.fromMap(data);
    }
    return null;
  }
}
