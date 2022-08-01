import 'package:app_flutter_thientin/src/login/models/user_model.dart';

import '../service/api_service.dart';

class ApiRepository {
  const ApiRepository({required this.apiService});
  final ApiService apiService;
  Future<User?> login() async {
    final response = await apiService.postLogin();
    if (response != null) {
      final data = response.data as dynamic;
      return User.fromMap(data['data']);
    }
    return null;
  }
}
