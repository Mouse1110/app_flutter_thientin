part of 'login_cubit.dart';

@immutable
abstract class LoginState {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  const LoginLoaded({required this.user});
  final User user;

  @override
  List<Object> get props => [user];
}

class LoginError extends LoginState {
  final Failure failure;
  const LoginError({required this.failure});

  @override
  List<Object> get props => [failure];
}
