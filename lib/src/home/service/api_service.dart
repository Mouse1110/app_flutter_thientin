import 'package:app_flutter_thientin/src/home/constants/api_constant.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> getCampaign({
    required String accessToken,
  }) async {
    try {
      final Response response =
          await _dio.get('$baseUrl${params['outstanding']}',
              options: Options(
                headers: {
                  "Content-Type": "application/x-www-form-urlencoded",
                  "Accept": "application/json",
                  "Authorization": "Bearer $accessToken",
                },
              ));
      print(response);
      return response;
    } on DioError catch (e) {
      print(e.response!.data);
      throw Exception(e.response!.data["message"]);
    } catch (e) {
      print('error request :$e');
      return null;
    }
  }

  Future<Response?> getListCampaign({
    required String accessToken,
  }) async {
    try {
      final Response response = await _dio.get('$baseUrl${params['list']}',
          options: Options(
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
              "Accept": "application/json",
              "Authorization": "Bearer $accessToken",
            },
          ));
      return response;
    } on DioError catch (e) {
      print(e.response!.data);
      throw Exception(e.response!.data["message"]);
    } catch (e) {
      print('error request :$e');
      return null;
    }
  }
}
