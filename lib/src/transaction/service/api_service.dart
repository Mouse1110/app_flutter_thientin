import 'package:dio/dio.dart';

import '../constants/api_constants.dart';

class ApiService {
  final Dio _dio = Dio();
  Future<Response?> getListTransactionWithCampaign(
      {required int id, required String accessToken}) async {
    try {
      final Response response = await _dio.get(
        '${baseUrl}caimpain/transaction/$id',
        options: Options(
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
      );
      print(response);
      return response;
    } catch (e) {
      print('error request :$e');
      return null;
    }
  }

  Future<Response?> getInfoTransactionWithHash(
      {required String hash, required String accessToken}) async {
    try {
      final Response response = await _dio.get(
        '${baseUrl}caimpain/$hash/transaction',
        options: Options(
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
      );
      print(response.realUri);
      return response;
    } catch (e) {
      print('error request :$e');
      return null;
    }
  }
}
