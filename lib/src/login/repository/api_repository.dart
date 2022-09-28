import 'package:app_flutter_thientin/src/login/models/user_model.dart';

import '../service/api_service.dart';

class ApiRepository {
  ApiRepository();
  final ApiService apiService = ApiService();
  Future<User?> login({required String phone, required String pass}) async {
    final response = await apiService.postLogin(phone: phone, pass: pass);
    print(response);
    if (response != null) {
      final data = response.data['data'] as dynamic;
      return User.fromMap(data);
    }
    return null;
  }
}
