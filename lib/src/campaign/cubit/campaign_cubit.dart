import 'package:app_flutter_thientin/src/campaign/repository/api_repository.dart';
import 'package:app_flutter_thientin/src/home/cubit/home_cubit.dart';
import 'package:app_flutter_thientin/src/home/models/campaign_model.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/models/failure_model.dart';

part 'campaign_state.dart';

class CampaignCubit extends Cubit<CampaignState> {
  CampaignCubit() : super(CampaignInitial());
  CampaignApiRepository apiRepository = CampaignApiRepository();
  Future<void> fetchCampaignApi(
    String accessToken, {
    required String id,
  }) async {
    emit(CampaignLoading());
    try {
      final CampaignModel? data =
          await apiRepository.campaign(accessToken: accessToken, id: id);
      emit(CampaignLoaded(campaign: data!));
    } on Failure catch (e) {
      emit(CampaignError());
    } catch (e) {
      print('Error:$e');
      emit(CampaignError());
    }
  }
}
