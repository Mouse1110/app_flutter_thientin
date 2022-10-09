import 'package:app_flutter_thientin/src/transaction/cubit/transaction_state.dart';
import 'package:app_flutter_thientin/src/transaction/models/failure_model.dart';
import 'package:app_flutter_thientin/src/transaction/models/info_transaction_model.dart';
import 'package:app_flutter_thientin/src/transaction/models/transaction_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../reponsitory/api_reponsitory.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());
  final ApiTransactionRepository apiRepository = ApiTransactionRepository();
  int page = 0;
  int saveTransaction = 0;

  Future<void> fetchTransactionApi(
    String accessToken, {
    required int id,
  }) async {
    emit(TransactionLoading());
    try {
      final List<TransactionModel>? transaction = await apiRepository
          .listTransactionWithCampaign(accessToken: accessToken, id: id);
      emit(TransactionLoaded(transaction: transaction!));
    } on Failure catch (e) {
      emit(TransactionError(failure: e));
    } catch (e) {
      print('Error:$e');
      emit(TransactionError(failure: Failure(message: '$e')));
    }
  }

  Future<void> fetchInfoTransactionApi(
    String accessToken, {
    required String hash,
  }) async {
    try {
      final InfoTransactionModel? data = await apiRepository
          .infoTransactionWithHash(accessToken: accessToken, hash: hash);
      emit(InfoTransactionLoaded(data: data!));
    } on Failure catch (e) {
      emit(TransactionError(failure: e));
    } catch (e) {
      print('Error:$e');
      emit(TransactionError(failure: Failure(message: '$e')));
    }
  }

  Future<void> changePage(int page) async {
    this.page = page;
    emit(TransactionLoading());
  }

  void transactionSave() {
    ++saveTransaction;
  }
}
