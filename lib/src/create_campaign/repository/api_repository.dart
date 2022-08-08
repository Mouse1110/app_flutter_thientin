import 'package:app_flutter_thientin/src/create_campaign/models/campaign_models.dart';
import 'package:app_flutter_thientin/src/create_campaign/service/api_service.dart';
import 'package:dio/dio.dart';

class ApiRepository {
  const ApiRepository({required this.apiService});
  final ApiService apiService;
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
