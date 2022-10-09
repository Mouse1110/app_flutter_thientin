import '../services/api_services.dart';

class ApiDonateRepository {
  ApiDonateRepository();
  final ApiService apiService = ApiService();
  Future<bool?> donate(
    String accessToken, {
    required int id,
    required int amount,
  }) async {
    final response = await apiService.postDonate(
        accessToken: accessToken, id: id, amount: amount);
    if (response != null) {
      print(response.data);
      final data = response.data as dynamic;
      return true;
    }
    return null;
  }

  Future<String?> total(String accessToken) async {
    final response = await apiService.getTotal(accessToken: accessToken);
    if (response != null) {
      print(response.data);
      final data = response.data as dynamic;
      return data;
    }
    return null;
  }
}
