part of 'create_campaign_cubit.dart';

abstract class CreateCampaignState extends Equatable {
  const CreateCampaignState();

  @override
  List<Object> get props => [];
}

class CreateCampaignInitial extends CreateCampaignState {}

class CreateCampaignLoading extends CreateCampaignState {}

class CreateCampaignLoaded extends CreateCampaignState {}

class CreateCampaignError extends CreateCampaignState {}
