import '../models/transaction_model.dart';
import '../service/api_service.dart';

class ApiTransactionRepository {
  ApiTransactionRepository();
  final ApiService apiService = ApiService();

  Future<TransactionModel?> transaction(
      {required String accessToken, required String id}) async {
    print('=-=============1=========');
    final response =
        await apiService.getTransactionIndex(accessToken: accessToken, id: id);
    if (response != null) {
      print(response.data);
      final data = response.data as dynamic;
      return TransactionModel.fromMap(data);
    }
    return null;
  }
}
