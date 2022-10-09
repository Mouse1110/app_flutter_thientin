part of 'donate_cubit.dart';

abstract class DonateState extends Equatable {
  const DonateState();

  @override
  List<Object> get props => [];
}

class DonateInitial extends DonateState {}

class DonateLoading extends DonateState {}

class DonateError extends DonateState {}

class DonateLoaded extends DonateState {
  final int amount;
  const DonateLoaded({required this.amount});
  @override
  // TODO: implement props
  List<Object> get props => [amount];
}

class DonateTotalLoaded extends DonateState {
  final String total;
  const DonateTotalLoaded({required this.total});

  @override
  // TODO: implement props
  List<Object> get props => [total];
}
