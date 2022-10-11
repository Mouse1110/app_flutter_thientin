import 'package:app_flutter_thientin/src/create_campaign/service/api_service.dart';
import 'package:dio/dio.dart';

class CreateCampaignApiRepository {
  CreateCampaignApiRepository();
  final ApiService apiService = ApiService();
  Future<bool> create({
    required FormData data,
    required String accessToken,
  }) async {
    final response =
        await apiService.postLogin(data: data, accessToken: accessToken);
    if (response != null) {
      print(response.data);
      final data = response.data as dynamic;
      return true;
    }
    return false;
  }
}
