import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/campaign_model.dart';
import '../models/failure_model.dart';
import '../repository/api_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.apiRepository}) : super(HomeInitial());
  final ApiHomeRepository apiRepository;

  // Event
  Future<void> fetchCampaignApi({required String accessToken}) async {
    try {
      final CampaignModel? data =
          await apiRepository.campaign(accessToken: accessToken);
      emit(HomeLoadedCampaign(campaign: data!));
    } on Failure catch (e) {
      emit(HomeError(failure: e));
    } catch (e) {
      print('Error:$e');
      emit(HomeError(failure: Failure(message: '$e')));
    }
  }

  Future<void> fetchListCampaignApi({required String accessToken}) async {
    try {
      final List<CampaignModel>? data =
          await apiRepository.listcampaign(accessToken: accessToken);
      emit(HomeLoadedListCampaign(listCampaign: data!));
    } on Failure catch (e) {
      emit(HomeError(failure: e));
    } catch (e) {
      print('Error:$e');
      emit(HomeError(failure: Failure(message: '$e')));
    }
  }
}
