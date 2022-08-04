import 'package:app_flutter_thientin/src/login/constants/api_contants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> postLogin({
    required String phone,
    required String pass,
  }) async {
    try {
      final Response response = await _dio.post('$baseUrl${params['login']}',
          data: {"phone": phone, "pass": pass});
      return response;
    } catch (e) {
      print('error request :$e');
      return null;
    }
  }

  Future<Response?> postSignup({
    required String phone,
    required String email,
    required String pass,
  }) async {
    try {
      final Response response =
          await _dio.post('$baseUrl${params['signup']}', data: {});
      return response;
    } catch (e) {
      print('error request :$e');
      return null;
    }
  }
}
