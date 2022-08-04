import 'package:app_flutter_thientin/src/apply/model/failure_model.dart';
import 'package:app_flutter_thientin/src/apply/repository/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../model/apply_model.dart';

part 'apply_state.dart';

class ApplyCubit extends Cubit<ApplyState> {
  ApplyCubit({required this.apiRepository}) : super(ApplyInitial());

  final ApiApplyRepository apiRepository;

  Future<void> fetchApplyApi() async {
    emit(ApplyLoading());
    try {
      // final ApplyOtd? applyOtd = await apiRepository.apply(
      //     formData: formData, accessToken: accessToken);
      emit(ApplyLoaded());
    } on Failure catch (e) {
      emit(ApplyError(failure: e));
    } catch (e) {
      print('Error:$e');
      emit(ApplyError(failure: Failure(message: '$e')));
    }
  }
}
