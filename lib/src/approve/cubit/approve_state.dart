part of 'approve_cubit.dart';

abstract class ApproveState extends Equatable {
  const ApproveState();

  @override
  List<Object> get props => [];
}

class ApproveInitial extends ApproveState {}

class ApproveLoading extends ApproveState {}

class ApproveError extends ApproveState {}

class ApproveLoaded extends ApproveState {
  final List<FormModel> datas;
  const ApproveLoaded({required this.datas});

  @override
  List<Object> get props => [datas];
}

class ApproveLoadedDisbur extends ApproveState {}

class ApproveLoadedExist extends ApproveState {
  final List<FormModel> datas;
  const ApproveLoadedExist({required this.datas});

  @override
  List<Object> get props => [datas];
}
