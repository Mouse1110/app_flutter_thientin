import 'package:app_flutter_thientin/src/approve/models/form_model.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/models/failure_model.dart';
import '../repository/api_repository.dart';

part 'approve_state.dart';

class ApproveCubit extends Cubit<ApproveState> {
  ApproveCubit() : super(ApproveInitial());
  final ApproveApiRepository apiRepository = ApproveApiRepository();
  int initial = 0;
  void changePage(int i) {
    initial = i;
    emit(ApproveInitial());
  }

  Future<void> fetchListFormApi(String accessToken, {required int id}) async {
    try {
      final List<FormModel>? data =
          await apiRepository.listForm(accessToken: accessToken, id: id);
      emit(ApproveLoaded(datas: data ?? []));
    } on Failure catch (e) {
      emit(const ApproveLoaded(datas: []));
    } catch (e) {
      print('Error:$e');
      emit(const ApproveLoaded(datas: []));
    }
  }

  Future<void> fetchApproveApi(
    String accessToken, {
    required String idCampaign,
    required String idUser,
  }) async {
    try {
      emit(ApproveLoading());
      await apiRepository.approve(
          accessToken: accessToken, idCampaign: idCampaign, idUser: idUser);
      changePage(0);
    } on Failure catch (e) {
      emit(ApproveError());
    } catch (e) {
      print('Error:$e');
      emit(ApproveError());
    }
  }

  Future<void> fetchDisburApi(
    String accessToken, {
    required String idCampaign,
  }) async {
    try {
      emit(ApproveLoading());
      await apiRepository.disbur(
          accessToken: accessToken, idCampaign: idCampaign);
      emit(ApproveLoadedDisbur());
    } on Failure catch (e) {
      emit(ApproveError());
    } catch (e) {
      print('Error:$e');
      emit(ApproveError());
    }
  }

  Future<void> fetchListFormExistApi(String accessToken,
      {required int id}) async {
    try {
      final List<FormModel>? data =
          await apiRepository.listFormExist(accessToken: accessToken, id: id);
      emit(ApproveLoadedExist(datas: data ?? []));
    } on Failure catch (e) {
      emit(ApproveError());
      emit(const ApproveLoadedExist(datas: []));
    } catch (e) {
      print('Error:$e');
      emit(const ApproveLoadedExist(datas: []));
    }
  }
}
