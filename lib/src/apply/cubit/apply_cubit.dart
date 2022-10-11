import 'package:app_flutter_thientin/src/apply/model/failure_model.dart';
import 'package:app_flutter_thientin/src/apply/repository/api_repository.dart';
import 'package:dio/dio.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'apply_state.dart';

class ApplyCubit extends Cubit<ApplyState> {
  ApplyCubit() : super(ApplyInitial());

  final ApiApplyRepository apiRepository = ApiApplyRepository();

  Future<void> fetchApplyApi(
    String accessToken, {
    required List<Map<String, dynamic>> data,
    required int campaignId,
  }) async {
    try {
      print(data.length);
      await apiRepository.approve(
          accessToken: accessToken, data: data, campaignId: campaignId);
      emit(ApplyLoaded());
    } on Failure catch (e) {
      emit(ApplyError(failure: e));
    } catch (e) {
      print('Error:$e');
      emit(ApplyError(failure: Failure(message: '$e')));
    }
  }

  Future<void> fetchFileApi(
    String accessToken, {
    required List<MultipartFile> path,
    required int campaignId,
  }) async {
    emit(ApplyLoading());
    try {
      List<dynamic> data = await apiRepository.file(
          accessToken: accessToken, path: path, campaignId: campaignId);
      emit(ApplyLoadedFile(data: data));
    } on Failure catch (e) {
      emit(ApplyError(failure: e));
    } catch (e) {
      print('Error:$e');
      emit(ApplyError(failure: Failure(message: '$e')));
    }
  }
}
