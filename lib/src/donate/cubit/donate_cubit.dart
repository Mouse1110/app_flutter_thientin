import 'package:app_flutter_thientin/src/donate/repository/api_repository.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../apply/model/failure_model.dart';

part 'donate_state.dart';

class DonateCubit extends Cubit<DonateState> {
  DonateCubit() : super(DonateInitial());

  final ApiDonateRepository apiRepository = ApiDonateRepository();
  // Event
  void initial() {
    emit(DonateInitial());
  }

  Future<void> fetchDonateApi(
    String accessToken, {
    required int id,
    required int amount,
  }) async {
    emit(DonateLoading());
    try {
      await apiRepository.donate(accessToken, id: id, amount: amount);
      emit(DonateLoaded(amount: amount));
    } on Failure catch (e) {
      emit(DonateError());
    } catch (e) {
      print('Error:$e');
      emit(DonateError());
    }
  }

  Future<void> fetchTotalApi(String accessToken) async {
    try {
      final String? data = await apiRepository.total(accessToken);
      emit(DonateTotalLoaded(total: data!));
    } on Failure catch (e) {
      emit(DonateError());
    } catch (e) {
      print('Error:$e');
      emit(DonateError());
    }
  }
}
