import 'dart:convert';

import 'package:app_flutter_thientin/src/apply/service/api_service.dart';
import 'package:dio/dio.dart';

import '../model/apply_model.dart';

class ApiApplyRepository {
  ApiApplyRepository();
  final ApiService apiService = ApiService();

  Future<Map<String, dynamic>> toMap(
          List<MultipartFile> path, int campaignId) async =>
      {"files": path, "campaignId": campaignId};

  Future<List<dynamic>> file({
    required List<MultipartFile> path,
    required int campaignId,
    required String accessToken,
  }) async {
    var formData = FormData.fromMap(await toMap(path, campaignId));
    final response =
        await apiService.postFile(formData: formData, accessToken: accessToken);

    if (response != null) {
      print(response.data);
      final data = response.data as dynamic;

      return data['data'];
    }
    return [];
  }

  Future<void> approve({
    required List<Map<String, dynamic>> data,
    required int campaignId,
    required String accessToken,
  }) async {
    final response = await apiService.postApply(
        data: data, accessToken: accessToken, campaignId: campaignId);
    if (response != null) {
      print(response.data);
      final data = response.data as dynamic;
    }
  }
}
