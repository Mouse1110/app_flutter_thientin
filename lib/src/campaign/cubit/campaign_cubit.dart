import 'package:app_flutter_thientin/src/home/models/campaign_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'campaign_state.dart';

class CampaignCubit extends Cubit<CampaignState> {
  CampaignCubit() : super(CampaignInitial());
}
