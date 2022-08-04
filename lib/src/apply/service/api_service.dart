import 'package:app_flutter_thientin/src/login/constants/api_contants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> postFile({
    required FormData formData,
    required String accessToken,
  }) async {
    try {
      final Response response = await _dio.post('$baseUrl${params['upload']}',
          data: formData,
          options: Options(headers: {
            "Authorization": "Bearer $accessToken",
          }));
      return response;
    } catch (e) {
      print('error request :$e');
      return null;
    }
  }

  Future<Response?> postApply({
    required List<Map<String, dynamic>> data,
    required int campaignId,
    required String accessToken,
  }) async {
    try {
      final Response response = await _dio.post(
        '$baseUrl${params['form']}',
        data: {'list': data, 'campaignId': campaignId},
        options: Options(
          headers: {
            "Authorization": "Bearer $accessToken",
          },
        ),
      );
      return response;
    } catch (e) {
      print('error request :$e');
      return null;
    }
  }
}
