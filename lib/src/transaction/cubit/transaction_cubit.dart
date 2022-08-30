import 'package:app_flutter_thientin/src/transaction/cubit/transaction_state.dart';
import 'package:app_flutter_thientin/src/transaction/models/failure_model.dart';
import 'package:app_flutter_thientin/src/transaction/models/transaction_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../reponsitory/api_reponsitory.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit({required this.apiRepository}) : super(TransactionInitial());
  final ApiTransactionRepository apiRepository;

  Future<void> fetchTransactionApi(
      {required String accessToken, required String id}) async {
    emit(TransactionLoading());
    try {
      final TransactionModel? transaction =
          await apiRepository.transaction(accessToken: accessToken, id: id);
      emit(TransactionLoaded(transaction: transaction!));
    } on Failure catch (e) {
      emit(TransactionError(failure: e));
    } catch (e) {
      print('Error:$e');
      emit(TransactionError(failure: Failure(message: '$e')));
    }
  }
}
