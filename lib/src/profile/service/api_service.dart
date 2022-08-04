import 'package:app_flutter_thientin/src/login/constants/api_contants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> getInfoUser() async {
    try {
      final Response response = await _dio.get('$baseUrl${params[' ']}');
      return response;
    } catch (e) {
      print('error request :$e');
      return null;
    }
  }
}
