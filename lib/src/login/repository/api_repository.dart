import 'package:app_flutter_thientin/src/login/models/user_model.dart';

import '../service/api_service.dart';

class ApiRepository {
  const ApiRepository({required this.apiService});
  final ApiService apiService;
  Future<User?> login({required String phone, required String pass}) async {
    final response = await apiService.postLogin(phone: phone, pass: pass);
    if (response != null) {
      print(response.data);
      final data = response.data as dynamic;
      return User.fromMap(data);
    }
    return null;
  }
}
