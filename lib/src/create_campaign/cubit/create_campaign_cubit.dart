import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_campaign_state.dart';

class CreateCampaignCubit extends Cubit<CreateCampaignState> {
  CreateCampaignCubit() : super(CreateCampaignInitial());
  int initial = 1;
  void changePage(int i) {
    initial = i;
    emit(CreateCampaignInitial());
  }
}
