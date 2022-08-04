import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../models/campaign_model.dart';
import '../models/failure_model.dart';
import '../repository/api_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.apiRepository}) : super(HomeInitial());
  final ApiHomeRepository apiRepository;
  Future<void> fetchCampaignApi({required String accessToken}) async {
    emit(HomeLoading());
    try {
      final CampaignModel? campaign =
          await apiRepository.campaign(accessToken: accessToken);

      emit(HomeLoaded(campaign: campaign!));
    } on Failure catch (e) {
      emit(HomeError(failure: e));
    } catch (e) {
      print('Error:$e');
      emit(HomeError(failure: Failure(message: '$e')));
    }
  }
}
