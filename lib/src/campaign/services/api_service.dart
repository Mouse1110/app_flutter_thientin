import 'package:dio/dio.dart';

import '../constants/api_constant.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> getCampaign(
      {required String accessToken, required String id}) async {
    try {
      final Response response = await _dio.get('${baseUrl}caimpain/find/$id',
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
}
