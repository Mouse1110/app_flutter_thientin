import 'package:dio/dio.dart';

import '../constants/api_constants.dart';

class ApiService {
  final Dio _dio = Dio();
  Future<Response?> getTransactionIndex(
      {required String id, required String accessToken}) async {
    try {
      final Response response = await _dio.get(
        '${baseUrl}caimpain/$id/transaction',
        options: Options(
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json",
            // "Authorization": "Bearer $accessToken",
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
