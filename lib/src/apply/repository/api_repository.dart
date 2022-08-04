import 'package:app_flutter_thientin/src/apply/service/api_service.dart';
import 'package:dio/dio.dart';

import '../model/apply_model.dart';

class ApiApplyRepository {
  ApiApplyRepository();
  final ApiService apiService = ApiService();

  Future<Map<String, dynamic>> toMap(
          List<MultipartFile> path, int campaignId) async =>
      {"files": path, "campaignId": campaignId};

  Future<List<dynamic>> apply({
    required List<Apply> imageUpload,
    required int campaignId,
    required String accessToken,
  }) async {
    List<MultipartFile> path = [];
    for (int i = 0; i < imageUpload.length; i++) {
      if (imageUpload[i].type != 'txt') {
        print(imageUpload[i].path);
        path.add(
          await MultipartFile.fromFile(imageUpload[i].path,
              filename: 'files.png'),
        );
      }
    }
    if (path.length == 0) return [];
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

  // Future<ApplyOtd?> approve({
  //   required List<Map<String, dynamic>> data,
  //   required int campaignId,
  //   required String accessToken,
  // }) async {
  //   final response = await apiService.postApply(
  //       data: data, accessToken: accessToken, campaignId: campaignId);
  //   if (response != null) {
  //     print(response.data);
  //     final data = response.data as dynamic;
  //     return ApplyOtd.fromMap(data);
  //   }
  //   return null;
  // }
}
