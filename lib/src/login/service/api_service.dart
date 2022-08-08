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
      print('error request ${response.data}');
      return response;
    } on DioError catch (e) {
      print(e.response!.data);
      throw Exception(e.response!.data["message"]);
    } catch (e) {
      print('error request :$e');
      throw Exception(e);
    }
  }
}
