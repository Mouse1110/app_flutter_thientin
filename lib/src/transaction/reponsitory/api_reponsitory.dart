import 'package:app_flutter_thientin/src/transaction/models/info_transaction_model.dart';

import '../models/transaction_model.dart';
import '../service/api_service.dart';

class ApiTransactionRepository {
  ApiTransactionRepository();
  final ApiService apiService = ApiService();

  Future<List<TransactionModel>?> listTransactionWithCampaign({
    required String accessToken,
    required int id,
  }) async {
    final response = await apiService.getListTransactionWithCampaign(
        accessToken: accessToken, id: id);
    if (response != null) {
      print(response.data);
      final data = response.data as dynamic;
      return (data as List).map((e) => TransactionModel.fromJson(e)).toList();
    }
    return null;
  }

  Future<InfoTransactionModel?> infoTransactionWithHash({
    required String accessToken,
    required String hash,
  }) async {
    final response = await apiService.getInfoTransactionWithHash(
        accessToken: accessToken, hash: hash);
    if (response != null) {
      print(response.data);
      final data = response.data as dynamic;
      return InfoTransactionModel.fromJson(data);
    }
    return null;
  }
}
