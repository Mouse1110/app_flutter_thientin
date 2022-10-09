part of 'proof_cubit.dart';

abstract class ProofState extends Equatable {
  const ProofState();

  @override
  List<Object> get props => [];
}

class ProofInitial extends ProofState {}

class ProofLoading extends ProofState {}

class ProofLoaded extends ProofState {
  const ProofLoaded({required this.transaction});
  final CampaignModel transaction;

  @override
  List<Object> get props => [transaction];
}
