import 'package:app_flutter_thientin/src/apply/service/api_service.dart';
import 'package:app_flutter_thientin/src/create_campaign/models/campaign_models.dart';
import 'package:app_flutter_thientin/src/create_campaign/repository/api_repository.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../login/models/failure_model.dart';

part 'create_campaign_state.dart';

class CreateCampaignCubit extends Cubit<CreateCampaignState> {
  CreateCampaignCubit() : super(CreateCampaignInitial());

  CreateCampaignApiRepository apiRepository = CreateCampaignApiRepository();
  int initial = 0;
  void changePage(int i) {
    initial = i;
    emit(CreateCampaignInitial());
  }

  Future<void> fetchCreateCampaign(
    String token, {
    required CampaignRequestModel data,
  }) async {
    try {
      emit(CreateCampaignLoading());
      FormData json = FormData.fromMap(await data.toJson());
      await apiRepository.create(data: json, accessToken: token);
      emit(CreateCampaignLoaded());
    } on Failure catch (e) {
      emit(CreateCampaignError());
    } catch (e) {
      print('Error:$e');
      emit(CreateCampaignError());
    }
  }
}
