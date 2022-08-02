import 'package:app_flutter_thientin/src/login/constants/api_contants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> postLogin({
    required String phone,
    required String pass,
  }) async {
    try {
      final Response response = await _dio.post(
          'http://103.110.84.245:5050/v1/login',
          data: {"phone": phone, "pass": pass});
      return response;
    } catch (e) {
      print('error request :$e');
    }
  }
}
