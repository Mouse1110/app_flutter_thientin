part of 'campaign_cubit.dart';

abstract class CampaignState extends Equatable {
  const CampaignState();

  @override
  List<Object> get props => [];
}

class CampaignInitial extends CampaignState {}

class CampaignLoaded extends CampaignState {
  final CampaignModel campaign;
  const CampaignLoaded({required this.campaign});

  @override
  List<Object> get props => [campaign];
}

class CampaignFailer extends CampaignState {}
