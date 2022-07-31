import 'package:app_flutter_thientin/src/login/constants/api_contants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> postLogin() async {
    try {
      final Response? response = await _dio.post('$baseUrl${params['login']}');
      return response;
    } catch (e) {
      print('error request :$e');
    }
  }
}
