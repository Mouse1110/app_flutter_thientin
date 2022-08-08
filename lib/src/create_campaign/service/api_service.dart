import 'package:app_flutter_thientin/src/create_campaign/constants/api_contants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> postLogin({
    required FormData data,
    required String accessToken,
  }) async {
    try {
      final Response response = await _dio.post(
        '$baseUrl${params['create']}',
        data: data,
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
