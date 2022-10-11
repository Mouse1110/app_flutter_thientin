import 'package:dio/dio.dart';

import '../constants/api_constant.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> postDonate({
    required String accessToken,
    required int id,
    required int amount,
  }) async {
    try {
      print(amount);
      final Response response = await _dio.post('${baseUrl}action/charity/$id',
          data: {"total": amount},
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

  Future<Response?> getTotal({
    required String accessToken,
  }) async {
    try {
      final Response response = await _dio.get('${baseUrl}user/count-wallet',
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
