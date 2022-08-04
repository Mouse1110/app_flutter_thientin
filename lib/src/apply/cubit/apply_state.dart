part of 'apply_cubit.dart';

abstract class ApplyState extends Equatable {
  const ApplyState();

  @override
  List<Object> get props => [];
}

class ApplyInitial extends ApplyState {}

class ApplyLoading extends ApplyState {}

class ApplyLoaded extends ApplyState {
  // const ApplyLoaded({required this.applyOtd});
  // final ApplyOtd applyOtd;

  // @override
  // List<Object> get props => [applyOtd];
}

class ApplyError extends ApplyState {
  final Failure failure;
  const ApplyError({required this.failure});

  @override
  List<Object> get props => [failure];
}
