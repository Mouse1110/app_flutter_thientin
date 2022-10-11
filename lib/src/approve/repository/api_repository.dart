import '../models/form_model.dart';
import '../services/api_service.dart';

class ApproveApiRepository {
  ApproveApiRepository();
  final ApiService apiService = ApiService();

  Future<List<FormModel>?> listForm(
      {required String accessToken, required int id}) async {
    final response =
        await apiService.getListForm(accessToken: accessToken, id: id);
    if (response != null) {
      print(response.data);
      final data = response.data as List;
      return data.map((e) => FormModel.fromJson(e)).toList();
    }
    return null;
  }

  Future<void> approve({
    required String accessToken,
    required String idCampaign,
    required String idUser,
  }) async {
    final response = await apiService.postApprove(
        accessToken: accessToken, idCampaign: idCampaign, idUser: idUser);
    if (response != null) {
      print(response.data);
    }
  }

  Future<void> disbur({
    required String accessToken,
    required String idCampaign,
  }) async {
    final response = await apiService.postDisbur(
        accessToken: accessToken, idCampaign: idCampaign);
    if (response != null) {
      print(response.data);
    }
  }

  Future<List<FormModel>?> listFormExist(
      {required String accessToken, required int id}) async {
    final response =
        await apiService.getListFormExist(accessToken: accessToken, id: id);
    if (response != null) {
      print(response.data);
      final data = response.data as List;
      return data.map((e) => FormModel.fromJson(e)).toList();
    }
    return null;
  }
}
